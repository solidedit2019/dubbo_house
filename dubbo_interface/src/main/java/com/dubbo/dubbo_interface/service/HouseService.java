package com.dubbo.dubbo_interface.service;


import com.dubbo.dubbo_entity.entity.House;
import com.dubbo.dubbo_entity.utils.HouseCondition;
import com.dubbo.dubbo_entity.utils.HouseParam;
import com.dubbo.dubbo_entity.utils.PageParam;
import com.github.pagehelper.PageInfo;

import java.util.Map;

public interface HouseService {
    int add(House house);

    PageInfo<House> getPageHouse(Integer id, PageParam pageParam);

    int delete(String id);

    int update(House house);

    House getHouse(String id);

    int deleteHouse(String id, Integer isdel);

    PageInfo<House> getPageIspassHouse(HouseParam houseParam);

    int getIsPass(Integer ispass, String id);

    int upBacheIsPass(Map<String, Object> map);
    PageInfo<House> getPageHouse(HouseCondition condition);
}
