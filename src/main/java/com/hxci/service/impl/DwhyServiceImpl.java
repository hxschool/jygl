package com.hxci.service.impl;

import com.hxci.dao.DwhyMapper;
import com.hxci.pojo.Dwhy;
import com.hxci.service.DwhyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@SuppressWarnings("all")
@Service
@Transactional
public class DwhyServiceImpl implements DwhyService {

    @Autowired
    private DwhyMapper dwhyMapper;

    @Override
    public List<Dwhy> selectAll() {
        return dwhyMapper.selectAll();
    }
}
