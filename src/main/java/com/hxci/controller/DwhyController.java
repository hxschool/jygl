package com.hxci.controller;

import com.hxci.pojo.Dwhy;
import com.hxci.service.DwhyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/dwhy")
public class DwhyController {

    @Autowired
    private DwhyService dwhyService;

    @ResponseBody
    @RequestMapping("/{date}/get")
    public List<Dwhy> get(){
        return dwhyService.selectAll();
    }

}
