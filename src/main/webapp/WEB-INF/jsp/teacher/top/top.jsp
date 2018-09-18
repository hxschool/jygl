<%--
  Created by IntelliJ IDEA.
  User: xuning
  Date: 2017/11/18
  Time: 19:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet"
                               href="/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/jym.css">
    <!--[if lt IE 9]>
    <script src="/resources/js/html5shiv.js"></script>
    <script src="/resources/js/respond.min.js"></script>
    <![endif]-->
    <link rel="stylesheet" href="/css/graduate.css">
    <link rel="stylesheet" href="/css/select2.css">
    <link rel="stylesheet" href="/css/index.css">
    <script>
        bootstrapButton = $.fn.button.noConflict();
        $.fn.bootstrapBtn = bootstrapButton;
    </script>


</head>
<body>
<header class="header">
    <div id="navbar-top" class="navbar jym-top">
        <div class="navbar-header">
            <a class="navbar-brand" href="#">就业管理系统</a>
        </div>
        <div class="collapse navbar-collapse">
            <ul class="nav navbar-nav nav-tabs" id="navbar-menu" role="tablist">
                <li class="active"><a href="/student/${date}/home">毕业生</a></li>
                <li><a href="/teacher/userInfo">用户管理</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right user-info" id="navbar-top-info">
                <li class="dropdown">
                    <a href="#" id="user" class="dropdown-toggle" data-toggle="dropdown" data-role="department">${teacher.name}[哈尔滨信息工程学院&nbsp;${teacher.department}]<span class="badge badge-important" id="notification"></span><b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li><a href="/teacher/userInfo"><span class="glyphicon glyphicon-edit"></span>　修改个人信息</a></li>
                        <li><a href="/logout" style="color:#FF3333;"><span class="glyphicon glyphicon-log-out"></span>　退出登录</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</header>
</body>
</html>
