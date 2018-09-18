package com.hxci.dao;

import com.hxci.pojo.Zdtype;

import java.util.List;
import java.util.Map;

public interface ZdtypeMapper {
    int deleteByPrimaryKey(String zddm);

    int insert(Zdtype record);

    int insertSelective(Zdtype record);

    Zdtype selectByPrimaryKey(String zddm);

    int updateByPrimaryKeySelective(Zdtype record);

    int updateByPrimaryKey(Zdtype record);

    List<Zdtype> selectAll();

    List<Map<String ,Object >> selectAllByMap();

}