package com.example.demo.dao;

import com.example.demo.bean.FeedBack;
import com.example.demo.bean.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface FeedBackDao {
        public List<FeedBack> getFB(@Param("pageStart")int pageStart,@Param("pageSize") int pageSize);
        public List<FeedBack> getBeforeFB (@Param("pageStart")int pageStart,@Param("pageSize") int pageSize);
        public int getFBCounts(@Param("flag") boolean flag);
        public int getCounts(@Param("username")String username);
        public List<FeedBack> getAllFB(@Param("username") String username, @Param("pageStart") int pageStart, @Param("pageSize") int pageSize);
        //最新反馈界面每页数据
        public List<FeedBack> searchResult(@Param("state")String state,@Param("fbtype")String fbtype,@Param("time")String time, @Param("pageStart") int pageStart, @Param("pageSize") int pageSize);
        //最新的反馈界面查询条数API
        public int searchCounts(@Param("state")String state,@Param("fbtype")String fbtype,@Param("time")String time);
        //最新反馈界面回馈消息功能
        public int editFB(@Param("id")int id,@Param("fbContent")String fbContent,@Param("admin")String admin,@Param("time") String time);
        //最新反馈界面删除功能
        public int deleteFB(@Param("id")int id);
}
