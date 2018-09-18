package com.hxci.dao;

import com.hxci.pojo.Dwxz;

import java.util.List;

public interface DwxzMapper {
    int deleteByPrimaryKey(Integer dwxzdm);

    int insert(Dwxz record);

    int insertSelective(Dwxz record);

    Dwxz selectByPrimaryKey(Integer dwxzdm);

    int updateByPrimaryKeySelective(Dwxz record);

    int updateByPrimaryKey(Dwxz record);

    List<Dwxz> selectAll();
}