package com.hxci.dao;

import com.hxci.pojo.Zzmm;

public interface ZzmmMapper {
    int deleteByPrimaryKey(String zzmmdm);

    int insert(Zzmm record);

    int insertSelective(Zzmm record);

    Zzmm selectByPrimaryKey(String zzmmdm);

    int updateByPrimaryKeySelective(Zzmm record);

    int updateByPrimaryKey(Zzmm record);
}