package com.dubbo.dubbo_provider.service.impl;


import com.alibaba.dubbo.config.annotation.Service;
import com.dubbo.dubbo_entity.entity.Type;
import com.dubbo.dubbo_entity.entity.TypeExample;
import com.dubbo.dubbo_entity.utils.PageParam;
import com.dubbo.dubbo_interface.service.TypeService;
import com.dubbo.dubbo_provider.mapper.TypeMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Arrays;
import java.util.List;

@Service(interfaceClass = TypeService.class)
@Component
public class TypeServiceImpl implements TypeService {
    @Autowired(required = false)
    private TypeMapper typeMapper;

    @Override
    public int deleteByExample(Integer[] ids) {
        TypeExample example=new TypeExample();
        TypeExample.Criteria criteria = example.createCriteria();
        List<Integer> id= Arrays.asList(ids);
        criteria.andIdIn(id);
        return typeMapper.deleteByExample(example);
    }

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return typeMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(Type type) {
        return typeMapper.insertSelective(type);
    }

    @Override
    public int updateById(Type type) {
        return typeMapper.updateByPrimaryKeySelective(type);
    }

    @Override
    public Type selectById(Integer id) {
        return typeMapper.selectByPrimaryKey(id);
    }

    @Override
    public PageInfo<Type> getTypeListByPage(PageParam pageParam) {
        PageHelper.startPage(pageParam.getPage(),pageParam.getRows());
        List<Type> list = typeMapper.selectByExample(null);
        return new PageInfo<>(list);
    }

    @Override
    public int deleteTypeByIds(List<Integer> ids) {
        return typeMapper.deleteTypeByIds(ids);
    }

    @Override
    public Type selectByPrimaryKey(Integer id) {
        return typeMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<Type> allType() {
        return typeMapper.selectByExample(null);
    }
}
