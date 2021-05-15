package com.example.demo.controller;

import com.alibaba.fastjson.JSON;
import com.example.demo.bean.CurrentEqData;
import com.example.demo.bean.Equipment;
import com.example.demo.bean.Queryinfo;
import com.example.demo.dao.EqDao;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

@RestController
public class EqController {
        @Autowired   //自动封装的注解
        EqDao  eqDao;
        @RequestMapping("/addEq")
        public String addEq(@RequestBody Equipment equipment){
            equipment.setState(false);
            int i =eqDao.addEq(equipment);
//            System.out.println(i);
            return i>0 ? "success":"error";
        }
        @RequestMapping("/getEqList")
        public String getEqList(Queryinfo queryinfo){
            // 总条数
            int numbers = eqDao.getEqCounts("%"+queryinfo.getQuery()+"%");
            //开始点等于当前页数-1*每页数
            int pageStart = (queryinfo.getPageNum() - 1) * queryinfo.getPageSize();
            List<Equipment> allEq = eqDao.getALlEq("%"+queryinfo.getQuery()+"%",pageStart,queryinfo.getPageSize());
//            System.out.println(allEq);
            HashMap<String,Object> res = new HashMap<>();
            res.put("numbers",numbers);
            res.put("allEq",allEq);
            String res_String = JSON.toJSONString(res);

            return res_String;
        }
        @RequestMapping("/bindEq")
        public String bindEq(@Param("eqName")String eqName,@Param("userName")String userName){
            System.out.println(eqName+" "+userName);
                int i = eqDao.bindEq(eqName,userName);
                return i>0 ? "success":"error";
        }
        @RequestMapping("/deleteEq")
        public String deleteEq(int id){
            int i = eqDao.deleteEq(id);
            return i>0 ?"success":"error";
        }
        @RequestMapping("/removeBindEq")
        public String removeBindEq(@Param("id") int id){
            int i = eqDao.removeBindEq(id);
            return i>0 ?"success":"error";
        }
        @RequestMapping("/currentEqData")
        public String currentEqData( Equipment equipment) {    //查看实时数据页面的API
//            System.out.println("我进来了");
            System.out.println("eq----"+equipment);
            CurrentEqData currentEqData = eqDao.getCurrentEqData(equipment.getEqName());
//            System.out.println("这是当前的值---"+currentEqData);

//            System.out.println(res);
            Date date = new Date();
            SimpleDateFormat sdf = new SimpleDateFormat("HH");
            int currentHour = Integer.valueOf(sdf.format(date));
            //最新四个小时的烟雾图例
            List<String> smokeList = new ArrayList<>();
            for (int i = 1; i <= 4; i++) {
                String value = eqDao.getSmokeLegend(currentHour);
                smokeList.add(value);
                currentHour--;
            }
//            System.out.println(smokeList);
            HashMap<String, Object> hashMap = new HashMap<>();
            hashMap.put("currentEqData", currentEqData);
            hashMap.put("smokeList", smokeList);
            String res = JSON.toJSONString(hashMap);
//            System.out.println(res);
            return res;
        }
}
