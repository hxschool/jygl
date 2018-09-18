package com.hxci.service.impl;

import com.hxci.dao.DwxzMapper;
import com.hxci.pojo.Dwxz;
import com.hxci.service.DwxzService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@SuppressWarnings("all")
@Service
@Transactional
public class DwxzServiceImpl implements DwxzService {

    @Autowired
    private DwxzMapper dwxzMapper;

    @Override
    public List<Dwxz> selectAll() {
        return dwxzMapper.selectAll();
    }
}
