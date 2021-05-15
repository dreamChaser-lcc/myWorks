package com.example.demo.wx_controller;

import com.alibaba.fastjson.JSON;
import com.example.demo.dao.WxDao;
import com.example.demo.dao.wxInfoDao;
import com.example.demo.wxBean.wxCurrent;
import com.example.demo.wxBean.wxData;
import com.example.demo.wxBean.wxLegend;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
public class WxGetDataController {

    @Autowired
    WxDao wxDao;

    //获取首页当前第一条数据
    @RequestMapping("/wxData")
    //@PostMapping("/wxData")
    public String wxData(@RequestBody Map key){
        String wxEqName = (String) key.get("eqName");
//        System.out.println(wxEqName);
        wxCurrent wxCurrent = wxDao.wxGetCurrent(wxEqName);
//        System.out.println(wxCurrent);
        String res = JSON.toJSONString(wxCurrent);
        return res;
    }
    //改变首页按钮状态
    @RequestMapping("/changeSwitch")
    public int changeSwitch(@RequestBody Map key){
        //System.out.println(key);
        String wxEqName = (String) key.get("wxEqName");
        String switchName = (String) key.get("sw");
        boolean state = (boolean) key.get("val");
        //System.out.println(state);
        int i = wxDao.changeSwitch(wxEqName,switchName,state);
        return i;
    }
    //获取数据列表 表中0到20条，根据设备名查询
    @RequestMapping("/getDataList")
    public String getDataList(@RequestBody Map eqName){
        String wxEqName = (String)eqName.get("eqName");
//        System.out.println(wxEqName);
        List<wxData> getData = wxDao.getDataList(wxEqName);
//        System.out.println(getData);
        String res = JSON.toJSONString(getData);
        return res;
    }
    @RequestMapping("/getLegend")
    //获取2020-年24H每隔2小时的数据，待完善数据逻辑，语句更换可用
    public String getLegend(@RequestBody Map key){
//        System.out.println(key);
        String wxEqName = (String) key.get("eqName");
        String Date = (String) key.get("date");
        String startDate = Date+" 00:00:00";
        String endDate = Date + " 23:59:59";
        System.out.println(startDate+"---"+endDate);
        List<wxLegend> list  =new ArrayList<>();
        wxLegend legendList;
        for(int i=0;i<12;i++){
            legendList = wxDao.getLegendList(wxEqName,i*2,startDate,endDate);
            if (legendList == null) {
                legendList = wxDao.getLegendList(wxEqName, i * 2 + 1,startDate,endDate);
            }
            list.add(legendList);
        }
        System.out.println(JSON.toJSONString(list));
        String res = JSON.toJSONString(list);
        return res;
    }

}
