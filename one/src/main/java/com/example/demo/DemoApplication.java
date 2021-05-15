package com.example.demo;



import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;



//指定要实现类的接口的所在包
@MapperScan("com.example.demo.dao")
@SpringBootApplication
public class DemoApplication {

    public static  void main(String[] args) {
        SpringApplication.run(DemoApplication.class, args);
//         ApplicationContext ac = new ClassPathXmlApplicationContext("bean.xml");
//        IAccountDao a = ac.getBean("jdbcDao",IAccountDao.class);
//        a.AliInsert("123","354hkh123");
    }
}
