package com.hxci.service;

import com.hxci.pojo.Teacher;
import java.util.List;

public abstract interface TeacherService
{
  public abstract Teacher login(Teacher paramTeacher);

  public abstract int updateTeacher(Teacher paramTeacher);

  public abstract Teacher casLogin(String paramString);

  public abstract void casTeacher(Teacher paramTeacher);

  public abstract List<Teacher> selectTeacher();

  public abstract int insertSelective(Teacher paramTeacher);

  public abstract int updateResTeacherPassword(Teacher paramTeacher);

  public abstract int deleteByTeacher(Integer paramInteger);
}