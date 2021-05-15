package com.example.demo.aliyun.jdbcDao;

import com.example.demo.aliyun.dao.IAccountDao;
import com.example.demo.bean.AliBean;
import org.springframework.jdbc.core.JdbcTemplate;

public class Impl implements IAccountDao {

    private JdbcTemplate jdbcTemplate;

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate){
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public AliBean findAliById(int id) {
        return null;
    }

    @Override
    public AliBean findAliByValue(String value) {
        return null;
    }

    @Override
    public void AliInsert(String value, String time) {
        jdbcTemplate.update("INsert into aliTest (value,time) VALUES (?,?)",value,time);
    }
}
