package com.hxci.controller;

import com.hxci.pojo.Gzzw;
import com.hxci.service.GzzwlbService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/gzzwlb")
public class GzzwlbController {

    @Autowired
    private GzzwlbService gzzwlbService;

    @RequestMapping("/{date}/get")
    @ResponseBody
    public List<Gzzw> get(){
        return gzzwlbService.selectAll();
    }

}
