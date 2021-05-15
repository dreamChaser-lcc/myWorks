package com.example.demo.controller;

import com.alibaba.fastjson.JSON;
import com.example.demo.bean.User;
import com.example.demo.dao.UserDao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;

//controller--控制器
@RestController
public class LoginController {
        @Autowired
        UserDao userDao;

        @RequestMapping("/login")
        public String login(@RequestBody User user){ //RequestBody表示必须匹配的任意字段
//            System.out.println("User"+user);
//            System.out.println("我进来了");
            String flag = "error";
            //获取用户信息的dao
            User us = userDao.getUserByMessage(user.getUsername(),user.getPassword());

            HashMap<String,Object> res =new HashMap<String,Object>();
            //System.out.println(us);
            if (us!=null)
            {
                flag = "ok";
            }
            res.put("flag",flag);
            res.put("user",user);
            String res_json = JSON.toJSONString(res);
            return res_json;
        }
}
