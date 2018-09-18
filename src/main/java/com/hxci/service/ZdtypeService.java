package com.hxci.service;

import com.hxci.pojo.Zdtype;

import java.util.List;
import java.util.Map;

public interface ZdtypeService {

    List<Zdtype> selectAll();

    List<Map<String ,Object >> selectAllByMap();

}
