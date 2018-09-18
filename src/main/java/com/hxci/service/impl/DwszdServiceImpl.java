package com.hxci.service.impl;

import com.hxci.dao.DwszdMapper;
import com.hxci.pojo.Dwszd;
import com.hxci.service.DwszdService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@SuppressWarnings("all")
@Service
@Transactional
public class DwszdServiceImpl implements DwszdService {

    @Autowired
    private DwszdMapper dwszdMapper;

    @Override
    public List<Dwszd> selectAll() {
        return dwszdMapper.selectAll();
    }
}
