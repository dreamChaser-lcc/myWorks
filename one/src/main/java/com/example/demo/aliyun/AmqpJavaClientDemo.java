package com.example.demo.aliyun;
import java.net.URI;
import java.text.SimpleDateFormat;
import java.util.Hashtable;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import javax.jms.Connection;
import javax.jms.ConnectionFactory;
import javax.jms.Destination;
import javax.jms.Message;
import javax.jms.MessageConsumer;
import javax.jms.MessageListener;
import javax.jms.MessageProducer;
import javax.jms.Session;
import javax.naming.Context;
import javax.naming.InitialContext;


import net.sf.json.JSONObject;
import org.apache.commons.codec.binary.Base64;
import org.apache.qpid.jms.JmsConnection;
import org.apache.qpid.jms.JmsConnectionListener;
import org.apache.qpid.jms.message.JmsInboundMessageDispatch;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class AmqpJavaClientDemo {

    private final static Logger logger = LoggerFactory.getLogger(AmqpJavaClientDemo.class);

    //业务处理异步线程池，线程池参数可以根据您的业务特点调整；或者您也可以用其他异步方式处理接收到的消息
    private final static ExecutorService executorService = new ThreadPoolExecutor(
            Runtime.getRuntime().availableProcessors(),
            Runtime.getRuntime().availableProcessors() * 2, 60, TimeUnit.SECONDS,
            new LinkedBlockingQueue<>(50000));

    public static void main(String[] args) throws Exception {
        //参数说明：AMQP客户端接入说明。
//        aliDao.insert("123","123");
        //设备阿里云平台三元组的绑定，完成消息的订阅
        String accessKey = "LTAI4G9XSXzqzs5y5EFGtnuZ";
        String accessSecret = "wBje6OFnvISPfTn35MeT1kVNANIWq5";
        String consumerGroupId = "DEFAULT_GROUP";                         //去服务端订阅页面的消费组列表查
        long timeStamp = System.currentTimeMillis();
        //签名方法：支持hmacmd5，hmacsha1和hmacsha256
        String signMethod = "hmacsha1";
        //控制台服务端订阅中消费组状态页客户端ID一栏将显示clientId参数。
        //建议使用机器UUID、MAC地址、IP等唯一标识等作为clientId。便于您区分识别不同的客户端。
        String clientId = "lcc";  //随意取

        //UserName组装方法：AMQP客户端接入说明。
        String userName = clientId + "|authMode=aksign"
                + ",signMethod=" + signMethod
                + ",timestamp=" + timeStamp
                + ",authId=" + accessKey
                + ",consumerGroupId=" + consumerGroupId
                + "|";
        //password组装方法：AMQP客户端接入说明。
        String signContent = "authId=" + accessKey + "&timestamp=" + timeStamp;
        String password = doSign(signContent,accessSecret, signMethod);
        //按照qpid-jms的规范，组装连接URL。
        //麻烦看看这里的注释，用户id点击右上角的头像，进入个人信息页面查询，你的地区id(我的是zn-shanghai)
        String connectionUrl = "failover:(amqps://1986283062661618.iot-amqp.cn-shanghai.aliyuncs.com:5671?amqp.idleTimeout=80000)"
                + "?failover.reconnectDelay=30";

        Hashtable<String, String> hashtable = new Hashtable<>();
        hashtable.put("connectionfactory.SBCF",connectionUrl);
        hashtable.put("queue.QUEUE", "default");
        hashtable.put(Context.INITIAL_CONTEXT_FACTORY, "org.apache.qpid.jms.jndi.JmsInitialContextFactory");
        Context context = new InitialContext(hashtable);
        ConnectionFactory cf = (ConnectionFactory)context.lookup("SBCF");
        Destination queue = (Destination)context.lookup("QUEUE");
        // Create Connection
        Connection connection = cf.createConnection(userName, password);
        ((JmsConnection) connection).addConnectionListener(myJmsConnectionListener);
        // Create Session
        // Session.CLIENT_ACKNOWLEDGE: 收到消息后，需要手动调用message.acknowledge()
        // Session.AUTO_ACKNOWLEDGE: SDK自动ACK（推荐）
        Session session = connection.createSession(false, Session.AUTO_ACKNOWLEDGE);
        connection.start();
        // Create Receiver Link
        MessageConsumer consumer = session.createConsumer(queue);
        consumer.setMessageListener(messageListener);
    }

    public static MessageListener messageListener = new MessageListener() {
        @Override
        public void onMessage(Message message) {
            try {
                //1.收到消息之后一定要ACK
                // 推荐做法：创建Session选择Session.AUTO_ACKNOWLEDGE，这里会自动ACK。
                // 其他做法：创建Session选择Session.CLIENT_ACKNOWLEDGE，这里一定要调message.acknowledge()来ACK。
                // message.acknowledge();
                //2.建议异步处理收到的消息，确保onMessage函数里没有耗时逻辑。
                // 如果业务处理耗时过程过长阻塞住线程，可能会影响SDK收到消息后的正常回调。
                executorService.submit(() -> processMessage(message));
            } catch (Exception e) {
//                logger.error("submit task occurs exception ", e);
                System.out.println(e);
            }
        }
    };

    /**
     * 在这里处理您
     *
     * 收到消息后的具体业务逻辑。
     */
    private static void processMessage(Message message) {
        try {
            byte[] body = message.getBody(byte[].class);
            String content = new String(body);
            String topic = message.getStringProperty("topic");
            String messageId = message.getStringProperty("messageId");
//            logger.info("receive message"
//                    + ", topic = " + topic
//                    + ", messageId = " + messageId
//                    + ", content = " + content);

//            System.out.println("massage==>"+topic);
//            System.out.println("massage==>"+messageId);
//             System.out.println("massage==>"+content);
//            System.out.println("massage==>"+message);
            JSONObject object = JSONObject.fromObject(content);
            //deviceName设备名称
            String deviceName = object.getString("deviceName");
            //如果收到deviceName,即有新的状态变化就存入数据库
            if(deviceName!=null){
                JSONObject items = JSONObject.fromObject(object.getString("items"));
                JSONObject LightSwitchs = JSONObject.fromObject(items.getString("LightSwitch"));
                //开关状态
                String LightSwitch = LightSwitchs.getString("value");
                Long time = LightSwitchs.getLong("time");
                //温度状况
                String wd =JSONObject.fromObject(items.getString("CurrentTemperature")).getString("value");
//                System.out.println(object);
                //湿度状况
                String RoomHumidity =JSONObject.fromObject(items.getString("RoomHumidity")).getString("value");
                //烟雾检测状况
                String Smoke =JSONObject.fromObject(items.getString("SmokeSensorState")).getString("value");
                //通风开关
                String FanSwitch =JSONObject.fromObject(items.getString("FanSwitch")).getString("value");
                //当前时间
                SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                String sd3 = sdf.format(time);

             System.out.println(wd+"--RoomHumidity:"+RoomHumidity+"--Smoke:"+Smoke+"-FanSwitch:"+FanSwitch+"--deviceName:"+deviceName+"--LightSwitch:"+LightSwitch+"--sd3:"+sd3);

                DriverManagerDataSource ds = new DriverManagerDataSource();
                ds.setDriverClassName("com.mysql.cj.jdbc.Driver");
                ds.setUrl("jdbc:mysql://localhost:3306/idea?serverTimezone=UTC"); //106.15.204.66 已改服务器IP地址
                ds.setUsername("root");
                ds.setPassword("123456");
                JdbcTemplate jdbcTemplate = new JdbcTemplate();
                jdbcTemplate.setDataSource(ds);
                String sql = "INsert into aliTest (deviceName,ledSwitch,wd,hum,fanSwitch,smoke,time) VALUES (?,?,?,?,?,?,?)";
                jdbcTemplate.update(sql,deviceName,LightSwitch,wd,RoomHumidity,FanSwitch,Smoke,sd3);
            }


        } catch (Exception e) {
//            logger.error("processMessage occurs error ", e);
            System.out.println(e);
        }

    }

    public static JmsConnectionListener myJmsConnectionListener = new JmsConnectionListener() {
        /**
         * 连接成功建立
         */
        @Override
        public void onConnectionEstablished(URI remoteURI) {
//            logger.info("onConnectionEstablished, remoteUri:{}", remoteURI);
            System.out.println(remoteURI);
        }

        /**
         * 尝试过最大重试次数之后，最终连接失败。
         */
        @Override
        public void onConnectionFailure(Throwable error) {
//            logger.error("onConnectionFailure, {}", error.getMessage());
            System.out.println( error.getMessage());
        }

        /**
         * 连接中断。
         */
        @Override
        public void onConnectionInterrupted(URI remoteURI) {
//            logger.info("onConnectionInterrupted, remoteUri:{}", remoteURI);
            System.out.println(remoteURI);
        }

        /**
         * 连接中断后又自动重连上。
         */
        @Override
        public void onConnectionRestored(URI remoteURI) {
//            logger.info("onConnectionRestored, remoteUri:{}", remoteURI);
            System.out.println(remoteURI);
        }

        @Override
        public void onInboundMessage(JmsInboundMessageDispatch envelope) {}

        @Override
        public void onSessionClosed(Session session, Throwable cause) {}

        @Override
        public void onConsumerClosed(MessageConsumer consumer, Throwable cause) {}

        @Override
        public void onProducerClosed(MessageProducer producer, Throwable cause) {}
    };

    /**
     * password签名计算方法，请参见上一篇文档：AMQP客户端接入说明。
     */
    public static String doSign(String toSignString, String secret, String signMethod) throws Exception {
        SecretKeySpec signingKey = new SecretKeySpec(secret.getBytes(), signMethod);
        Mac mac = Mac.getInstance(signMethod);
        mac.init(signingKey);
        byte[] rawHmac = mac.doFinal(toSignString.getBytes());
        return Base64.encodeBase64String(rawHmac);
    }
}