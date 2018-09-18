package com.hxci.dao;

import com.hxci.pojo.Sfs;

public interface SfsMapper {
    int deleteByPrimaryKey(Integer sfslbdm);

    int insert(Sfs record);

    int insertSelective(Sfs record);

    Sfs selectByPrimaryKey(Integer sfslbdm);

    int updateByPrimaryKeySelective(Sfs record);

    int updateByPrimaryKey(Sfs record);
}