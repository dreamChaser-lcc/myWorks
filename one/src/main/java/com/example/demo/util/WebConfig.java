package com.example.demo.util;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

@Configuration
public class WebConfig extends WebMvcConfigurerAdapter {
    @Override
    public void addCorsMappings(CorsRegistry registry) {
        /*
        * 1.访问路径
        * 2.请求来源
        * 3.请求允许的方法
        * 4.是否允许携带指向
        * 5.最大响应时间
        * */
        registry.addMapping("/**")
//                .allowedOrigins("http://localhost:8080",null)
                .allowedMethods("GET","POST","PUT","OPTIONS","DELETE")
                .allowCredentials(true)
                .maxAge(3600);
    }
}
