<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加院系负责人</title>
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
<jsp:include page="top/top.jsp"></jsp:include>
<nav class="navbar graduate-navbar" role="navigation">
    <div class="container-fluid" id="graduate-nav-wrap">
        <ul class="nav navbar navbar-left">
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-currentYear=""><span id="year">${date}届</span><span class="caret"></span></a>
                <ul id="year-list" class="dropdown-menu" role="menu" style="min-width:80px">
                    <c:forEach items="${requestScope.years}" var="year">
                        <li><a href="/student/${year.timeno}/home" data-year="2018">${year.timename}</a></li>
                    </c:forEach>
                </ul>
            </li>
        </ul>
        <ul class="nav navbar-nav" id="graduate-menu-nav">
            <li><a href="/student/${date}/home">主页 </a></li>
            <li><a href="/student/${date}/list">学生列表 </a></li>
            <li><a href="/teacher/statistical">就业统计 </a></li>
            <li  class="subactive"><a href="/teacher/leader">院系负责人 </a></li>
            <li><a href="/teacher/studentpwdreset">学生密码重置 </a></li>
        </ul>
    </div>
</nav>

<div class="container-fluid main">
    <div class="tabable tabs-left clearfix">
        <div class="tab-content" >
            <div role="tabpanel" id="userInfo">
                <div class="panel-body">
                <c:if test="${teacher.department == '' || teacher.department == null }">
                    <div class="alert"><h5>院系负责人添加</h5></div>
                    <form action="/teacher/leaderadd" method="post">
                    <table class="table "  >
                    		<colgroup>
                            <col width="30%"></col><col width="30%"></col><col width="40%"></col>
                        </colgroup>
                        <tr>
                            <th >用户名：</th>
                            <th >
                               	<input class="form-control" type="text" id="" name="username" />
                            </th>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <th >姓名：</th>
                            <th >
                               	<input class="form-control" type="text" id=""  name="name" />
                            </th>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <th >负责人权限域：</th>
                            <th >
                            		<select class="form-control" name="department">
                            			<option value="ADMIN">管理员</option>
                            			<option value="RJXY">软件学院</option>
                            			<option value="SXY">商学院</option>
                            			<option value="DZGCXY">电子工程学院</option>
                            			<option value="YSSJXY">艺术设计学院</option>
                            		</select>
                            </th>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <th >手机：</th>
                            <th >
                               	<input class="form-control" type="text" id="" name="mobile" />
                            </th>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <th >电子邮箱：</th>
                            <th >
                               	<input class="form-control" type="text" id="" name="email"  />
                            </th>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <th >QQ：</th>
                            <th >
                               	<input class="form-control" type="text" id="" name="qq"  />
                            </th>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <th ></th>
                            <th style="text-align: center;">
                               	<input type="submit" class="btn btn-info" value="确定"/>
                                 <button class="btn btn-link" >取消</button>
                            </th>
                            <td>
                            </td>
                        </tr>
                    </table>
                    </form>
                    <br><br><br><br>
                   </c:if>
                    
                    
                     <div class="alert"><h5>院系负责人查看</h5></div>
                    <table class="table table-bordered table-hover text-center" >
                    	<thead>
                    		<tr >
                    			<td>序号</td>
                    			<td>用户名</td>
                    			<td>姓名</td>
                    			<td>负责专业</td>
                    			<td>电话</td>
                    			<td>电子邮箱</td>
                    			<td>QQ</td>
                    			<c:if test="${teacher.department == '' || teacher.department == null }">
                    				<td>操作</td>
                    			</c:if>
                    		</tr>
                    	</thead>
                    	<c:forEach var="tea" items="${teachers }" varStatus="i" >
                    		<tr>
                    			<td style="text-align: center;">${i.index+1 }</td>
                    			<td style="text-align: center;">${tea.username }</td>
                    			<td style="text-align: center;">${tea.name }</td>
                    			<td style="text-align: center;">${tea.department == '' || tea.department == null ? '全部负责' : tea.department }</td>
                    			<td style="text-align: center;">${tea.mobile }</td>
                    			<td style="text-align: center;">${tea.email }</td>
                    			<td style="text-align: center;">${tea.qq }</td>
                    			<c:if test="${teacher.department == '' || teacher.department == null }">
                    				<th style="text-align: center;" > 
                    					<input type="button" value="重置密码" onclick="window.location.href='/teacher/reset?id=${tea.id}'" />
                    					<input type="button" value="删除" onclick="window.location.href='/teacher/delete?id=${tea.id}'"/>
                    				</th>
                    			</c:if>
                    		</tr>
                    	</c:forEach>
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