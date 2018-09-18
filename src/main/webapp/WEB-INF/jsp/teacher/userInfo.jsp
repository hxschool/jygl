<%@ page language="java" import="java.util.*,com.hxci.pojo.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <title> 哈尔滨信息工程学院毕业生就业管理系统</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="description" content="The National University Graduate Employment Management System">
    <meta name="author" content="ncss tech">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/jym.css">
    <!--[if lt IE 9]>
    <![endif]-->
    <link rel="stylesheet" href="/css/graduate.css">
    <link rel="stylesheet" href="/css/userInfo.css" />
    <script src="/js/jquery-3.2.1.min.js"></script>
    <link rel="stylesheet" href="/css/index.css">
    <script src="/js/bootstrap.min.js"></script>


</head>
<body>
<style type="text/css">
    .badge{
        background-color: #FF6666 ;
    }
</style>
<header class="header">
    <div id="navbar-top" class="navbar jym-top">
        <div class="navbar-header">
            <a class="navbar-brand" href="#">就业管理系统</a>
        </div>
        <div class="collapse navbar-collapse">
            <ul class="nav navbar-nav nav-tabs" id="navbar-menu" role="tablist">
                <li><a href="/student/${date}/home">毕业生</a></li>
                <li class="active"><a href="/teacher/userInfo">用户管理</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right user-info" id="navbar-top-info">
                <li class="dropdown">
                    <a href="#"  class="dropdown-toggle" data-toggle="dropdown" data-role="department">${teacher.name}[哈尔滨信息工程学院&nbsp;${teacher.department}]<span class="badge badge-important" id="notification"></span><b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li><a href="/teacher/userInfo"><span class="glyphicon glyphicon-edit"></span>　修改个人信息</a></li>
                        <li><a href="/logout" style="color:#FF3333;"><span class="glyphicon glyphicon-log-out"></span>　退出登录</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</header>

<script src="/js/userInfo.js"></script>
<script>
    
    $(function () {
        $("#user").click(function () {
            $("#userInfo").show();
            $("#userInfo_pass").hide();
        });
        $("#user_pass").click(function () {
            $("#userInfo_pass").show();
            $("#userInfo").hide();
        });
    });
    
</script>
<script>
    $(function () {
        var boo =[false,false];
        var userPassword;
        <%
                Teacher teacher = ((Teacher)session.getAttribute("teacher"));
                if(teacher !=null){
        %>
        userPassword="<%=teacher.getUserpassword()%>";
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
                    $.post("/teacher/updatepassword",{"userpassword":userpassword,"id":$("#id").val()},function (result) {
                        if(result){
                            //下线处理
                            alert("修改成功");
                            window.location.href="/logout";
                        }else{
                            alert("修改失败");
                        }
                    });
                }
            }else{
                alert("请检验");
            }

        });
    });
