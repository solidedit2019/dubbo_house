package com.dubbo.dubbo_interface.service;


import com.dubbo.dubbo_entity.entity.Street;
import com.dubbo.dubbo_entity.utils.PageParam;
import com.github.pagehelper.PageInfo;

import java.util.List;

public interface StreetService {
    int deleteByExample(Integer[] ids);

    int deleteByPrimaryKey(Integer id);

    int insert(Street street);

    int updateById(Street street);

    Street selectById(Integer id);

     PageInfo<Street> getStreetListByPage(Integer id, PageParam pageParam);

     int deleteStreetById(List<Integer> ids);

    Street selectByPrimaryKey(Integer id);
    List<Street> getAllStreet(Integer did);
    List<Street> getStreet();
}
