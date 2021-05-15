package com.example.demo.controller;

import com.alibaba.fastjson.JSON;
import com.example.demo.bean.Queryinfo;
import com.example.demo.bean.User;
import com.example.demo.dao.UserDao;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;

@RestController
public class UserController {

    @Autowired
    private UserDao userDao;
    @RequestMapping("/allUser")
    public String userList(Queryinfo queryinfo){
        System.out.println(queryinfo);
        int numbers = userDao.getUserCounts("%"+queryinfo.getQuery()+"%");
        int pageStart = (queryinfo.getPageNum() - 1) * queryinfo.getPageSize();
        List<User> userAll = userDao.getAllUser("%"+queryinfo.getQuery()+"%",pageStart,queryinfo.getPageSize());
        System.out.println("---"+userAll);
        HashMap<String,Object> res = new HashMap();
        res.put("userAll",userAll);
        res.put("numbers",numbers);
        String  res_String = JSON.toJSONString(res);
//        System.out.println("查询用户成功");
        //System.out.println(res_String);
        return res_String;
    }
    @RequestMapping("/updateState")
    public String updateState(@Param("id") Integer id,@Param("state") Boolean state){
       /*
        System.out.println(id +"   " +state);*/
           int i = userDao.getUpdateState(id,state);
         System.out.println("更新状态成功"+i);
            //return  "success";
            return  i > 0 ? "success":"error";
    }
    @RequestMapping("/addUser")
    public String addUser(@RequestBody User user){
        user.setRole("普通用户");
        user.setState(false);
        System.out.println("-----user"+user);
        int i = userDao.addUser(user);
        System.out.println("添加用户成功"+i);
        return i > 0 ? "success":"error";
    }
    @RequestMapping("/deleteUser")
    public String deleteUser(int id){
        int i =  userDao.deleteUser(id);
        System.out.println("删除用户成功");
        return i > 0 ? "success":"error";
    }
    @RequestMapping("/getUpdate")
    public String getUpdateUser(int id){
       User user = userDao.getUpdateUser(id);
       String str = JSON.toJSONString(user);
       return str;
    }
    @RequestMapping("/editUser")
    public String editUser(@RequestBody User user){
        System.out.println("编辑用户成功");
        int i = userDao.editUser(user);
        return i > 0 ? "success":"error";
    }

}
