package com.hxci.service.impl;

import com.hxci.dao.BdzMapper;
import com.hxci.pojo.Bdz;
import com.hxci.service.BdzService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@SuppressWarnings("all")
@Service
@Transactional
public class BdzServiceImpl implements BdzService {

    @Autowired
    private BdzMapper bdzMapper;

    @Override
    public List<Bdz> selectAll() {
        return bdzMapper.selectAll();
    }
}
