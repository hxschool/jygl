package com.hxci.service.impl;

import com.hxci.dao.TeacherMapper;
import com.hxci.pojo.Teacher;
import com.hxci.service.TeacherService;
import com.hxci.util.HashMD5Utils;
import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("teacherService")
@Transactional
public class TeacherServiceImpl
  implements TeacherService
{

  @Resource
  private TeacherMapper teacherMapper;

  public Teacher login(Teacher teacher)
  {
    Teacher tea = this.teacherMapper.selectByLoginForTeacher(teacher);
    return ((tea == null) ? null : tea);
  }

  public int updateTeacher(Teacher teacher)
  {
    return this.teacherMapper.updateByPrimaryKeySelective(teacher);
  }

  public Teacher casLogin(String username)
  {
    return this.teacherMapper.casLogin(username);
  }

  public void casTeacher(Teacher teacher)
  {
    this.teacherMapper.casTeacher(teacher);
  }

  public List<Teacher> selectTeacher()
  {
    return this.teacherMapper.selectTeacher();
  }

  public int insertSelective(Teacher record)
  {
    if (record.getDepartment().equals("ADMIN")) {
      record.setDepartment("");
      record.setZhiwu("管理员");
    }
    if (record.getDepartment().equals("RJXY")) {
      record.setDepartment("软件学院");
      record.setZhiwu("教师");
    }
    if (record.getDepartment().equals("SXY")) {
      record.setDepartment("商学院");
      record.setZhiwu("教师");
    }
    if (record.getDepartment().equals("DZGCXY")) {
      record.setDepartment("电子工程学院");
      record.setZhiwu("教师");
    }
    if (record.getDepartment().equals("YSSJXY")) {
      record.setDepartment("艺术设计学院");
      record.setZhiwu("教师");
    }
    return this.teacherMapper.insertSelective(record);
  }

  public int updateResTeacherPassword(Teacher teacher)
  {
    teacher.setUserpassword(HashMD5Utils.encryPassword("1234"));
    return this.teacherMapper.updateResTeacherPassword(teacher);
  }

  public int deleteByTeacher(Integer id)
  {
    return this.teacherMapper.deleteByTeacher(id);
  }
}