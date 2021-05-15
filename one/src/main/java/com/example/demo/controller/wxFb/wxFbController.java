package com.example.demo.controller.wxFb;

import com.alibaba.fastjson.JSON;
import com.example.demo.controller.wxFb.wxFbBean.wxFbParams;
import com.example.demo.controller.wxFb.wxFbBean.wxFbReturnBean;
import com.example.demo.dao.wxFbDao;
import net.sf.json.JSONObject;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;

@RestController
public class wxFbController {
    @Autowired
    wxFbDao wxFbDao;
    //反馈信息写入
    @RequestMapping("/feedBack")
    public String feedBack(@RequestBody wxFbParams data){
        Long timeStamp = System.currentTimeMillis();
        //设置时间格式
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String sd3 = sdf.format(timeStamp);
//        System.out.println(sd3);
        int i = wxFbDao.insertWxFb(data.getUsername(),data.getFbtype(),data.getContent(),data.getContacts(),sd3);
//        System.out.println(i);
        String res;
        if(i>0){
            res="反馈成功";
        }else {
            res="反馈失败,请电话联系管理员!";
        }
        return res;
    }
    //微信端获取反馈信息，前端模块暂未开发
    @RequestMapping("/getFeedBack")
    public String getFeedBack(@RequestBody String username){
        System.out.println(username);
        //获取到所有回馈消息
        List<wxFbReturnBean> list = wxFbDao.getWxFbInfo(username);
        System.out.println(list);
        HashMap<String,Object> temp= new HashMap<>();
        if(list!=null&&list.size()>0){
            temp.put("code","0000");
        }else {
            temp.put("code","1");
        }
        temp.put("list",list);
        String res= JSON.toJSONString(temp);
        return res;
    }
    @RequestMapping("/deteleFeedBack")
    public int getFeedBack(@RequestBody int id){
        int res = wxFbDao.deleteFb(1);
        System.out.println(res);
        return 0;
    }
}
