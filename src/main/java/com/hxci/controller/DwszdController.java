package com.hxci.controller;

import com.hxci.pojo.Dwszd;
import com.hxci.service.DwszdService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/dwszd")
public class DwszdController {

    @Autowired
    private DwszdService dwszdService;

    @RequestMapping("/{date}/get")
    @ResponseBody
    public List<Dwszd> get(){
        return dwszdService.selectAll();
    }
}
