package com.example.demo.dao;

import com.example.demo.wxBean.wxCurrent;
import com.example.demo.wxBean.wxData;
import com.example.demo.wxBean.wxLegend;
import com.example.demo.wxBean.wxSwitch;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface WxDao {
        public wxCurrent wxGetCurrent(@Param("eqName")String eqName);
        public wxSwitch wxSwitch(@Param("wxEqName") String wxEqName);
        public int changeSwitch(@Param("wxEqName")String wxEqName,@Param("switchName")String switchName,@Param("state")boolean state );
        public List<wxData> getDataList(@Param("wxEqName")String wxEqName);
        public wxLegend getLegendList(@Param("wxEqName") String wxEqName,@Param("index") int index,@Param("startDate")String startDate,@Param("endDate")String endDate);
}
