package com.dubbo.dubbo_provider.service.impl;


import com.alibaba.dubbo.config.annotation.Service;
import com.dubbo.dubbo_entity.entity.Street;
import com.dubbo.dubbo_entity.entity.StreetExample;
import com.dubbo.dubbo_entity.utils.PageParam;
import com.dubbo.dubbo_interface.service.StreetService;
import com.dubbo.dubbo_provider.mapper.StreetMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Arrays;
import java.util.List;

@Service(interfaceClass = StreetService.class)
@Component
public class StreetServiceImpl implements StreetService {
    @Autowired(required = false)
    private StreetMapper streetMapper;

    @Override
    public int deleteByExample(Integer[] ids) {
        StreetExample example=new StreetExample();
        StreetExample.Criteria criteria = example.createCriteria();
        List<Integer>id= Arrays.asList(ids);
        criteria.andIdIn(id);
        return streetMapper.deleteByExample(example);
    }

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return streetMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(Street street) {
        return streetMapper.insertSelective(street);
    }

    @Override
    public int updateById(Street street) {
        return streetMapper.updateByPrimaryKeySelective(street);
    }

    @Override
    public Street selectById(Integer id) {
        return streetMapper.selectByPrimaryKey(id);
    }

    @Override
    public PageInfo<Street> getStreetListByPage(Integer id, PageParam pageParam) {
        PageHelper.startPage(pageParam.getPage(),pageParam.getRows());
        StreetExample example=new StreetExample();
        StreetExample.Criteria criteria = example.createCriteria();
        criteria.andDistrictIdEqualTo(id);
        List<Street> list = streetMapper.selectByExample(example);
        return new PageInfo<>(list);
    }

    @Override
    public int deleteStreetById(List<Integer> ids) {
        return streetMapper.deleteStreetById(ids);
    }

    @Override
    public Street selectByPrimaryKey(Integer id) {
        return streetMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<Street> getAllStreet(Integer did) {
        List<Street> list=null;
        StreetExample example=new StreetExample();
        StreetExample.Criteria criteria = example.createCriteria();
        if(did!=null&&!did.equals("")){
            criteria.andDistrictIdEqualTo(did);
            list = streetMapper.selectByExample(example);
        }

        return list;
    }

    @Override
    public List<Street> getStreet() {

        return streetMapper.selectByExample(null);
    }

}
