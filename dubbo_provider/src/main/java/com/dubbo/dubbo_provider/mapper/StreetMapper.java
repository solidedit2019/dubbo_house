package com.dubbo.dubbo_provider.mapper;

import com.dubbo.dubbo_entity.entity.Street;
import com.dubbo.dubbo_entity.entity.StreetExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface StreetMapper {
    long countByExample(StreetExample example);

    int deleteByExample(StreetExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Street record);

    int insertSelective(Street record);

    List<Street> selectByExample(StreetExample example);

    Street selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Street record, @Param("example") StreetExample example);

    int updateByExample(@Param("record") Street record, @Param("example") StreetExample example);

    int updateByPrimaryKeySelective(Street record);

    int updateByPrimaryKey(Street record);

    int deleteStreetByDistrictId(List<Integer> districtId);

    int deleteStreetById(List<Integer> ids);
}