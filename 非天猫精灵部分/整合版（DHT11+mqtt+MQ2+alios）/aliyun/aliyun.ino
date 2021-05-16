#include <ESP8266WiFi.h>   //安装esp8266arduino开发环境
#include <PubSubClient.h>  //安装PubSubClient库
#include <ArduinoJson.h>   //json  V5版本
#include "aliyun_mqtt.h"
//需要安装crypto库

//两个传感器需要导的头文件及宏定义
#include <dht11.h> //引用dht11库文件，使得下面可以调用相关参数
#define DHT11PIN D6 //DHT11PIN 5 定义温湿度针脚号为5号引脚(即D1)
#define Sensor_AO A0  //MQ-2的AO
#define Sensor_DO 10 //MQ-2的DO

#define BUZZER D3         //蜂鸣器
#define LED   D5
#define RELAY D7          //即FanSwitch
#define WIFI_SSID        "H_W"//替换的WIFI
#define WIFI_PASSWD      "lfc123.com"//替换的WIFI

#define PRODUCT_KEY      "a17rRRuNTCD" //替换自己的PRODUCT_KEY
#define DEVICE_NAME      "aliServer" //替换自己的DEVICE_NAME
#define DEVICE_SECRET    "f53f832887bc6bb2e45d417f569a09a0"  //替换自己的DEVICE_SECRET

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

int tem,hum,smoke; //分别为温度，湿度，烟雾值 
unsigned int sensorValue = 0;

int flag=0; //蜂鸣器

dht11 DHT11; //实例化一个DHT11对象
WiFiClient   espClient;
PubSubClient mqttClient(espClient);

void init_wifi(const char *ssid, const char *password)      //连接WiFi
{
    WiFi.mode(WIFI_STA);
    WiFi.begin(ssid, password);
    while (WiFi.status() != WL_CONNECTED)
    {
        Serial.println("WiFi does not connect, try again ...");
        digitalWrite(LED_BUILTIN, LOW);
        delay(500);                      
        digitalWrite(LED_BUILTIN, HIGH); 
        delay(500);    
    }
    digitalWrite(LED_BUILTIN,LOW);
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
        int params_FanSwitch = root["params"]["FanSwitch"];
        Serial.print("lcc--");
        Serial.print(params_FanSwitch);
        Serial.println(params_FanSwitch);
        if(params_LightSwitch==0)       //接收到的开关参数是1
        {
          Serial.println("led off");
          digitalWrite(LED, LOW); 
        }
        else if(params_LightSwitch==1)
        {
          Serial.println("led on");
          digitalWrite(LED, HIGH); 
        }
        if(params_FanSwitch==0)       
        {
          Serial.println("relay off");
          digitalWrite(RELAY, HIGH); 
        }
        else if(params_FanSwitch==1)  
        {
          Serial.println("relay on");
          digitalWrite(RELAY, LOW); 
        }
        
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

void mqtt_interval_post() //上传函数
{
    char param[512];
    char jsonBuf[1024];
    MQ_2();
    DHT();
//    int FanSwitch = 1;
    Serial.print("Sensor AD Value = ");
    Serial.println(smoke);
    delay(2000);
    sprintf(param, "{\"MotionAlarmState\":%d}", digitalRead(13));
    //上传的数据值，下列上传开关值和温度值，
    sprintf(param, "{\"LightSwitch\":%d,\"CurrentTemperature\":%d,\"SmokeSensorState\":%d,\"RoomHumidity\":%d,\"FanSwitch\":%d}", digitalRead(LED),tem,smoke,hum,!digitalRead(RELAY)); 
    sprintf(jsonBuf, ALINK_BODY_FORMAT, ALINK_METHOD_PROP_POST, param);
    Serial.println(jsonBuf);
    mqttClient.publish(ALINK_TOPIC_PROP_POST, jsonBuf);
}
//---下面两个传感器
void MQ_2(){
    smoke = analogRead(Sensor_AO); //读取IODe
}
void DHT(){
  int chk = DHT11.read(DHT11PIN);                 //将读取到的值赋给chk
   tem=(float)DHT11.temperature;               //将温度值赋值给tem
   hum=(float)DHT11.humidity;                   //将湿度值赋给hum
}
void setup()
{
     //DHT11引脚与MQ-2 DO引脚初始化
    pinMode(DHT11PIN,OUTPUT);                       //定义输出口
    pinMode(Sensor_DO, INPUT);
    pinMode(LED_BUILTIN, OUTPUT); //wifi指示灯
    pinMode(LED, OUTPUT);   //LED灯
//    digitalWrite(LED,LOW);  
    pinMode(BUZZER,OUTPUT);   //蜂鸣器
    digitalWrite(BUZZER,HIGH); //初始化为高电平
    pinMode(RELAY,OUTPUT);  //继电器
    digitalWrite(RELAY,HIGH);
    /* initialize serial for debugging */
    Serial.begin(115200);
    Serial.println("Demo Start"); 
    init_wifi(WIFI_SSID, WIFI_PASSWD);

    mqttClient.setCallback(mqtt_callback);
}

// the loop function runs over and over again forever
void loop()
{
    if(smoke>800&&flag==0)   //烟雾超标蜂鸣器低电平触发
    {
        Serial.println("超标了");
        digitalWrite(BUZZER,LOW);
         Serial.println(BUZZER);
        delay(500);
        flag = 1;
    }
    else if(smoke<800&&flag==1){
//      Serial.println("不超标了");
      digitalWrite(BUZZER,HIGH);
      flag=0;
    }
    if (millis() - lastMs >= 5000)  //5S
    {
        lastMs = millis();
        mqtt_check_connect();
        /* Post */        
        mqtt_interval_post();
    }
    mqttClient.loop();
}
