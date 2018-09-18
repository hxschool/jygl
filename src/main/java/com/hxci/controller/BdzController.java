package com.hxci.controller;

import com.hxci.pojo.Bdz;
import com.hxci.service.BdzService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/bdzqflb")
public class BdzController {

    @Autowired
    private BdzService bdzService;

    @RequestMapping("/{date}/get")
    @ResponseBody
    public List<Bdz> get(){
        return bdzService.selectAll();
    }

}
