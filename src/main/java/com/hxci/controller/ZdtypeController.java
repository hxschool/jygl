package com.hxci.controller;

import com.hxci.pojo.Zdtype;
import com.hxci.service.ZdtypeService;
import com.hxci.util.ExportExcelUtil;
import com.hxci.util.LanguageType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/zdtype")
public class ZdtypeController {

    @Autowired
    private ZdtypeService zdtypeService;

    @RequestMapping(value="/{date}/exportMB",method={RequestMethod.GET,RequestMethod.POST})
    public void  ajaxUploadExcel(HttpServletRequest request, HttpServletResponse response , LanguageType languageType) throws Exception {
        OutputStream os= response.getOutputStream();
        SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");//设置日期格式

        String fileName="毕业生信息表_" + df.format(new Date()).trim().toString();
        response.setContentType("application/vnd.ms-excel;charset=UTF-8");
        response.setContentType("text/html;charset=gbk"); 
//        response.setHeader("Content-disposition", "attachment;filename="+ URLEncoder.encode(fileName, "")+".xls");
        response.addHeader("Content-Disposition", "attachment;filename="+new String(fileName.getBytes("gbk"),"iso-8859-1") + ".xls");
        List<Zdtype> list = zdtypeService.selectAll();
        ExportExcelUtil.export(list, languageType,os);
    }



}
