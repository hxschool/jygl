package com.hxci.dao;

import com.hxci.pojo.Knlb;

public interface KnlbMapper {
    int deleteByPrimaryKey(Integer knslbdm);

    int insert(Knlb record);

    int insertSelective(Knlb record);

    Knlb selectByPrimaryKey(Integer knslbdm);

    int updateByPrimaryKeySelective(Knlb record);

    int updateByPrimaryKey(Knlb record);
}