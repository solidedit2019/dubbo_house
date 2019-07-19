package com.dubbo.dubbo_interface.service;


import com.dubbo.dubbo_entity.entity.Type;
import com.dubbo.dubbo_entity.utils.PageParam;
import com.github.pagehelper.PageInfo;

import java.util.List;

public interface TypeService {
    int deleteByExample(Integer[] ids);

    int deleteByPrimaryKey(Integer id);

    int insert(Type type);

    int updateById(Type type);

    Type selectById(Integer id);

     PageInfo<Type> getTypeListByPage(PageParam pageParam);

     int deleteTypeByIds(List<Integer> ids);
     
    Type selectByPrimaryKey(Integer id);

       List<Type> allType();
}
