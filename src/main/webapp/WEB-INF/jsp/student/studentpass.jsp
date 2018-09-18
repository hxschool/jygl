<%@ page import="com.hxci.pojo.StudentDetail" %><%--
  Created by IntelliJ IDEA.
  User: xuning
  Date: 2017/12/16
  Time: 20:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>学生信息查询</title>
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/jym.css">
    <link rel="stylesheet" href="/css/graduate.css">
    <script src="/js/jquery-3.2.1.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="/css/userInfo.css" />
    <link rel="stylesheet" href="/css/index.css">

    <script>
        $(function () {
            $("#btn").click(function () {
                window.location.href="/student/index";
            });
        });
    </script>
    <style>
        .main{margin-top:30px;}
        .tabable{padding:15px;}
        .tabs-left{background-color:#FFF;}
    </style>
    <script>
        $(function () {
            var boo =[false,false];
            var userPassword;
            <%
                    StudentDetail student = ((StudentDetail)session.getAttribute("student"));
                    if(student !=null){
            %>
            userPassword="<%=student.getPassword()%>";
            <% }%>
            $("#oldpassword").change(function () {
                $(".yzmima").hide();
               	$.ajax({
               		url:"/update/checkPassword",
               		dataType:"json",
               		data:{"oldpassword":$(this).val()},
               		success:function(result){
                        if(!(result == userPassword)){
                            $("#oldmima").show();
                            $("#div_oldpassword").attr("class"," has-error");
                            boo[0] = false;
                        }else{
                            $("#oldmima").hide();
                            $("#div_oldpassword").removeClass("has-error");
                            boo[0]=true;
                        }
               		}
               	});
            });
            $("#oldpassword").change(function () {
                $(".yzmima").hide();
                if(!($(this).val() == userPassword)){
                    $("#oldmima").show();
                    $("#div_oldpassword").attr("class"," has-error");
                    boo[0] = false;
                }else{
                    $("#oldmima").hide();
                    $("#div_oldpassword").removeClass("has-error");
                    boo[0]=true;
                }
            });
            $("#newpassword1 ").change(function () {
                var newpassword1 = $("input[name='pass1']").val();
                var newpassword2 = $("input[name='pass2']").val();
                $(".yzmima").hide();
                if(newpassword1 != newpassword2){
                    $("#newmima1").show();
                    $("#newmima2").show();
                    $("#div_newpassword1").attr("class"," has-error");
                    $("#div_newpassword2").attr("class"," has-error");
                    boo[1]=false;
                }else{
                    $("#newmima1").hide();
                    $("#newmima2").hide();
                    $("#div_newpassword1").removeClass("has-error");
                    $("#div_newpassword2").removeClass("has-error");
                    boo[1]=true;
                }
            });

            $("#newpassword2 ").change(function () {
                var newpassword1 = $("input[name='pass1']").val();
                var newpassword2 = $("input[name='pass2']").val();
                $(".yzmima").hide();
                if(newpassword1 != newpassword2){
                    $("#newmima1").show();
                    $("#newmima2").show();
                    $("#div_newpassword1").attr("class"," has-error");
                    $("#div_newpassword2").attr("class"," has-error");
                    boo[1]=false;
                }else{
                    $("#newmima1").hide();
                    $("#newmima2").hide();
                    $("#div_newpassword1").removeClass("has-error");
                    $("#div_newpassword2").removeClass("has-error");
                    boo[1]=true;
                }
            });

            $("#qd").click(function () {
                if(boo[0]==true && boo[1]==true){
                    var userpassword = $("#newpassword1").val();
                    if(userpassword == userPassword){
                        $(".yzmima").show();
                    }else{
                        $(".yzmima").hide();
                        //发送请求
                        $.ajax({
                        		url:"/student/updatepassword",
                        		dataType:"json",
                        		data:{"password":userpassword,"sfzh":$("#id").val()},
                        		success:function(result){
                        			if(result){
                        				//下线处理
                        				alert("修改成功");
                        				window.location.href="/slogout";
                        			}else{
                                		alert("修改失败");
                                }
                        		}
                        });
                    }
                }else{
                    alert("请检验");
                }

            });
        });
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
                <li ><a href="/student/studentdetail">个人信息</a></li>
                <li class="active"><a href="/student/password">修改密码</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right user-info" id="navbar-top-info">
                <li class="dropdown">
                    <a href="#"  class="dropdown-toggle" data-toggle="dropdown" data-role="department">${student.xm},同学<span class="badge badge-important" id="notification"></span><b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li><a href="/student/password"><span class="glyphicon glyphicon-edit"></span>　修改密码</a></li>
                        <li><a href="/slogout" style="color:#FF3333;"><span class="glyphicon glyphicon-log-out"></span>　退出登录</a></li>
                        <input type="hidden" id="id" value="${student.sfzh}" />
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</header>
<div class="container-fluid main">
    <div class="tabable tabs-left clearfix">
        <table class="table ">
            <colgroup>
                <col width="20%"></col><col width="45%"></col><col width="35%"></col>
            </colgroup>
            <tr>
                <th>用户名：</th>
                <td>
                    ${student.xh}
                </td>
                <td></td>
            </tr>
            <tr>
                <th>姓 名：</th>
                <td>
                    ${student.xm}
                </td>
                <td></td>
            </tr>
            <tr>
                <th>原密码：</th>
                <td>
                    <div class="" id="div_oldpassword">
                        <input class="form-control" type="password" id="oldpassword" />
                    </div>
                </td>
                <td>
                    <div id="oldmima" style="display: none;color: red;" >原密码不正确</div>
                    <div style="display: none;color: red;" class="yzmima">修改密码不能与原密码相同</div>
                </td>
            </tr>
            <tr>
                <th>新密码：</th>
                <td>
                    <div class="" id="div_newpassword1">
                        <input class="form-control" type="password" name="pass1"  id="newpassword1" />
                    </div>
                </td>
                <td>
                    <div id="newmima1" style="display: none;color:red;">两次密码不同</div>
                    <div style="display: none;color: red;" class="yzmima">修改密码不能与原密码相同</div>
                </td>
            </tr>
            <tr>
                <th>确认密码：</th>
                <td>
                    <div class="" id="div_newpassword2">
                        <input class="form-control" name="pass2" type="password" id="newpassword2" />

                    </div>
                </td>
                <td>
                    <div style="display: none;color: red;" class="yzmima">修改密码不能与原密码相同</div>
                    <div id="newmima2" style="display: none;color: red;">两次密码不同</div>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <div class="text-center">
                        <button class="btn btn-info" id="qd">确定</button>
                        <button class="btn btn-link" >取消</button>
                    </div>
                </td>
            </tr>
        </table>
    </div>
</div>

<jsp:include page="../teacher/footer/footer.jsp"></jsp:include>

</body>
</html>
