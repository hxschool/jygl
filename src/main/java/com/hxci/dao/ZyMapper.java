package com.hxci.dao;

import com.hxci.pojo.Zy;

public interface ZyMapper {
    int deleteByPrimaryKey(String zydm);

    int insert(Zy record);

    int insertSelective(Zy record);

    Zy selectByPrimaryKey(String zydm);

    int updateByPrimaryKeySelective(Zy record);

    int updateByPrimaryKey(Zy record);
}