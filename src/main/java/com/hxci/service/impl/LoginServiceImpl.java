package com.hxci.service.impl;

import com.hxci.dao.StudentDetailMapper;
import com.hxci.pojo.StudentDetail;
import com.hxci.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@SuppressWarnings("all")
@Service
public class LoginServiceImpl implements LoginService {

    @Autowired
    private StudentDetailMapper studentDetailMapper;

    @Override
    public StudentDetail student_login(StudentDetail studentDetail) {
        return studentDetailMapper.selectByLogin(studentDetail);
    }
}
