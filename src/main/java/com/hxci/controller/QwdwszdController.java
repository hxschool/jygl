package com.hxci.controller;

import com.hxci.pojo.Qwdwszd;
import com.hxci.service.QwdwszdService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/qwdwszd")
public class QwdwszdController {

    @Autowired
    private QwdwszdService qwdwszdService;

    @RequestMapping("/{date}/get")
    @ResponseBody
    public List<Qwdwszd> get(){
        return qwdwszdService.selectAll();
    }

}
