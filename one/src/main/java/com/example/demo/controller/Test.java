package com.example.demo.controller;

import com.example.demo.aliyun.AmqpJavaClientDemo;
import org.apache.qpid.jms.JmsConnection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.jms.*;
import javax.naming.Context;
import javax.naming.InitialContext;
import java.util.Hashtable;

//表示返回字符串
@RestController
public class Test {
    //访问路径
    @RequestMapping("/test")
    public void test() throws Exception {
        //参数说明，请参见上一篇文档：AMQP客户端接入说明。
        AmqpJavaClientDemo demo = new AmqpJavaClientDemo();
        String accessKey = "LTAI4G9XSXzqzs5y5EFGtnuZ";
        String accessSecret = "wBje6OFnvISPfTn35MeT1kVNANIWq5";
        String consumerGroupId = "DEFAULT_GROUP";  //去服务端订阅页面的消费组列表查
        long timeStamp = System.currentTimeMillis();
        //签名方法：支持hmacmd5，hmacsha1和hmacsha256
        String signMethod = "hmacsha1";
        //控制台服务端订阅中消费组状态页客户端ID一栏将显示clientId参数。
        //建议使用机器UUID、MAC地址、IP等唯一标识等作为clientId。便于您区分识别不同的客户端。
        String clientId = "lcc";  //随意取

        //UserName组装方法，请参见上一篇文档：AMQP客户端接入说明。
        String userName = clientId + "|authMode=aksign"
                + ",signMethod=" + signMethod
                + ",timestamp=" + timeStamp
                + ",authId=" + accessKey
                + ",consumerGroupId=" + consumerGroupId
                + "|";
        //password组装方法，请参见上一篇文档：AMQP客户端接入说明。
        String signContent = "authId=" + accessKey + "&timestamp=" + timeStamp;
        String password = demo.doSign(signContent,accessSecret, signMethod);
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
        ((JmsConnection) connection).addConnectionListener(demo.myJmsConnectionListener);
        // Create Session
        // Session.CLIENT_ACKNOWLEDGE: 收到消息后，需要手动调用message.acknowledge()
        // Session.AUTO_ACKNOWLEDGE: SDK自动ACK（推荐）
        Session session = connection.createSession(false, Session.AUTO_ACKNOWLEDGE);
        connection.start();
        // Create Receiver Link
        MessageConsumer consumer = session.createConsumer(queue);
        consumer.setMessageListener(demo.messageListener);

    }

}
