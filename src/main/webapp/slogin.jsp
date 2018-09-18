<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport"
		  content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>登录</title>
	<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="https://t3.chei.com.cn/passport/js/captchaChange.js"></script>
	<script type="text/javascript" src="https://t4.chei.com.cn/passport/js/common_rosters.js"></script>
	<link rel="icon" href="/passport/favicon.ico" type="image/x-icon" />
	<!-- css 样式 -->
	<link rel="stylesheet" type="text/css" href="style/css/login.css"/>
	<%--<link rel="stylesheet" href="style/css/bootstrap.min.css"/>--%>
	<script src="style/js/bootstrap.min.js"></script>
	<script src="https://t1.chei.com.cn/common/js/boomerang-min-20141211.js" type="text/javascript"></script>

</head>
<body id="cas" >
<div class="banner" style="text-align:center;" >
	<br/>
	<br/>
	<img width="80px" height="80px" style="vertical-align:middle;" src="style/images/logo.png">
	<span style="font-family:行楷;font-size:30px;">
	哈尔滨信息工程学院就业管理系统
	</span>
</div>
<div class="box clearfix">
	
	<div class="loginForm" id="sfzh_yz" style="display: none;">
		<div class="loginT">身份证后六位验证</div>
		<table border="0" cellspacing="15" cellpadding="0" class="loginTable">
			<tr >
				<td align="right" class="font01">验证身份证后6位:</td>
				<td colspan="2" align="left">
					<input id="sfzh" type="text" value="" size="6"/>

				</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td colspan="2">
					<input class="btn_blue"  type="button" id="yz-btn" value="登录" />
				</td>
			</tr>
		</table>
	</div>
	<div class="loginForm" id="login_yz">
		
		<form id="fm1" action="/login" method="post" autocomplete="off">
			
			<div class="loginT" style="font-family:行楷;"><h3>学生登录</h3></div>
			<table border="0" cellspacing="15" cellpadding="0" class="loginTable">
				<tr>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td align="right" class="font01" width="105">用户名:</td>
					<td colspan="2" align="left" width="295">
						<input placeholder="用户名为学号"  id="username" name="username" class="logininput l_login_name" tabindex="1" accesskey="n" type="text" value="" size="25"/>
					</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td align="right" class="font01">密　码:</td>
					<td colspan="2" align="left">
						<input  placeholder="初始密码请联系自己教师"  id="password" name="userpassword" class="logininput l_login_password" tabindex="2" accesskey="p" type="password" value="" size="25"/>
					</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td colspan="2">
						<input class="btn_blue"  type="button" id="login-btn" value="登录" />
					</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td align="right" class="font01">温馨提示:</td>
					<td colspan="2">
						<span class="" style="color:red">*重置密码请联系专业负责老师*</span>
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>
<div class="line01">&nbsp;</div>
<div class="footer">
	学校：<a href="javascript:void(0);" target="_blank">哈尔滨信息工程学院</a>　　版权：<a href="javascript:void(0);" target="_blank">哈尔滨信息工程学院就业指导中心</a>　　
	<br/>技术支持：<a href="javascript:void(0);" target="_blank">软件学院</a> &nbsp; &nbsp;&nbsp;&nbsp;  备案号：<a href="javascript:void(0);" target="_blank">黑ICP备17006741号-1</a>
             
</div>

<script>

	$(function () {
		$("#login-btn").click(function () {
			var username = $("#username").val();
			var password = $("#password").val();
			$.post("/slogin",{"xh":username,"password":password},function (result) {
			    if(result == ""){
                    alert("用户名账号或密码错误,请重输入");

				}else if(result == "insert"){
                    window.location.href="student/studentdetail";
				}else{
                    $("#sfzh_yz").show();
                    $("#login_yz").hide();
                    $("#yz-btn").click(function () {
                        if($("#sfzh").val() == result){
                            window.location.href="student/index";
                        }else{
                            alert("身份证后六位不正确");
                        }
                    });
				}
            });
        });
    });

</script>

</body>
</html>

