<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>学生密码重置</title>
<meta charset="utf-8">
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
    <script src="/js/jquery.blockUI.min.js"></script>
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
            <li><a href="/teacher/leader">院系负责人 </a></li>
            <li class="subactive"><a href="/teacher/studentpwdreset">学生密码重置 </a></li>
        </ul>
    </div>
</nav>

<div class="container-fluid main">
    <div class="tabable tabs-left clearfix">
        <div class="tab-content" >
            <div role="tabpanel" id="userInfo">
                <div class="panel-body">
                    <div class="alert"><h5>学生密码重置</h5></div>
                    <table class="table">
                    		<colgroup>
                            <col width="30%"></col><col width="10%"></col>
                            <col width="15%"></col><col width="5%"></col>
                            <col width="40%"></col>
                        </colgroup>
                    		<tr>
                    			<td></td>
                    			<th style="height:20px;line-height:20px;">学号：
                    			</th>
                    			<th  style="height:20px;line-height:20px;">
                    				<input type="text" id="xh" name="xh" class="form-control" value=""/>
                    			</th>
                    			<th  style="height:20px;line-height:20px;">
                    				<input type="button" id="btn" class="btn btn-info" value="搜索"/>
                    			</th>
                    			<th>
                    			</th>
                    		</tr>
                    </table>
                    
                    <br/><br/>
                    <div style="display:none" id="btnreset">
                    		<input type='button' value='重置密码' class='btn btn-info' id='resetPwd' />
                    </div>
                    <div style="display:none" id="queryDate">
                    		
                    </div>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
	$(function(){
		$("#resetPwd").click(function(){
			var xh = $("#xhvalue").val();
			if(!(xh == null || xh =='')){
				$.ajax({
					url:"/teacher/resetStudentPwd",
					type:"POST",
					data:{"xh":xh},
					dataType:"json",
					success:function(result){
						if(result>0){
							alert("重置成功");
						}else{
							alert("重置失败");
						}
					}
				});
			}
		});
		$(document).ajaxStop($.unblockUI);
		$("#btn").click(function(){
			var xh = $("#xh").val();
			if(xh == "" || xh == null){
				alert("请输入学号进行搜索");
			}else{
				/* $.blockUI({
		 			message:"<h6>查询中，请稍等...</h6>",
		 			//fadeIn: 700,
		            fadeOut: 700,
		            centerY: false,
		            baseZ: 8888,
		            css: {
		                width: '350px',
		                backgroundColor: '#DCDCDC',
		                '-webkit-border-radius': '20px',
		                '-moz-border-radius': '20px',
		                //opacity: .10,
		                color: '#000'
		            }
				}); */
				$.ajax({
					url:"/teacher/showStudentById",
					data:{'xh':xh},
					dataType:"JSON",
					type:"POST",
					success:function(result){
						var table = "<input type='hidden' value='"+result.xh+"' id='xhvalue'/><table class='table table-bordered  text-center'><thead>"+
						"<tr><td>姓名</td><td>性别</td><td>学号</td><td>院系</td><td>专业</td></tr></thead>"+
						"<tr><td style='text-align: center;'>"+result.xm+"</td><td style='text-align: center;'>"+result.xb
						+"</td><td style='text-align: center;'>"+result.xh+"</td style='text-align: center;'><td style='text-align: center;'>"+result.szyx+"</td><td style='text-align: center;'>"+result.zyfx+"</td>"+
						"</tr>"+
						+"</table>"; 
						$("#queryDate").html(table).show();
						$("#btnreset").show();
					}
				});
			}
			
		});
	});
</script>
<script type="text/javascript" data-main="/resources/js/user/home" src="/js/requirejs.min.js"></script>
<!-- 尾部部分开始 -->
<jsp:include page="footer/footer.jsp"></jsp:include>
<!-- 尾部部分结束 -->
</body>
</html>