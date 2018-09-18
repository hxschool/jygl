package com.hxci.dao;

import com.hxci.pojo.Bdz;

import java.util.List;

public interface BdzMapper {
    int insert(Bdz record);

    int insertSelective(Bdz record);

    List<Bdz> selectAll();

}