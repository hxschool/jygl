package com.hxci.dao;

import com.hxci.pojo.Dwhy;

import java.util.List;

public interface DwhyMapper {
    int deleteByPrimaryKey(Integer dwhydm);

    int insert(Dwhy record);

    int insertSelective(Dwhy record);

    Dwhy selectByPrimaryKey(Integer dwhydm);

    int updateByPrimaryKeySelective(Dwhy record);

    int updateByPrimaryKey(Dwhy record);

    List<Dwhy> selectAll();
}