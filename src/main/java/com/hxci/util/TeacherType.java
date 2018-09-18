package com.hxci.util;

@SuppressWarnings("all")
public class TeacherType
{
  
  private static final String ADMIN = "";
  private static final String RJXY = "软件学院";
  private static final String SXY = "商学院";
  private static final String DZGCXY = "电子工程学院";
  private static final String YSSJXY = "艺术设计学院";
  private static final String ROLE_ADMIN = "管理员";
  private static final String ROLE_TEACHER = "教师";

  public static String getDepartment(String department)
  {
    if (department.equals("ADMIN")) {
      return "";
    }
    if (department.equals("RJXY")) {
      return "软件学院";
    }
    if (department.equals("SXY")) {
      return "商学院";
    }
    if (department.equals("DZGCXY")) {
      return "电子工程学院";
    }
    if (department.equals("YSSJXY")) {
      return "艺术设计学院";
    }
    return null;
  }

  public static String getRole(String department) {
    if (department.equals("ADMIN")) {
      return "管理员";
    }
    return "教师";
  }

  public static void main(String[] args)
  {
    String s1 = getDepartment("RJXY");
    String s2 = getRole("RJXY");
    System.out.println(s1 + ":" + s2);
  }
}