package com.dubbo.dubbo_interface.service;


import com.dubbo.dubbo_entity.entity.District;
import com.dubbo.dubbo_entity.utils.PageParam;
import com.github.pagehelper.PageInfo;

import java.util.List;

public interface DistrictService {
    PageInfo<District> getDistrictByPage(PageParam pageParam);
    Boolean add(District district);
    Boolean update(District district);
    Boolean delete(Integer id);
    Integer deleteList(List<Integer> ids);
    District getById(Integer id);
    int deleteDistrictById(List<Integer> ids);
    List<District> getAllDistrict();

}
