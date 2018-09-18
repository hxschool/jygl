package com.hxci.service.impl;

import com.hxci.dao.QwdwszdMapper;
import com.hxci.pojo.Qwdwszd;
import com.hxci.service.QwdwszdService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@SuppressWarnings("all")
@Service
@Transactional
public class QwdwszdServiceImpl implements QwdwszdService {

    @Autowired
    private QwdwszdMapper qwdwszdMapper;

    @Override
    public List<Qwdwszd> selectAll() {
        return qwdwszdMapper.selectAll();
    }
}
