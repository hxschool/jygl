package com.hxci.service.impl;

import com.hxci.dao.ZdtypeMapper;
import com.hxci.pojo.Zdtype;
import com.hxci.service.ZdtypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@SuppressWarnings("all")
@Service
@Transactional
public class ZdtypeServiceImpl implements ZdtypeService {

    @Autowired
    private ZdtypeMapper zdtypeMapper;

    @Override
    public List<Zdtype> selectAll() {
        return zdtypeMapper.selectAll();
    }

    @Override
    public List<Map<String ,Object >> selectAllByMap() {
        return zdtypeMapper.selectAllByMap();
    }
}
