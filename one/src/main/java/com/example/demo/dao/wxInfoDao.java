package com.example.demo.dao;


import com.example.demo.controller.wxInfo.wxInfoBean.wxInfoBean;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface wxInfoDao {
    public wxInfoBean getWxInfo(@Param("username") String username);
    public int insertWxInfo(@Param("username") String username,@Param("eqName") String eqName,@Param("address") String address,@Param("contacts") String contacts);
    public int updateWxInfo(@Param("username") String username,@Param("eqName") String eqName,@Param("address") String address,@Param("contacts") String contacts);
    public int changeState(@Param("username") String username,@Param("state")boolean state);
}
