package com.example.demo.dao;

import com.example.demo.bean.Equipment;
import com.example.demo.bean.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserDao {
    public User getUserByMessage(@Param("username") String username,@Param("password") String password);
    public List<User> getAllUser(@Param("username") String username, @Param("pageStart") int pageStart,@Param("pageSize") int pageSize);
    public int getUserCounts(@Param("username") String username);
    public int getUpdateState(@Param("id") Integer id,@Param("state") Boolean state);
    public int addUser(User user);
    public int deleteUser(@Param("id") int id);
    public User getUpdateUser(@Param("id") int id);
    public int editUser(User user);
    //Welcome界面
    public int getWcUserCount();
    public User getWcUser(@Param("username")String username);

    //Map界面
    public int getMapUserCount(@Param("address") String address);
}
