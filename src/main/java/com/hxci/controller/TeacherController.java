package com.hxci.controller;

import com.alibaba.fastjson.JSON;
import com.hxci.pojo.Statistical;
import com.hxci.pojo.StudentDetail;
import com.hxci.pojo.Teacher;
import com.hxci.service.StudentDetailService;
import com.hxci.service.TeacherService;
import com.hxci.util.HashMD5Utils;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping({"/teacher"})
public class TeacherController
{

  @Autowired
  private TeacherService teacherService;

  @Autowired
  private StudentDetailService studentDetailService;

  @Autowired
  private StudentDetailService studentService;

  @RequestMapping({"/userInfo"})
  public String userInfo()
  {
    return "jsp/teacher/userInfo";
  }

  @RequestMapping({"/update"})
  @ResponseBody
  public int update(Teacher teacher, HttpServletRequest request) {
    Teacher sessionTeacher = (Teacher)request.getSession().getAttribute("teacher");
    if (teacher.getName() != null) {
      sessionTeacher.setName(teacher.getName());
    }
    if (teacher.getZhiwu() != null) {
      sessionTeacher.setZhiwu(teacher.getZhiwu());
    }
    if (teacher.getTel() != null) {
      sessionTeacher.setTel(teacher.getTel());
    }
    if (teacher.getFax() != null) {
      sessionTeacher.setFax(teacher.getFax());
    }
    if (teacher.getEmail() != null) {
      sessionTeacher.setEmail(teacher.getEmail());
    }
    if (teacher.getQq() != null) {
      sessionTeacher.setQq(teacher.getQq());
    }
    request.getSession().setAttribute("teacher", sessionTeacher);
    return this.teacherService.updateTeacher(teacher);
  }

  @RequestMapping({"/updatepassword"})
  @ResponseBody
  public boolean updatepassword(Teacher teacher, HttpServletRequest request) {
    teacher.setUserpassword(HashMD5Utils.encryPassword(teacher.getUserpassword()));
    return (this.teacherService.updateTeacher(teacher) > 0);
  }

  @RequestMapping({"/leader"})
  public String leader(ModelMap map) {
    map.put("teachers", this.teacherService.selectTeacher());
    return "jsp/teacher/departmentleader";
  }

  @RequestMapping({"/leaderadd"})
  public String leaderadd(Teacher teacher, ModelMap map, HttpServletRequest request, HttpServletResponse response)
  {
    try {
      if (this.teacherService.insertSelective(teacher) > 0) {
        return "redirect:/teacher/leader";
      }
      response.getWriter().println("添加失败...");
      return "redirect:/teacher/leader";
    } catch (Exception e) {
    }
    return "redirect:/teacher/leader";
  }

  @RequestMapping({"/reset"})
  public String reset(Teacher teacher)
  {
    this.teacherService.updateResTeacherPassword(teacher);
    return "redirect:/teacher/leader";
  }

  @RequestMapping({"/delete"})
  public String delete(Integer id) {
    this.teacherService.deleteByTeacher(id);
    return "redirect:/teacher/leader";
  }

  @RequestMapping({"/studentpwdreset"})
  public String studentpwdreset() {
    return "jsp/teacher/studentpwdreset";
  }

  @RequestMapping({"/showStudentById"})
  @ResponseBody
  public String studentpwdreset(String xh, ModelMap map) {
    StudentDetail studentDetail = this.studentService.findByStudent(xh);
    if (studentDetail == null) {
      return null;
    }
    map.put("xb", (studentDetail.getXbdm().intValue() == 1) ? "男" : "女");
    map.put("xh", studentDetail.getXh());
    map.put("xm", studentDetail.getXm());
    map.put("szyx", studentDetail.getSzyx());
    map.put("zyfx", studentDetail.getZyfx());
    String jsonString = JSON.toJSONString(map);
    return jsonString;
  }

  @RequestMapping({"/resetStudentPwd"})
  @ResponseBody
  public Integer resetStudentPwd(String xh)
  {
    int i = this.studentService.resetPassword(xh);
    return Integer.valueOf(i);
  }

  @RequestMapping({"/statistical"})
  public String statistical(StudentDetail studentDetail, ModelMap map)
  {
    return "jsp/teacher/statistical";
  }

  @RequestMapping({"/statisticalSzyx"})
  @ResponseBody
  public String statisticalSzyx(StudentDetail studentDetail, ModelMap map, Teacher teacher) {
    if (teacher.getDepartment().equals("ALL")) {
      studentDetail.setSzyx(null);
      map.put("szyx", "全校统计");
    }
    if (teacher.getDepartment().equals("RJXY")) {
      studentDetail.setSzyx("软件学院");
      map.put("szyx", "软件学院");
    }
    if (teacher.getDepartment().equals("SXY")) {
      studentDetail.setSzyx("商学院");
      map.put("szyx", "商学院");
    }
    if (teacher.getDepartment().equals("DZGCXY")) {
      studentDetail.setSzyx("电子工程学院");
      map.put("szyx", "电子工程学院");
    }
    if (teacher.getDepartment().equals("YSSJXY")) {
      studentDetail.setSzyx("艺术设计学院");
      map.put("szyx", "艺术设计学院");
    }
    if ("0".equals(studentDetail.getXz())) {
      studentDetail.setXz(null);
      map.put("xzName", "本专");
    }
    List listdq = this.studentDetailService.statisticalSzyx(studentDetail);
    List listhy = this.studentDetailService.statisticalDwhy(studentDetail);
    List listgz = this.studentDetailService.statisticalGzlb(studentDetail);
    Statistical statistical = new Statistical();
    Integer allCountdq = statistical.getAllCount(listdq);
    Integer allCounthy = statistical.getAllCount(listhy);
    Integer allCountgz = statistical.getAllCount(listgz);
    map.put("allCountdq", allCountdq);
    map.put("listdq", listdq);
    map.put("allCounthy", allCounthy);
    map.put("listhy", listhy);
    map.put("allCountgz", allCountgz);
    map.put("listgz", listgz);
    if ("3".equals(studentDetail.getXz()))
      map.put("xzName", "专科");
    if ("4".equals(studentDetail.getXz())) {
      map.put("xzName", "本科");
    }
    String jsonString = JSON.toJSONString(map);
    return jsonString;
  }

  @RequestMapping({"/logout"})
  public String logout() {
    return "redirect:/logout";
  }
}