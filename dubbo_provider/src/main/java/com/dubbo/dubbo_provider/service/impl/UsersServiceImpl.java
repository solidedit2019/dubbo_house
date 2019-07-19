package com.dubbo.dubbo_provider.service.impl;


import com.alibaba.dubbo.config.annotation.Service;
import com.dubbo.dubbo_entity.entity.Users;
import com.dubbo.dubbo_entity.entity.UsersExample;
import com.dubbo.dubbo_entity.utils.MD5Utils;
import com.dubbo.dubbo_entity.utils.UsersParam;
import com.dubbo.dubbo_interface.service.UsersService;
import com.dubbo.dubbo_provider.mapper.UsersMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Arrays;
import java.util.List;

@Service(interfaceClass = UsersService.class)
@Component
public class UsersServiceImpl implements UsersService {
    @Autowired(required = false)
    private UsersMapper usersMapper;


    @Override
    public int deleteByExample(Integer[] ids) {
        UsersExample example=new UsersExample();
        UsersExample.Criteria criteria = example.createCriteria();
        List<Integer>id= Arrays.asList(ids);
        criteria.andIdIn(id);
        return usersMapper.deleteByExample(example);
    }

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return usersMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(Users users) {
        return usersMapper.insertSelective(users);
    }

    @Override
    public int updateById(Users users) {
        return usersMapper.updateByPrimaryKeySelective(users);
    }

    @Override
    public Users selectById(Integer id) {
        return usersMapper.selectByPrimaryKey(id);
    }

    @Override
    public PageInfo<Users> getUsersListByPage(UsersParam usersParam) {
        PageHelper.startPage(usersParam.getPage(),usersParam.getRows());
        UsersExample example=new UsersExample();
        UsersExample.Criteria criteria = example.createCriteria();
            criteria.andIsadminEqualTo(1);
            if(usersParam.getName()!=null){
                criteria.andNameLike("%"+usersParam.getName()+"%");
            }
            if(usersParam.getTelephone()!=null){
                criteria.andTelephoneLike("%"+usersParam.getTelephone()+"%");
            }


        List<Users> list = usersMapper.selectByExample(example);
        return new PageInfo<>(list);
    }

    @Override
    public int deleteUsersByIds(List<Integer> ids) {
        return usersMapper.deleteUsersByIds(ids);
    }

    @Override
    public Users selectByPrimaryKey(Integer id) {
        return usersMapper.selectByPrimaryKey(id);
    }

    @Override
    public int getUsersByName(String name) {
        UsersExample example=new UsersExample();
        UsersExample.Criteria criteria = example.createCriteria();
        criteria.andNameEqualTo(name);
        List<Users> users = usersMapper.selectByExample(example);
        return users.size()>0?users.size():0;
    }

    @Override
    public int addUsersNotAdmin(Users users) {
        users.setIsadmin(0);
        String s = MD5Utils.md5Encrypt(users.getPassword());
        users.setPassword(s);
        return usersMapper.insertSelective(users);
    }

    @Override
    public Users login(String name, String password) {
        String pwd = MD5Utils.md5Encrypt(password);
        UsersExample example=new UsersExample();
        UsersExample.Criteria criteria = example.createCriteria();
        if(name!=null&&!name.equals("")){
            criteria.andNameEqualTo(name);
        }
        if(password!=null&&!password.equals("")){
            criteria.andPasswordEqualTo(pwd);
        }
        List<Users> list = usersMapper.selectByExample(example);

        return list.size()==1?list.get(0):null;
    }

}
