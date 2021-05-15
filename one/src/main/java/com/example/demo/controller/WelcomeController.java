package com.example.demo.controller;

import com.alibaba.fastjson.JSON;
import com.example.demo.bean.FeedBack;
import com.example.demo.bean.User;
import com.example.demo.dao.EqDao;
import com.example.demo.dao.FeedBackDao;
import com.example.demo.dao.LegendDao;
import com.example.demo.dao.UserDao;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;

@RestController
public class WelcomeController {
    @Autowired
    EqDao eqDao; //设备DAO
    @Autowired
    UserDao userDao; //用户DAO
    @Autowired
    FeedBackDao feedBackDao; //反馈DAO

    @RequestMapping("getWelcome")
    public String getWelcome(@Param("username")String username){
        System.out.println(username);
        int bindEq =eqDao.getWcEqCounts(1);
        int unBindEq =eqDao.getWcEqCounts(0);
        System.out.println(bindEq + "  " +unBindEq);
        int userCount = userDao.getWcUserCount();
        User userinfo =userDao.getWcUser(username);
        System.out.println(userCount + "  " +userinfo);
        List<FeedBack> allFeedBack = feedBackDao.getFB(0,3);
        System.out.println(allFeedBack);
        HashMap<String,Object> hash = new HashMap<>();
        hash.put("bindEq",bindEq);
        hash.put("userCount",userCount);
        hash.put("userinfo",userinfo);
        hash.put("unBindEq",unBindEq);
        hash.put("allFeedBack",allFeedBack);
        String res = JSON.toJSONString(hash);
        return res;
//        return "";
    }
}
