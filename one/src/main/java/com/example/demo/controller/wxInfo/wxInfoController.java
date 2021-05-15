package com.example.demo.controller.wxInfo;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.example.demo.bean.Equipment;
import com.example.demo.controller.wxInfo.wxInfoBean.wxInfoBean;
import com.example.demo.dao.EqDao;
import com.example.demo.dao.wxInfoDao;
import org.apache.tomcat.util.json.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;

@RestController
public class wxInfoController {

    @Autowired
    wxInfoDao wxInfoDao;
    @Autowired
    EqDao eqDao;
    /*
    * 微信个人资料获取
    * 根据username查询
    * */
    @RequestMapping("/getWxInfo")
    public String getWxInfo(@RequestBody String username){
//        System.out.println(username);
        Equipment bindInfo = eqDao.getBindAble(username);
//        System.out.println("---"+bindInfo);
        if(bindInfo==null){
//            设置为false
            wxInfoDao.changeState(username,false);
        }else{
            wxInfoDao.changeState(username,true);
        }
        wxInfoBean result = wxInfoDao.getWxInfo(username);
        System.out.println("usernam"+username);
        HashMap<String,Object> map = new HashMap<>();
        map.put("wxInfo",result);
        String res = JSON.toJSONString(map);
        return res;
    }
    /*
    * 微信个人资料更新
    * 参数是个人资料的所有参数
    * */
    @RequestMapping("/updateWxInfo")
    public String  updateWxInfo(@RequestBody String data){
        JSONObject data1 =JSONObject.parseObject(data);
        String username =(String) data1.get("username");
        String eqName = (String) data1.get("eqName");
        String address = (String) data1.get("address");
        String contacts = (String) data1.get("contacts");
        wxInfoBean isNull = wxInfoDao.getWxInfo(username);
        System.out.println(data1);
        int res;
        if(isNull==null){
            //新增
           res = wxInfoDao.insertWxInfo(username,eqName,address,contacts);
        }else {
            //更新
           res =  wxInfoDao.updateWxInfo(username,eqName,address,contacts);
        }
        String result;
        if(res>0)
        {
            result = "保存成功";
        }else {
            result = "操作失败，请联系管理员";
        }
        return result;
    }
}
