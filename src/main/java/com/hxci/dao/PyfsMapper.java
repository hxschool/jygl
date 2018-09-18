package com.hxci.dao;

import com.hxci.pojo.Pyfs;

public interface PyfsMapper {
    int deleteByPrimaryKey(Integer pyfsdm);

    int insert(Pyfs record);

    int insertSelective(Pyfs record);

    Pyfs selectByPrimaryKey(Integer pyfsdm);

    int updateByPrimaryKeySelective(Pyfs record);

    int updateByPrimaryKey(Pyfs record);
}