package com.hxci.dao;

import com.hxci.pojo.Dwszd;

import java.util.List;

public interface DwszdMapper {
    int deleteByPrimaryKey(Integer dwszddm);

    int insert(Dwszd record);

    int insertSelective(Dwszd record);

    Dwszd selectByPrimaryKey(Integer dwszddm);

    int updateByPrimaryKeySelective(Dwszd record);

    int updateByPrimaryKey(Dwszd record);

    List<Dwszd> selectAll();
}