package com.example.demo.dao;
import com.example.demo.controller.wxFb.wxFbBean.wxFbReturnBean;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface wxFbDao {
    //反馈信息写入
    public int insertWxFb(@Param("username")String username,@Param("fbtype")String fbtype,@Param("content")String content,@Param("contacts")String contacts,@Param("time")String time);
    //微信端反馈消息读取
    public List<wxFbReturnBean> getWxFbInfo(@Param("username")String username);
    public int deleteFb(@Param("id") int id);
}
