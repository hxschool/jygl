package com.hxci.dao;

import com.hxci.pojo.Yx;

public interface YxMapper {
    int deleteByPrimaryKey(Integer yxdm);

    int insert(Yx record);

    int insertSelective(Yx record);

    Yx selectByPrimaryKey(Integer yxdm);

    int updateByPrimaryKeySelective(Yx record);

    int updateByPrimaryKey(Yx record);
}