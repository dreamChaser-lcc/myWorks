package com.example.demo.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface AliMapper {

    @Insert("insert into aliTest (id,value,time) VALUES (#{id},#{value},#{time})")
    public void insert(int id,String value, String time);

}
