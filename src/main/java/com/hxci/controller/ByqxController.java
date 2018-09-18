package com.hxci.controller;

import com.hxci.pojo.Byqx;
import com.hxci.service.ByqxService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/byqx")
public class ByqxController {

    @Autowired
    private ByqxService byqxService;

    @RequestMapping("/{date}/get")
    @ResponseBody
    public List<Byqx> get(){
        return byqxService.selectAll();
    }

}
