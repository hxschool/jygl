package com.hxci.controller;

import com.hxci.pojo.StudentDetail;
import com.hxci.pojo.Teacher;
import com.hxci.service.DwszdService;
import com.hxci.service.StudentDetailService;
import com.hxci.service.YearService;
import com.hxci.util.HashMD5Utils;
import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping({"/student"})
public class StudentDetailController
{

  @Autowired
  private YearService yearService;

  @Autowired
  private StudentDetailService studentDetailService;

  @Autowired
  private DwszdService dwszdService;

  @RequestMapping({"/{date}/{url}"})
  public String selectAll(String id, String szyx, @PathVariable String date, @PathVariable String url, HttpServletRequest request, Model model, Integer pageNo, StudentDetail studentDetail)
  {
    if (pageNo == null) {
      pageNo = Integer.valueOf(1);
      studentDetail.setStartPage(Integer.valueOf(0));
    } else {
      studentDetail.setStartPage(Integer.valueOf((pageNo.intValue() - 1) * 10));
    }
    if (studentDetail.getSize() == null) {
      studentDetail.setSize(Integer.valueOf(10));
    }
    request.setAttribute("years", this.yearService.get());

    if (!("".equals(date)))
      request.getSession().setAttribute("date", date);
    else {
      request.getSession().setAttribute("date", "2018");
    }
    if ("home".equals(url)) {
      return "jsp/teacher/" + url;
    }
    Teacher teacher = (Teacher)request.getSession().getAttribute("teacher");
    String dep = teacher.getDepartment();
    if ("list".equals(url)) {
      if ((!("".equals(szyx))) && (szyx != null)) {
        if ((dep == null) || ("".equals(dep)))
          model.addAttribute("szyx", szyx);
        else
          studentDetail.setSzyx(dep);
      }
      else {
        model.addAttribute("szyx", "");
        studentDetail.setSzyx(dep);
      }
      if ((!("".equals(id))) && (id != null))
        model.addAttribute("id", id);
      else {
        model.addAttribute("id", "");
      }
      model.addAttribute("count", this.studentDetailService.selectAllCountList(date));
      model.addAttribute("allcount", Integer.valueOf(this.studentDetailService.selectCount(date, studentDetail.getSzyx())));
      model.addAttribute("pageNo", pageNo);
      model.addAttribute("pagination", this.studentDetailService.selectPortion(studentDetail, date, url, id));
      return "jsp/teacher/" + url;
    }
    return "jsp/teacher/" + url;
  }

  @RequestMapping({"/selectOne"})
  public String selectOne(StudentDetail studentDetail, Model model)
  {
    StudentDetail _studentDetail1 = this.studentDetailService.selectByTwoTerm(studentDetail);
    model.addAttribute("student", _studentDetail1);
    return "jsp/teacher/list_right";
  }

  @RequestMapping({"/{date}/update"})
  @ResponseBody
  public boolean update(StudentDetail studentDetail)
  {
    int result = this.studentDetailService.update(studentDetail);
    return (result > 0);
  }

  @RequestMapping({"/{date}/upload"})
  public void upload(@RequestParam(value="filename", required=false) MultipartFile file, @PathVariable String date, HttpServletRequest request, HttpServletResponse response) throws IOException
  {
    List list = this.studentDetailService.readExcelFile(file, response, "");
    request.setAttribute("mess", list.get(0));
    request.setAttribute("size", list.get(1));
    response.setContentType("text/html;charset=gbk");
    PrintWriter out = response.getWriter();
    out.print("<script>alert('" + ((String)list.get(0)) + ",共" + ((String)list.get(1)) + "条');window.location.href='/student/" + date + "/home';</script>");
  }

  @RequestMapping({"/{date}/update_jb"})
  public void update_jb(@RequestParam(value="filename", required=false) MultipartFile file, @PathVariable String date, HttpServletRequest request, HttpServletResponse response) throws IOException
  {
    List list = this.studentDetailService.update_jb(file, response, "", date);
    request.setAttribute("mess", list.get(0));
    request.setAttribute("size", list.get(1));
    response.setContentType("text/html;charset=gbk");
    PrintWriter out = response.getWriter();
    out.print("<script>alert('" + ((String)list.get(0)) + ",共" + ((String)list.get(1)) + "条');window.location.href='/student/" + date + "/home';</script>");
  }

  @RequestMapping({"/{date}/partExport"})
  public void partExport(@PathVariable String date, HttpServletResponse response, String szyx)
  {
    SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
    String title;
    if (("".equals(szyx)) || (szyx == null)) {
      title = "毕业生信息表(" + date + "届)_" + df.format(new Date()).trim().toString();
      this.studentDetailService.downloadExcelFile(title, response, date, null);
    } else {
      title = "毕业生信息表(" + date + "届)_" + szyx + "_" + df.format(new Date()).trim().toString();
      this.studentDetailService.downloadExcelFile(title, response, date, szyx);
    }
  }

  @RequestMapping({"/{date}/checkStuList"})
  @ResponseBody
  public Integer checkStuList(@PathVariable String date)
  {
    List list = this.studentDetailService.checkStuList(date);
    return Integer.valueOf(list.size());
  }

  @RequestMapping({"/index"})
  public String slogin(HttpServletRequest request) {
    request.setAttribute("dwszds", this.dwszdService.selectAll());
    return "jsp/student/index";
  }

  @RequestMapping({"/password"})
  public String studentpassword(HttpServletRequest request) {
    return "jsp/student/studentpass";
  }

  @RequestMapping({"/updatepassword"})
  @ResponseBody
  public String updatepassword(StudentDetail studentDetail, HttpServletRequest request) {
    studentDetail.setPassword(HashMD5Utils.encryPassword(studentDetail.getPassword()));
    return ((this.studentDetailService.updatePassword(studentDetail) > 0) ? "true" : "false");
  }

  @RequestMapping({"/studentdetail"})
  public String studentdetail(ModelMap map, HttpServletRequest request)
  {
    StudentDetail studentDetailSession = (StudentDetail)request.getSession().getAttribute("student");
    StudentDetail studentDetail = this.studentDetailService.selectByStudent(studentDetailSession);
    map.put("studentDetail", studentDetail);
    return "jsp/student/panel_add";
  }

  @RequestMapping(method={org.springframework.web.bind.annotation.RequestMethod.POST}, value={"/supdate"})
  public void supdate(StudentDetail studentDetail, HttpServletResponse response) throws IOException {
    if ((studentDetail.getPassword() == null) || ("".equals(studentDetail.getPassword())))
      studentDetail.setPassword("caa93c50fc6d74feea79e0b6aee45235");
    else {
      studentDetail.setPassword(HashMD5Utils.encryPassword(studentDetail.getPassword()));
    }
    int i = this.studentDetailService.update(studentDetail);
    response.setContentType("text/html;charset=gbk");
    PrintWriter out = response.getWriter();
    if (i > 0)
    {
      out.print("<script>alert('信息添加成功');window.location.href='/slogin.jsp';</script>");
    }
    else out.print("<script>alert('信息添加失败,请重新添');window.location.href='/student/index';</script>");
  }

  @RequestMapping({"/studentForUpdate"})
  public String updateByStudent(StudentDetail student)
  {
    System.err.println(student);
    this.studentDetailService.updateByStudent(student);
    return "redirect:/student/studentdetail";
  }
}