</script>
<div class="container-fluid main">
    <div class="tabable tabs-left clearfix">
        <ul class="nav nav-tabs" role="tablist" id="myTab">
            <li role="presentation" class="active"><a href="#userInfo" role="tab" data-toggle="tab" id="user">个人信息修改</a></li>
            <li role="presentation"><a href="userInfo_pass" role="tab" data-toggle="tab" id="user_pass">密码修改</a></li>
            <input type="hidden" id="id" value="${teacher.id}" />
        </ul>
        <div class="tab-content" >
            <div role="tabpanel" id="userInfo_pass" style="display: none;">
                <div class="panel-body text-center">
                    <div class="alert"></div>
                    <table class="table ">
                        <colgroup>
                            <col width="20%"></col><col width="45%"></col><col width="35%"></col>
                        </colgroup>
                        <tr>
                            <th>用户名：</th>
                            <td>
                                ${teacher.username}
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <th>姓 名：</th>
                            <td>
                               ${teacher.name}
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

            <div role="tabpanel" id="userInfo">
                <div class="panel-body">
                    <div class="alert"></div>
                    <table class="table">
                        <colgroup>
                            <col width="20%"></col><col width="35%"></col><col width="auto"></col>
                        </colgroup>
                        <tbody>
                        <tr>
                            <th>用户名：</th>
                            <td>
                                <div class="value-wrap">${teacher.username}</div>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <th>姓 名：</th>
                            <td>
                                <div class="value-wrap">${teacher.name}</div>
                                <div class="edit-wrap">
                                    <input type="text" class="form-control" name="realName" id="xm" value="${teacher.name}">
                                    <span class="update-message">提示信息</span>
                                </div>
                            </td>
                            <td>
                                <div class="message-wrap"></div>
                                <div class="update-wrap">
                                    <button class="btn btn-link" id="xm_btn"> <span class="glyphicon glyphicon-edit"></span> 修改</button>
                                </div>
                                <div class="buttons-wrap">
                                    <button class="btn btn-info" id="xm_qd_btn">确定</button>
                                    <button class="btn btn-link" id="xm_qx_btn">取消</button>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th>隶属省份（地区代码）：</th>
                            <td>
                                <div class="value-wrap">${teacher.province}</div>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <th> 院 系： </th>
                            <td>
                                <div class="value-wrap">${teacher.department}</div>
                                <div class="edit-wrap">
                                    <input type="text" class="form-control" name="department" value="${teacher.department}">
                                    <span class="update-message">提示信息</span>
                                </div>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <th>职 务：</th>
                            <td>
                                <div class="value-wrap">${teacher.zhiwu}</div>
                                <div class="edit-wrap">
                                    <input type="text" class="form-control" id="zw" name="jobTitle" value="${teacher.zhiwu}">
                                    <span class="update-message">提示信息</span>
                                </div>
                            </td>
                            <td>
                                <div class="message-wrap"></div>
                                <div class="update-wrap">
                                    <button class="btn btn-link" id="zw_btn"> <span class="glyphicon glyphicon-edit"></span> 修改</button>
                                </div>
                                <div class="buttons-wrap">
                                    <button class="btn btn-info" id="zw_qd_btn">确定</button>
                                    <button class="btn btn-link" id="zw_qx_btn">取消</button>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th>电 话：</th>
                            <td>
                                <div class="value-wrap">${teacher.tel}</div>
                                <div class="edit-wrap">
                                    <input type="text" class="form-control" id="dh" name="officePhone" value="${teacher.tel}">
                                    <span class="update-message">提示信息</span>
                                </div>
                            </td>
                            <td>
                                <div class="message-wrap"></div>
                                <div class="update-wrap">
                                    <button class="btn btn-link" id="dh_btn"> <span class="glyphicon glyphicon-edit"></span> 修改</button>
                                </div>
                                <div class="buttons-wrap">
                                    <button class="btn btn-info" id="dh_qd_btn">确定</button>
                                    <button class="btn btn-link" id="dh_qx_btn">取消</button>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th>传 真：</th>
                            <td>
                                <div class="value-wrap">${teacher.fax}</div>
                                <div class="edit-wrap">
                                    <input type="text" class="form-control" id="cz" name="fax" value="${teacher.fax}">
                                    <span class="update-message">提示信息</span>
                                </div>
                            </td>
                            <td>
                                <div class="message-wrap"></div>
                                <div class="update-wrap">
                                    <button class="btn btn-link" id="cz_btn"> <span class="glyphicon glyphicon-edit"></span> 修改</button>
                                </div>
                                <div class="buttons-wrap">
                                    <button class="btn btn-info" id="cz_qd_btn">确定</button>
                                    <button class="btn btn-link" id="cz_qx_btn">取消</button>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th>手 机：</th>
                            <td>
                                <div class="value-wrap">${teacher.mobile}</div>
                                <div class="edit-wrap">
                                    <input type="text" class="form-control" value="${teacher.mobile}">
                                    <span class="update-message">提示信息</span>
                                </div>
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <th>电子邮箱：</th>
                            <td>
                                <div class="value-wrap">${teacher.email}</div>
                                <div class="edit-wrap">
                                    <input type="text" class="form-control" id="email" name="email" value="${teacher.email}">
                                    <span class="update-message">提示信息</span>
                                </div>
                            </td>
                            <td>
                                <div class="message-wrap"></div>
                                <div class="update-wrap">
                                    <button class="btn btn-link" id="email_btn"> <span class="glyphicon glyphicon-edit"></span> 修改</button>
                                </div>
                                <div class="buttons-wrap">
                                    <button class="btn btn-info" id="email_qd_btn">确定</button>
                                    <button class="btn btn-link" id="email_qx_btn">取消</button>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th>QQ号码：</th>
                            <td>
                                <div class="value-wrap">${teacher.qq}</div>
                                <div class="edit-wrap">
                                    <input type="text" class="form-control" id="qq" name="qq" value="${teacher.qq}">
                                    <span class="update-message">提示信息</span>
                                </div>
                            </td>
                            <td>
                                <div class="update-wrap">
                                    <button class="btn btn-link" id="qq_btn"> <span class="glyphicon glyphicon-edit"></span> 修改</button>
                                </div>
                                <div class="buttons-wrap">
                                    <button class="btn btn-info" id="qq_qd_btn">确定</button>
                                    <button class="btn btn-link" id="qq_qx_btn">取消</button>
                                </div>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" data-main="/resources/js/user/home" src="/js/requirejs.min.js"></script>
<!-- 尾部部分开始 -->
<jsp:include page="footer/footer.jsp"></jsp:include>
<!-- 尾部部分结束 -->

</body>
</html>