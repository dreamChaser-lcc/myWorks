package com.example.demo.dao;

import com.example.demo.bean.CurrentEqData;
import com.example.demo.bean.Equipment;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface EqDao {
    public int addEq(Equipment eq);

    public List<Equipment> getALlEq(@Param("eqName") String eqName, @Param("pageStart") int pageStart, @Param("pageSize") int pageSize);

    public int getEqCounts(@Param("eqName") String eqName);

    public int bindEq(@Param("eqName") String eqName, @Param("userName") String userName);

    public int deleteEq(@Param("id") int id);

    public int removeBindEq(@Param("id") int id);

    //获取设备的数量 flag=1绑定数量，否者为未绑定设备数量
    public int getWcEqCounts(@Param("flag") int flag);
       //public int getWcEqCounts();

    //查看实时数据的API
    public CurrentEqData getCurrentEqData(@Param("eqName") String eqName);

    //查看近期烟雾浓度状况的APIq
    public String getSmokeLegend(@Param("hour")int hour);

    //查看用户绑定信息
    public Equipment getBindAble(@Param("username")String username);
}
