package com.hxci.dao;

import com.hxci.pojo.Mz;

public interface MzMapper {
    int deleteByPrimaryKey(String mzdm);

    int insert(Mz record);

    int insertSelective(Mz record);

    Mz selectByPrimaryKey(String mzdm);

    int updateByPrimaryKeySelective(Mz record);

    int updateByPrimaryKey(Mz record);
}