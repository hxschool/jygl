package com.hxci.service.impl;

import com.hxci.dao.YearMapper;
import com.hxci.pojo.Year;
import com.hxci.service.YearService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@SuppressWarnings("all")
@Service
@Transactional
public class YearServiceImpl implements YearService {

    @Autowired
    private YearMapper yearMapper;

    @Override
    public List<Year> get() {
        return yearMapper.selectAll();
    }
}
