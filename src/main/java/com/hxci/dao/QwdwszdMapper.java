package com.hxci.dao;

import com.hxci.pojo.Qwdwszd;

import java.util.List;

public interface QwdwszdMapper {
    int deleteByPrimaryKey(Integer qwdwszddm);

    int insert(Qwdwszd record);

    int insertSelective(Qwdwszd record);

    Qwdwszd selectByPrimaryKey(Integer qwdwszddm);

    int updateByPrimaryKeySelective(Qwdwszd record);

    int updateByPrimaryKey(Qwdwszd record);

    List<Qwdwszd> selectAll();

}