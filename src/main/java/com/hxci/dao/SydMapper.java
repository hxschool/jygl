package com.hxci.dao;

import com.hxci.pojo.Syd;

public interface SydMapper {
    int deleteByPrimaryKey(Integer syszddm);

    int insert(Syd record);

    int insertSelective(Syd record);

    Syd selectByPrimaryKey(Integer syszddm);

    int updateByPrimaryKeySelective(Syd record);

    int updateByPrimaryKey(Syd record);
}