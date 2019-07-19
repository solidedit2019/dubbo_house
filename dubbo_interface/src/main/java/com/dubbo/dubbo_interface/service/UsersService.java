package com.dubbo.dubbo_interface.service;


import com.dubbo.dubbo_entity.entity.Users;
import com.dubbo.dubbo_entity.utils.UsersParam;
import com.github.pagehelper.PageInfo;

import java.util.List;

public interface UsersService {
    int deleteByExample(Integer[] ids);

    int deleteByPrimaryKey(Integer id);

    int insert(Users users);

    int updateById(Users users);

    Users selectById(Integer id);

     PageInfo<Users> getUsersListByPage(UsersParam usersParam);

     int deleteUsersByIds(List<Integer> ids);
     
    Users selectByPrimaryKey(Integer id);

    int getUsersByName(String name);

    int addUsersNotAdmin(Users users);

    Users login(String name, String password);
}
