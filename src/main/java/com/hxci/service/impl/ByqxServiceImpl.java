package com.hxci.service.impl;


import com.hxci.dao.ByqxMapper;
import com.hxci.pojo.Byqx;
import com.hxci.service.ByqxService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@SuppressWarnings("all")
@Service
@Transactional
public class ByqxServiceImpl implements ByqxService {

    @Resource
    private ByqxMapper byqxMapper;

    @Override
    public List<Byqx> selectAll() {
        return byqxMapper.selectAll();
    }
}
