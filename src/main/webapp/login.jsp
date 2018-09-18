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
	<div class="loginForm">
		<form id="fm1" action="/login" method="post" autocomplete="off">
			<div class="loginT" style="font-family:微软雅黑;"><h3>管理员登录</h3></div>
			<table border="0" cellspacing="15" cellpadding="0" class="loginTable">
				<tr>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td align="right" class="font01" width="105">用户名:</td>
					<td colspan="2" align="left" width="295">
						<input id="username" name="username" class="logininput l_login_name" tabindex="1" accesskey="n" type="text" value="" size="25"/>
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
					<td align="right" class="font01">密　码:</td>
					<td colspan="2" align="left">
						<input id="password" name="userpassword" class="logininput l_login_password" tabindex="2" accesskey="p" type="password" value="" size="25"/>
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
					<td>&nbsp;</td>
					<td colspan="2">
						<input type="hidden" name="lt" value="_cC66EB1B4-A243-2542-9CBD-AA35FBA40D6F_kD74E80C7-1D9F-E08D-2A83-E60384793437" />
						<input type="hidden" name="_eventId" value="submit" />
						<input class="btn_blue" name="submit" accesskey="l" tabindex="4" type="submit" value="登录" />
						<span class="font12 color999">&nbsp;&nbsp;<a href="#">找回密码</a></span>
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
</body>
</html>

