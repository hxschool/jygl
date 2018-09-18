<%--
  Created by IntelliJ IDEA.
  User: xuning
  Date: 2017/11/21
  Time: 17:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/student/2018/upload" method="post" enctype="multipart/form-data">
    <input type="file" name="filename" />
    <input type="submit" value="上传文件"/>
</form>

<br/>
<br/>
<br/>
<br/>
<form action="zdtype/2018/exportMB" method="post" id="form2">
    <input type="submit" id="exportExcel" name="exportExcel" value="Excel导出"/>
</form>

<script type="text/javascript">
<%
if(request.getSession().getAttribute("teacher")!=null){
%>
window.location.href="student/2018/home";
<%
}
if(request.getSession().getAttribute("student")!=null){
%>
window.location.href="student/studentdetail";
<%}%>
</script>
</body>
</html>
