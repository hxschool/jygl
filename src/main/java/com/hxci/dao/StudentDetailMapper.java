package com.hxci.dao;

import com.hxci.pojo.Statistical;
import com.hxci.pojo.StudentDetail;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Param;

public abstract interface StudentDetailMapper
{
  public abstract int deleteByPrimaryKey(StudentDetail paramStudentDetail);

  public abstract int insert(StudentDetail paramStudentDetail);

  public abstract int insertSelective(StudentDetail paramStudentDetail);

  public abstract StudentDetail selectByPrimaryKey(StudentDetail paramStudentDetail);

  public abstract StudentDetail findByStudent(String paramString);

  public abstract StudentDetail selectByLogin(StudentDetail paramStudentDetail);

  public abstract StudentDetail selectByStudent(StudentDetail paramStudentDetail);

  public abstract StudentDetail casLogin(@Param("studentNumber") String paramString);

  public abstract void casStudent(StudentDetail paramStudentDetail);

  public abstract int updateByPrimaryKeySelective(StudentDetail paramStudentDetail);

  public abstract int updatePassword(StudentDetail paramStudentDetail);

  public abstract int resetPassword(StudentDetail paramStudentDetail);

  public abstract int updateByPrimaryKeyAndBysjSelective(StudentDetail paramStudentDetail);

  public abstract int updateByPrimaryKey(StudentDetail paramStudentDetail);

  public abstract List<StudentDetail> selectPortion(StudentDetail paramStudentDetail);

  public abstract int selectCount(@Param("bysj") String paramString1, @Param("szyx") String paramString2);

  public abstract StudentDetail selectByTwoTerm(StudentDetail paramStudentDetail);

  public abstract List<Map<String, Object>> selectByList(StudentDetail paramStudentDetail);

  public abstract List<Map<String, Object>> selectAllCountList(@Param("date") String paramString);

  public abstract List<StudentDetail> getByBysj(@Param("date") String paramString);

  public abstract List<Statistical> statisticalSzyx(StudentDetail paramStudentDetail);

  public abstract List<Statistical> statisticalGzlb(StudentDetail paramStudentDetail);

  public abstract List<Statistical> statisticalDwhy(StudentDetail paramStudentDetail);

  public abstract int updateByStudent(StudentDetail paramStudentDetail);
}