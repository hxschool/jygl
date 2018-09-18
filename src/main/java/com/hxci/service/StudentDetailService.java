package com.hxci.service;

import cn.itcast.common.page.Pagination;
import com.hxci.pojo.Statistical;
import com.hxci.pojo.StudentDetail;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.multipart.MultipartFile;

public abstract interface StudentDetailService
{
  public abstract void casStudent(StudentDetail paramStudentDetail);

  public abstract StudentDetail findByStudent(String paramString);

  public abstract StudentDetail selectByStudent(StudentDetail paramStudentDetail);

  public abstract StudentDetail casLogin(String paramString);

  public abstract Pagination selectPortion(StudentDetail paramStudentDetail, String paramString1, String paramString2, String paramString3);

  public abstract StudentDetail selectByTwoTerm(StudentDetail paramStudentDetail);

  public abstract List<String> readExcelFile(MultipartFile paramMultipartFile, HttpServletResponse paramHttpServletResponse, String paramString);

  public abstract int update(StudentDetail paramStudentDetail);

  public abstract int updatePassword(StudentDetail paramStudentDetail);

  public abstract int resetPassword(String paramString);

  public abstract void downloadExcelFile(String paramString1, HttpServletResponse paramHttpServletResponse, String paramString2, String paramString3);

  public abstract List<Map<String, Object>> checkStuList(String paramString);

  public abstract List<String> update_jb(MultipartFile paramMultipartFile, HttpServletResponse paramHttpServletResponse, String paramString1, String paramString2);

  public abstract List<Map<String, Object>> selectAllCountList(String paramString);

  public abstract int selectCount(String paramString1, String paramString2);

  public abstract StudentDetail studentLogin(StudentDetail paramStudentDetail);

  public abstract List<Statistical> statisticalSzyx(StudentDetail paramStudentDetail);

  public abstract List<Statistical> statisticalGzlb(StudentDetail paramStudentDetail);

  public abstract List<Statistical> statisticalDwhy(StudentDetail paramStudentDetail);

  public abstract int updateByStudent(StudentDetail paramStudentDetail);
}