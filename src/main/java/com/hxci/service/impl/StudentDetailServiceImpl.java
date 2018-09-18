package com.hxci.service.impl;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSONArray;
import com.hxci.dao.StudentDetailMapper;
import com.hxci.pojo.Statistical;
import com.hxci.pojo.StudentDetail;
import com.hxci.service.StudentDetailService;
import com.hxci.service.ZdtypeService;
import com.hxci.util.ExcelUpload;
import com.hxci.util.ExcelUtil;
import com.hxci.util.HashMD5Utils;

import cn.itcast.common.page.Pagination;

@Service("studentDetailService")
@Transactional
public class StudentDetailServiceImpl
  implements StudentDetailService
{

  @Autowired
  private StudentDetailMapper studentDetailMapper;

  @Autowired
  private ZdtypeService zdtypeService;

  public Pagination selectPortion(StudentDetail studentDetail, String date, String url, String id)
  {
    StringBuilder params = new StringBuilder();
    if (studentDetail != null) {
      String bysj = date + "%";
      studentDetail.setBysj(bysj);
    }
    if (("".equals(id)) || (id == null))
      studentDetail.setKsh("");
    else {
      studentDetail.setKsh(id);
    }
    if (("".equals(studentDetail.getSzyx())) || (studentDetail.getSzyx() == null)) {
      studentDetail.setSzyx("");
    }
    Pagination pagination = new Pagination(
      studentDetail.getStartPage().intValue(), studentDetail.getSize().intValue(), 
      this.studentDetailMapper.selectCount(date + "%", studentDetail.getSzyx()));

    pagination.setList(this.studentDetailMapper.selectPortion(studentDetail));

    return pagination;
  }

  public StudentDetail selectByTwoTerm(StudentDetail studentDetail)
  {
    return this.studentDetailMapper.selectByTwoTerm(studentDetail);
  }

  public List<String> readExcelFile(MultipartFile file, HttpServletResponse response, String sheetName)
  {
    ExcelUpload<StudentDetail> excelTest = new ExcelUpload(StudentDetail.class);
    excelTest.readExcel(file, sheetName);
    List list = new ArrayList();
    try {
      for (StudentDetail studentDetail : excelTest.getList()) {
        this.studentDetailMapper.insertSelective(studentDetail);
      }
      list.add("上传成功");
      list.add(String.valueOf(excelTest.getTotalRows()));
    } catch (Exception e) {
      System.out.println("事物回滚");
      System.out.println(e.getMessage());
      list.add("上传失败");
      list.add(String.valueOf(excelTest.getTotalRows()));
    }
    return list;
  }

  public int update(StudentDetail studentDetail)
  {
    studentDetail.setIsInsert(Integer.valueOf(1));
    if (studentDetail.getPassword() == "") {
      studentDetail.setPassword(null);
    }
    return this.studentDetailMapper.updateByPrimaryKeySelective(studentDetail);
  }

  public int updatePassword(StudentDetail studentDetail)
  {
    return this.studentDetailMapper.updatePassword(studentDetail);
  }

  @SuppressWarnings("unlikely-arg-type")
public void downloadExcelFile(String title, HttpServletResponse response, String date, String szyx)
  {
    if (date != null) {
      date = date + "%";
    }
    StudentDetail student = new StudentDetail();
    student.setBysj(date);
    List<Map<String, Object>> zdtypes = this.zdtypeService.selectAllByMap();
    Map map = new LinkedHashMap();
    Map _map = new LinkedHashMap();
    for (Map<String, Object> zdtype : zdtypes) {
      _map.put(zdtype.get("Px").toString(), zdtype.get("key"));
      map.put(zdtype.get("key").toString(), zdtype.get("key"));
    }
    JSONArray ja = new JSONArray();
    List<Map<String, Object>> studentList = null;
    if ((szyx == null) || ("".equals(szyx))) {
      studentList = this.studentDetailMapper.selectByList(student);
    } else {
      student.setSzyx(szyx);
      System.err.println(student);
      studentList = this.studentDetailMapper.selectByList(student);
    }
    for (int i = 0; i < studentList.size(); i++) {
      Map<String, Object> mj = new LinkedHashMap<String, Object>();
      Map<String, Object> studentMap = studentList.get(i);
      for (int j = 0; j < _map.size(); j++) {
        mj.put(_map.get(j + 1+"").toString(), studentMap.get(_map.get(j + 1+"")));
      }
      ja.add(mj);
    }
    ExcelUtil.downloadExcelFile(title, map, ja, response);
  }

  public List<Map<String, Object>> checkStuList(String date)
  {
    if (date != null) {
      date = date + "%";
    }
    StudentDetail student = new StudentDetail();
    student.setBysj(date);
    return this.studentDetailMapper.selectByList(student);
  }

  public List<String> update_jb(MultipartFile file, HttpServletResponse response, String sheetName, String date)
  {
    String _date = date + "%";
    List<StudentDetail> stuDateAll = this.studentDetailMapper.getByBysj(_date);
    ExcelUpload<StudentDetail> excelUpload = new ExcelUpload<StudentDetail>(StudentDetail.class);
    excelUpload.readExcel(file, sheetName);
    List<StudentDetail> stuFileAll = excelUpload.getList();
    System.out.println("-----------" + stuDateAll);
    System.out.println("---test" + ((StudentDetail)stuFileAll.get(0)).getDasfzrxx());
    List<StudentDetail> studentDetails = compareList(stuDateAll, stuFileAll);
    System.out.println("---返回" + ((StudentDetail)stuFileAll.get(0)).getDasfzrxx());
    System.out.println("----------------------------------" + studentDetails.size());
    int i = 0;
    List<String> list = new ArrayList<String>();
    try {
      if (studentDetails.size() > 0) {
        for (StudentDetail studentDetail : studentDetails) {
          if ((studentDetail.getBysj() == "") || (studentDetail.getBysj() == null)) {
            studentDetail.setBysj(date + "07");
          }
          System.out.println("---" + studentDetail.getDasfzrxx());
          this.studentDetailMapper.updateByPrimaryKeyAndBysjSelective(studentDetail);
          ++i;
        }
        list.add("更新成功");
        list.add(i+"");
        return list;
      }
      list.add("更新失败");
      list.add("0");
    }
    catch (Exception e) {
      System.out.println("事物回滚");
      System.out.println(e.getMessage());
      list.add("上传失败");
      list.add(i+"");
    }
    return list;
  }

  public List<Map<String, Object>> selectAllCountList(String date)
  {
    if (!("".equals(date))) {
      date = date + "%";
    }
    return this.studentDetailMapper.selectAllCountList(date);
  }

  public int selectCount(String date, String szyx)
  {
    if (!("".equals(date))) {
      date = date + "%";
    }
    return this.studentDetailMapper.selectCount(date, szyx);
  }

  public StudentDetail studentLogin(StudentDetail studentDetail)
  {
    return studentDetail;
  }

  private List<StudentDetail> compareList(List<StudentDetail> firstList, List<StudentDetail> secondList)
  {
    System.out.println(secondList.size() + "excel");
    System.out.println(firstList.size() + "mysql");
    List<StudentDetail> temp = new ArrayList<StudentDetail>();

    int j = 0;
    if (firstList.size() >= secondList.size()) {
      int i = 0; 
      while (true) { StudentDetail secondStu = (StudentDetail)secondList.get(i);

        for (StudentDetail firstStu : firstList)
          if ((secondStu.getKsh().equals(firstStu.getKsh())) && (secondStu.getSfzh().equals(firstStu.getSfzh()))) {
            temp.add(secondStu);
            ++j;
            break;
          }
          ++i; 
          if (i >= secondList.size()){
        	  return temp; } 
          }
      }
      return null;
  }

  public StudentDetail casLogin(String studentNumber)
  {
    return this.studentDetailMapper.casLogin(studentNumber);
  }

  public void casStudent(StudentDetail studentDetail)
  {
    this.studentDetailMapper.casStudent(studentDetail);
  }

  public StudentDetail findByStudent(String xh)
  {
    return this.studentDetailMapper.findByStudent(xh);
  }

  public int resetPassword(String xh)
  {
    StudentDetail studentDetail = new StudentDetail();
    studentDetail.setXh(xh);
    studentDetail.setPassword(HashMD5Utils.encryPassword("888888"));
    return this.studentDetailMapper.resetPassword(studentDetail);
  }

  public List<Statistical> statisticalSzyx(StudentDetail studentDetail)
  {
    return this.studentDetailMapper.statisticalSzyx(studentDetail);
  }

  public List<Statistical> statisticalGzlb(StudentDetail studentDetail)
  {
    return this.studentDetailMapper.statisticalGzlb(studentDetail);
  }

  public List<Statistical> statisticalDwhy(StudentDetail studentDetail)
  {
    return this.studentDetailMapper.statisticalDwhy(studentDetail);
  }

  public StudentDetail selectByStudent(StudentDetail student)
  {
    return this.studentDetailMapper.selectByStudent(student);
  }

  public int updateByStudent(StudentDetail student)
  {
    return this.studentDetailMapper.updateByStudent(student);
  }
}