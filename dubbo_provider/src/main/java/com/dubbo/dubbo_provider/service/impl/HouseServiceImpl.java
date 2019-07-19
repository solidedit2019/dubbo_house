package com.dubbo.dubbo_provider.service.impl;


import com.alibaba.dubbo.config.annotation.Service;
import com.dubbo.dubbo_entity.entity.House;
import com.dubbo.dubbo_entity.utils.HouseCondition;
import com.dubbo.dubbo_entity.utils.HouseParam;
import com.dubbo.dubbo_entity.utils.PageParam;
import com.dubbo.dubbo_interface.service.DistrictService;
import com.dubbo.dubbo_interface.service.HouseService;
import com.dubbo.dubbo_provider.mapper.HouseMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

@Service(interfaceClass = HouseService.class)
@Component
public class HouseServiceImpl implements HouseService {
    @Autowired(required = false)
    private HouseMapper mapper;
    @Override
    public int add(House house) {
        return mapper.insertSelective(house);
    }

    @Override
    public PageInfo<House> getPageHouse(Integer id, PageParam pageParam) {
        PageHelper.startPage(pageParam.getPage(),pageParam.getRows());
        List<House> listHouse = mapper.getListHouse(id);

        return new PageInfo<>(listHouse);
    }

    @Override
    public int delete(String id) {

        return mapper.deleteByPrimaryKey(id);
    }

    @Override
    public int update(House house) {

        return mapper.updateByPrimaryKeySelective(house);
    }

    @Override
    public House getHouse(String id) {
        return mapper.getHouse(id);
    }

    @Override
    public int deleteHouse(String id, Integer isdel) {
          House house=new House();
          house.setId(id);
          house.setIsdel(isdel);
        return  mapper.updateByPrimaryKeySelective(house);
    }

    @Override
    public PageInfo<House> getPageIspassHouse(HouseParam houseParam) {
        PageHelper.startPage(houseParam.getPage(),houseParam.getRows());

        List<House> houses = mapper.getHousePass(houseParam);
        return new PageInfo<>(houses);
    }

    @Override
    public int getIsPass(Integer ispass, String id) {
        House house=new House();
        house.setIspass(ispass);
        house.setId(id);
            return  mapper.updateByPrimaryKeySelective(house);
    }

    @Override
    public int upBacheIsPass(Map<String, Object> map) {

        return mapper.upbatchIspassHouse(map);
    }

    @Override
    public PageInfo<House> getPageHouse(HouseCondition condition) {
          PageHelper.startPage(condition.getPage(),condition.getRows());
        List<House> pageHouse = mapper.getPageHouse(condition);
        return new PageInfo<>(pageHouse);
    }


}
