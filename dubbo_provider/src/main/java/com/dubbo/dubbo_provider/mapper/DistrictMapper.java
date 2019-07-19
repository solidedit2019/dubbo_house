package com.dubbo.dubbo_provider.mapper;

import com.dubbo.dubbo_entity.entity.District;
import com.dubbo.dubbo_entity.entity.DistrictExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface DistrictMapper {
    long countByExample(DistrictExample example);

    int deleteByExample(DistrictExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(District record);

    int insertSelective(District record);

    List<District> selectByExample(DistrictExample example);

    District selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") District record, @Param("example") DistrictExample example);

    int updateByExample(@Param("record") District record, @Param("example") DistrictExample example);

    int updateByPrimaryKeySelective(District record);

    int updateByPrimaryKey(District record);
    //删除一条或多条参数
    int deleteDistrictById(List<Integer> ids);
}