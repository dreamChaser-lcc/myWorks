package com.example.demo.dao;

import com.example.demo.bean.EqData;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface LegendDao {
    public List<EqData>  EqData(@Param("eqName") String eqName);

}
