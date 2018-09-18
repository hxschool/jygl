package com.hxci.service.impl;

import com.hxci.dao.GzzwMapper;
import com.hxci.pojo.Gzzw;
import com.hxci.service.GzzwlbService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@SuppressWarnings("all")
@Service
@Transactional
public class GzzwlbServiceImpl implements GzzwlbService {

    @Autowired
    private GzzwMapper gzzwMapper;

    @Override
    public List<Gzzw> selectAll() {
        return gzzwMapper.selectAll();
    }
}
