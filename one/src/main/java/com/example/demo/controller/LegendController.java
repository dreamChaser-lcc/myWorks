package com.example.demo.controller;

import com.alibaba.fastjson.JSON;
import com.example.demo.bean.EqData;
import com.example.demo.dao.EqDao;
import com.example.demo.dao.LegendDao;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;

@RestController
public class LegendController {
        @Autowired //
        LegendDao legendDao;
        @RequestMapping("/getEqData")
        public String getEqData(@Param("eqName") String eqName){
            System.out.println(eqName);
            List<EqData> allData= legendDao.EqData(eqName);
            String res = JSON.toJSONString(allData);
            System.out.println(res);
            return res;
        }
}
