package com.example.demo.controller;

import com.alibaba.fastjson.JSON;
import com.example.demo.dao.UserDao;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class MapController {
    @Autowired   //自动封装接口
    UserDao userDao;
    @RequestMapping("/getMap")
    public String getMap(@Param("address") String address ){
//        System.out.println(address); 查看传过来的值
        int i = userDao.getMapUserCount("%"+address+"%");
//        System.out.println(i);  //拥有的用户数
        String res = JSON.toJSONString(i);
        return res;
    }
}
