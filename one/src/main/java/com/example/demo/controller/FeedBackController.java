package com.example.demo.controller;

import com.alibaba.fastjson.JSON;
import com.example.demo.bean.*;
import com.example.demo.dao.FeedBackDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.sql.Array;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

@RestController
public class FeedBackController {
    @Autowired
    FeedBackDao feedBackDao;
    @RequestMapping("/getFB")
    public String getFB(Queryinfo queryinfo){
        //查询未读条数
        int numbers = feedBackDao.getFBCounts(false);
            //        System.out.println(numbers);
        int pageStart = (queryinfo.getPageNum()-1) * queryinfo.getPageSize();
        List<FeedBack> allFB = feedBackDao.getFB(pageStart, queryinfo.getPageSize());
        HashMap<String,Object> res = new HashMap<>();
        res.put("allFB",allFB);
        res.put("numbers",numbers);
        String res_String = JSON.toJSONString(res);

        return res_String;
    }
    @RequestMapping("/getDisHandle")
    public int getDisHandle(){
        int numbers = feedBackDao.getFBCounts(false);
      return  numbers;
    };
    @RequestMapping("/getBeforeFB")
    public String getBeforeFB(Queryinfo queryinfo){
        //查询已读总条数
        int numbers = feedBackDao.getFBCounts(true);
        int pageStart = (queryinfo.getPageNum()-1) * queryinfo.getPageSize();
        List<FeedBack> allFB = feedBackDao.getBeforeFB(pageStart, queryinfo.getPageSize());
        HashMap<String,Object> res = new HashMap<>();
        res.put("allFB",allFB);
        res.put("numbers",numbers);
        String res_String = JSON.toJSONString(res);
        return res_String;
    }
    //最新的
    @RequestMapping("/getFBAll")
    public String FBlist(Queryinfo queryinfo){
//        System.out.println(queryinfo);
        int numbers = feedBackDao.getCounts("%"+queryinfo.getQuery()+"%");
        int pageStart = (queryinfo.getPageNum() - 1) * queryinfo.getPageSize();
        List<FeedBack> FBAll = feedBackDao.getAllFB("%"+queryinfo.getQuery()+"%",pageStart,queryinfo.getPageSize());
        System.out.println(FBAll);
        HashMap<String,Object> res = new HashMap();
        res.put("FBAll",FBAll);
        res.put("numbers",numbers);
        String  res_String = JSON.toJSONString(res);
//        System.out.println("查询用户成功");
        //System.out.println(res_String);
        return res_String;
    }
    //反馈页面根据条件查询
    @RequestMapping("/searchResult")
    public String searchResult(@RequestBody  FB_QueryInfo fb_queryInfo){
        String value[] = fb_queryInfo.getQuery();
        String state;
        if(value[0].equals("已处理")){
            state = "%1%";
        }else if(value[0].equals("待处理")){
            state = "%0%";
        }else {
            state = null;
        }
        String fbtype;
        if(value[1].equals("查询所有"))
        {
            fbtype = null;
        }else{
            fbtype = "%"+value[1]+"%";
        }
        String time;
        if(value[2].equals("近一个月")){
            Date date = new Date();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
            time="%"+sdf.format(date)+"%";
        }else{
            time = "%%";
        }
//        System.out.println(state+"   "+fbtype+"  "+time);
        int pageStart = (fb_queryInfo.getPageNum() - 1) * fb_queryInfo.getPageSize();
        List<FeedBack> fb= feedBackDao.searchResult(state,fbtype,time,pageStart,fb_queryInfo.getPageSize());
        int numbers = feedBackDao.searchCounts(state,fbtype,time);
//        System.out.println(numbers);
        HashMap<String,Object> res = new HashMap();
        res.put("FBAll",fb);
        res.put("numbers",numbers);
        String  res_String = JSON.toJSONString(res);
        return res_String;
    }
    //反馈界面的编辑反馈API
    @RequestMapping("/editFB")
    public int editFB(@RequestBody FeedBack feedBack){
        //System.out.println(feedBack);
        //获取当前时间
        Long timeStamp = System.currentTimeMillis();
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String sd = sdf.format(timeStamp);
        int res= feedBackDao.editFB(feedBack.getId(),feedBack.getFbcontent(),feedBack.getAdmin(),sd);
        //System.out.println(res);
        return res;
    }
    @RequestMapping("/deleteFB")
    public int deleteFB(@RequestBody FeedBack feedBack){
        int  res = feedBackDao.deleteFB(feedBack.getId());
//        System.out.println(res);
        return res;
    }
}
