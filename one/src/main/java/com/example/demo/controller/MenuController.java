package com.example.demo.controller;

import com.alibaba.fastjson.JSON;
import com.example.demo.bean.MainMenu;
import com.example.demo.dao.MenuDao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;

@RestController
public class MenuController {

    @Autowired
    MenuDao  menuDao;

    @RequestMapping("/menus")
    public String getAllMenus(){
        HashMap<String,Object> data = new HashMap<>();
        int flag = 404;
        //        获取菜单列表
        List<MainMenu> menus = menuDao.getMenus();
        if(menus!=null)
        {
            data.put("menus",menus);
            data.put("flag",200);
        }
        else
        {
            data.put("flag",404);
        }
        String s = JSON.toJSONString(data);
        System.out.println("菜单传输成功");
        return s;
    }
}
