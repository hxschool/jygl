package com.hxci.dao;

import com.hxci.pojo.Xl;

public interface XlMapper {
    int deleteByPrimaryKey(String xldm);

    int insert(Xl record);

    int insertSelective(Xl record);

    Xl selectByPrimaryKey(String xldm);

    int updateByPrimaryKeySelective(Xl record);

    int updateByPrimaryKey(Xl record);
}