package com.hxci.dao;

import com.hxci.pojo.Xb;

public interface XbMapper {
    int deleteByPrimaryKey(Integer xbdm);

    int insert(Xb record);

    int insertSelective(Xb record);

    Xb selectByPrimaryKey(Integer xbdm);

    int updateByPrimaryKeySelective(Xb record);

    int updateByPrimaryKey(Xb record);
}