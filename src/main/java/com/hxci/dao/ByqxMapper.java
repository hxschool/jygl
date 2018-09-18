package com.hxci.dao;

import com.hxci.pojo.Byqx;

import java.util.List;

public interface ByqxMapper {
    int deleteByPrimaryKey(Integer byqxdm);

    int insert(Byqx record);

    int insertSelective(Byqx record);

    Byqx selectByPrimaryKey(Integer byqxdm);

    int updateByPrimaryKeySelective(Byqx record);

    int updateByPrimaryKey(Byqx record);

    List<Byqx> selectAll();
}