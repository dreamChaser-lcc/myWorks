package com.example.demo.aliyun.dao;

import com.example.demo.bean.AliBean;

public interface IAccountDao {
    AliBean findAliById(int id);
    AliBean findAliByValue(String value);
    void AliInsert(String value,String time);
}
