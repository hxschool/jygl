package com.hxci.dao;

import com.hxci.pojo.Year;

import java.util.List;

public interface YearMapper {
    int insert(Year record);

    int insertSelective(Year record);

    List<Year> selectAll();
}