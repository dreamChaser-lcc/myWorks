#include <ESP8266WiFi.h>   //安装esp8266arduino开发环境
#include <PubSubClient.h>  //安装PubSubClient库
#include <ArduinoJson.h>   //json  V5版本
#include "aliyun_mqtt.h"
//需要安装crypto库

#define LED     D4
#define WIFI_SSID        "H_W"//替换自己的WIFI
#define WIFI_PASSWD      "lfc123.com"//替换自己的WIFI

#define PRODUCT_KEY      "a17rRRuNTCD" //替换自己的PRODUCT_KEY
#define DEVICE_NAME      "aliServer" //替换自己的DEVICE_NAME
#define DEVICE_SECRET    "f53f832887bc6bb2e45d417f569a09a0"//替换自己的DEVICE_SECRET

#define DEV_VERSION       "S-TH-WIFI-v1.0-20190220"        //固件版本信息

#define ALINK_BODY_FORMAT         "{\"id\":\"123\",\"version\":\"1.0\",\"method\":\"%s\",\"params\":%s}"
#define ALINK_TOPIC_PROP_POST     "/sys/" PRODUCT_KEY "/" DEVICE_NAME "/thing/event/property/post"
#define ALINK_TOPIC_PROP_POSTRSP  "/sys/" PRODUCT_KEY "/" DEVICE_NAME "/thing/event/property/post_reply"
#define ALINK_TOPIC_PROP_SET      "/sys/" PRODUCT_KEY "/" DEVICE_NAME "/thing/service/property/set"
#define ALINK_METHOD_PROP_POST    "thing.event.property.post"
#define ALINK_TOPIC_DEV_INFO      "/ota/device/inform/" PRODUCT_KEY "/" DEVICE_NAME ""    
#define ALINK_VERSION_FROMA      "{\"id\": 123,\"params\": {\"version\": \"%s\"}}"

#define ALLNK_TOPIC_SUB           "/a17rRRuNTCD/aliServer/user/test"
unsigned long lastMs = 0;

WiFiClient   espClient;
PubSubClient mqttClient(espClient);

void init_wifi(const char *ssid, const char *password)      //连接WiFi
{
    WiFi.mode(WIFI_STA);
    WiFi.begin(ssid, password);
    while (WiFi.status() != WL_CONNECTED)
    {
        Serial.println("WiFi does not connect, try again ...");
        delay(500);
    }

    Serial.println("Wifi is connected.");
    Serial.println("IP address: ");
    Serial.println(WiFi.localIP());
}

void mqtt_callback(char *topic, byte *payload, unsigned int length) //mqtt回调函数
{
    Serial.println("数据开始");
    Serial.print("Message arrived [");
    Serial.print(topic);            //topic地址，例如=>/a17rRRuNTCD/aliServer/user/test
    Serial.print("] ");
    payload[length] = '\0';
    Serial.println((char *)payload);
   // https://arduinojson.org/v5/assistant/  json数据解析网站

    
    Serial.println("   ");
  Serial.println((char *)payload);
   Serial.println("   ");
    if (strstr(topic, ALLNK_TOPIC_SUB))     //判断订阅到的topic是否是设置的 ALLNK_TOPIC_SUB(/a17rRRuNTCD/aliServer/user/test)
    {
        StaticJsonBuffer<100> jsonBuffer;
        JsonObject &root = jsonBuffer.parseObject(payload);
        int params_LightSwitch = root["params"]["LightSwitch"];     //发布端需要发送消息{"params":{"LightSwitch":1}}或者0才能接收到
//        Serial.print("lcc--");
//        Serial.println(params_LightSwitch);
        if(params_LightSwitch==0)       //接收到的开关参数是1
        {Serial.println("led off");
        digitalWrite(LED, HIGH); 
        }
        else
        {Serial.println("led on");
        digitalWrite(LED, LOW); }
        if (!root.success())
        {
            Serial.println("parseObject() failed");
            return;
        }
    }
}
void mqtt_version_post()  //向阿里云发送主题消息
{
    char param[512];
    char jsonBuf[1024];

    sprintf(param, "{\"MotionAlarmState\":%d}", digitalRead(13));
    sprintf(param, "{\"id\": 123,\"params\": {\"version\": \"%s\"}}", DEV_VERSION);
   // sprintf(jsonBuf, ALINK_BODY_FORMAT, ALINK_METHOD_PROP_POST, param);
    Serial.println(param);
    mqttClient.publish(ALINK_TOPIC_DEV_INFO, param);   //发布消息
}
void mqtt_check_connect()
{
    while (!mqttClient.connected())//
    {
        while (connect_aliyun_mqtt(mqttClient, PRODUCT_KEY, DEVICE_NAME, DEVICE_SECRET))
        {
            Serial.println("MQTT connect succeed!");
            //client.subscribe(ALINK_TOPIC_PROP_POSTRSP);
            mqttClient.subscribe(ALLNK_TOPIC_SUB);
            
            Serial.println("subscribe done");
            mqtt_version_post();
        }
    }
    
}

void mqtt_interval_post()
{
    char param[512];
    char jsonBuf[1024];

    sprintf(param, "{\"MotionAlarmState\":%d}", digitalRead(13));
    //上传的数据值，下列上传开关值和温度值随机数，
    sprintf(param, "{\"LightSwitch\":%d,\"CurrentTemperature\":%d}", digitalRead(LED),random(0,55));
    sprintf(jsonBuf, ALINK_BODY_FORMAT, ALINK_METHOD_PROP_POST, param);
    Serial.println(jsonBuf);
    mqttClient.publish(ALINK_TOPIC_PROP_POST, jsonBuf);
}


void setup()
{

   

    pinMode(LED, OUTPUT);
    /* initialize serial for debugging */
    Serial.begin(115200);

    Serial.println("Demo Start");

    init_wifi(WIFI_SSID, WIFI_PASSWD);

    mqttClient.setCallback(mqtt_callback);
}

// the loop function runs over and over again forever
void loop()
{
    if (millis() - lastMs >= 5000)  //5S
    {
        lastMs = millis();
        mqtt_check_connect();
        /* Post */        
        mqtt_interval_post();
    }

    mqttClient.loop();

   
}
