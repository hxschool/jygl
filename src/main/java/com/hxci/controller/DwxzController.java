package com.hxci.controller;

import com.hxci.pojo.Dwxz;
import com.hxci.service.DwxzService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/dwxz")
public class DwxzController {

    @Autowired
    private DwxzService dwxzService;

    @ResponseBody
    @RequestMapping("/{date}/get")
    public List<Dwxz> get(){
        return dwxzService.selectAll();
    }

}
