package com.hxci.dao;

import com.hxci.pojo.Gzzw;

import java.util.List;

public interface GzzwMapper {
    int deleteByPrimaryKey(Integer gzzwlbdm);

    int insert(Gzzw record);

    int insertSelective(Gzzw record);

    Gzzw selectByPrimaryKey(Integer gzzwlbdm);

    int updateByPrimaryKeySelective(Gzzw record);

    int updateByPrimaryKey(Gzzw record);

    List<Gzzw> selectAll();

}