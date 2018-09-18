package com.hxci.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.hxci.pojo.StudentDetail;
import com.hxci.pojo.Teacher;
import com.hxci.service.LoginService;
import com.hxci.service.TeacherService;
import com.hxci.util.HashMD5Utils;

@Controller
public class LoginController {

    @Autowired
    private TeacherService teacherService;

    @Autowired
    private LoginService loginService;
    
    @RequestMapping("/init")
    public String init( HttpServletRequest request,HttpServletResponse response){
        if(!(StringUtils.isEmpty(request.getSession().getAttribute("teacher")))){
            return "redirect:/student/2018/home";
        }
        if(!(StringUtils.isEmpty(request.getSession().getAttribute("student")))){
        	return "redirect:/student/studentdetail";
        }
        return "redirect:/logout";
    }
    

    @RequestMapping("/login")
    public String login(Teacher teacher , HttpServletRequest request){
    		teacher.setUserpassword(HashMD5Utils.encryPassword(teacher.getUserpassword()));
        if((teacher=teacherService.login(teacher)) != null){
            request.getSession().setAttribute("teacher" , teacher);
            return "redirect:/student/2018/home";
        }
        return "redirect:/logout";
    }

    @RequestMapping("/slogin")
    @ResponseBody
    public String slogin(StudentDetail studentDetail , HttpServletRequest request){
    		studentDetail.setPassword(HashMD5Utils.encryPassword(studentDetail.getPassword()));
        if((studentDetail = loginService.student_login(studentDetail)) != null){
            request.getSession().setAttribute("student",studentDetail);
            if(studentDetail.getIsInsert() == 0){
                return studentDetail.getSfzh().substring(12);
            }
            if(studentDetail.getIsInsert() == 1){
                return "insert";
            }
        }
        return "";
    }

    @RequestMapping("/logout")
    public String logout(HttpServletRequest request){
        Teacher teacher = (Teacher) request.getSession().getAttribute("teacher");
        if(teacher != null){
            request.getSession().removeAttribute("teacher");
        }
        return "../login";
    }

    @RequestMapping("/slogout")
    public String slogout(HttpServletRequest request){
        StudentDetail student = (StudentDetail) request.getSession().getAttribute("student");
        if(student != null){
            request.getSession().removeAttribute("student");
        }
        return "../slogin";
    }
    
    @RequestMapping("/update/checkPassword")
    @ResponseBody
    public String isCheckPassword(String oldpassword) {
    		Gson gson = new Gson();
    		String json = gson.toJson(HashMD5Utils.encryPassword(oldpassword));
    		return json;
    }


}
