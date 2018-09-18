package com.hxci.dao;

import com.hxci.pojo.Teacher;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public abstract interface TeacherMapper
{
  public abstract int deleteByPrimaryKey(Integer paramInteger);

  public abstract int insert(Teacher paramTeacher);

  public abstract int insertSelective(Teacher paramTeacher);

  public abstract Teacher selectByPrimaryKey(Integer paramInteger);

  public abstract int updateByPrimaryKeySelective(Teacher paramTeacher);

  public abstract int updateByPrimaryKey(Teacher paramTeacher);

  public abstract Teacher selectByLoginForTeacher(Teacher paramTeacher);

  public abstract Teacher casLogin(@Param("username") String paramString);

  public abstract void casTeacher(Teacher paramTeacher);

  public abstract List<Teacher> selectTeacher();

  public abstract int updateResTeacherPassword(Teacher paramTeacher);

  public abstract int deleteByTeacher(Integer paramInteger);
}