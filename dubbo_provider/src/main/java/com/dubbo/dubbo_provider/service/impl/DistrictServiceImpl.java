package com.dubbo.dubbo_provider.service.impl;


import com.alibaba.dubbo.config.annotation.Service;
import com.dubbo.dubbo_entity.entity.District;
import com.dubbo.dubbo_entity.entity.DistrictExample;
import com.dubbo.dubbo_entity.utils.PageParam;
import com.dubbo.dubbo_interface.service.DistrictService;
import com.dubbo.dubbo_provider.mapper.DistrictMapper;
import com.dubbo.dubbo_provider.mapper.StreetMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Service(interfaceClass = DistrictService.class)
@Component
public class DistrictServiceImpl implements DistrictService {
    @Autowired(required = false)
    private DistrictMapper districtMapper;
    @Autowired(required = false)
    private StreetMapper streetMapper;

    @Override
    public PageInfo<District> getDistrictByPage(PageParam pageParam) {
        PageHelper.startPage(pageParam.getPage(),pageParam.getRows());
        List<District> list = districtMapper.selectByExample(null);
        PageInfo<District> info=new PageInfo<>(list);
        return info;
    }

    @Override
    public Boolean add(District district) {
        return districtMapper.insertSelective(district)>0;
    }

    @Override
    public Boolean update(District district) {
        return districtMapper.updateByPrimaryKeySelective(district)>0;
    }

    @Override
    public Boolean delete(Integer id) {
        return districtMapper.deleteByPrimaryKey(id)>0;
    }

    @Override
    public Integer deleteList(List<Integer> ids) {
        DistrictExample example = new DistrictExample();
        DistrictExample.Criteria criteria = example.createCriteria();
        if(criteria!=null){
            if(ids!=null&&ids.size()>0){
                criteria.andIdIn(ids);
            }

           }
        return districtMapper.deleteByExample(example);
    }

    @Override
    public District getById(Integer id) {
        return districtMapper.selectByPrimaryKey(id);
    }

    @Override
     @Transactional
    public int deleteDistrictById(List<Integer> ids) {
        int a = streetMapper.deleteStreetByDistrictId(ids);
        int b = districtMapper.deleteDistrictById(ids);
        return a+b;
    }

    @Override
    public List<District> getAllDistrict() {
        return districtMapper.selectByExample(null);
    }
}
