<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>数据统计</title>
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
	<script type="text/javascript" src="/js/jsapi.js"></script>
	<script type="text/javascript" src="/js/corechart.js"></script>		
	<script type="text/javascript" src="/js/jquery.gvChart-1.0.1.min.js"></script>
	<script type="text/javascript" src="/js/jquery.ba-resize.min.js"></script>
	<script src="/js/jquery.blockUI.min.js"></script>
	
	
	<script>
		$(function(){
			$(document).ajaxStop($.unblockUI);
			$("#btn").click(function(){
				$("#showStatis").html();
				var allCountThdq ;
				var thead_dq="<th></th>";
				var tbody_dq="";
				var allCountThhy ;
				var thead_hy="<th></th>";
				var tbody_hy="";
				var allCountThgz ;
				var thead_gz="<th></th>";
				var tbody_gz="";
				$.blockUI({
		 			message:"<h6>统计中，请稍等...</h6>",
		 			//fadeIn: 700,
		            fadeOut: 700,
		            centerY: false,
		            baseZ: 8888,
		            css: {
		                width: '350px',
		                backgroundColor: '#DCDCDC',
		                '-webkit-border-radius': '20px',
		                '-moz-border-radius': '20px',
		                color: '#000'
		            }
				});
				$.ajax({
					url:"/teacher/statisticalSzyx",
					data:{"xz":$("#xz").val(),"department":$("#szyx").val()},
					dataType:"JSON",
					type:"POST",
					success:function(result){
						// 地址统计开始
						var list_dq = result.listdq;
						var allCount_dq = result.allCountdq;
						allCountThdq = "<th>"+allCount_dq+"</th>";
						$.each(list_dq,function(index,data){
							thead_dq += "<th>"+data.name+"</th>";
							tbody_dq += "<td>"+data.count+"</td>";
						}); 
						tbody_dq =allCountThdq+tbody_dq;
						var table_dq = "<table id='myTable5'><caption>"+result.szyx+"-"+result.xzName+"-地区统计</caption>"+
						"<thead><tr>"+thead_dq+"</tr></thead>"+
						"<tbody><tr>"+tbody_dq+"</tr></tbody>"
						+"</table>"; 
						$("#showStatis5").html($("#charJS5").html()+table_dq);
						//地址统计结束
						//行业类别统计开始
						var list_hy = result.listhy;
						var allCount_hy = result.allCounthy;
						allCountThhy = "<th>"+allCount_hy+"</th>";
						$.each(list_hy,function(index,data){
							thead_hy += "<th>"+data.name+"</th>";
							tbody_hy += "<td>"+data.count+"</td>";
						}); 
						tbody_hy =allCountThdq+tbody_hy;
						var table_hy = "<table id='myTable1'><caption>"+result.szyx+"-"+result.xzName+"-单位行业统计</caption>"+
						"<thead><tr>"+thead_hy+"</tr></thead>"+
						"<tbody><tr>"+tbody_hy+"</tr></tbody>"
						+"</table>"; 
						$("#showStatis1").html($("#charJS1").html()+table_hy);
						//行业类别统计结束
						//行业类别统计开始
						var list_gz = result.listgz;
						var allCount_gz = result.allCountgz;
						allCountThgz = "<th>"+allCount_gz+"</th>";
						$.each(list_gz,function(index,data){
							thead_gz += "<th>"+data.name+"</th>";
							tbody_gz += "<td>"+data.count+"</td>";
						}); 
						tbody_gz =allCountThdq+tbody_gz;
						var table_gz = "<table id='myTable2'><caption>"+result.szyx+"-"+result.xzName+"-工作职位类别统计</caption>"+
						"<thead><tr>"+thead_gz+"</tr></thead>"+
						"<tbody><tr>"+tbody_gz+"</tr></tbody>"
						+"</table>"; 
						$("#showStatis2").html($("#charJS2").html()+table_gz);
						//行业类别统计结束
					}
				});
			});
		});
	</script>
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
            <li class="subactive"><a href="/teacher/statistical">就业统计 </a></li>
            <li><a href="/teacher/leader">院系负责人 </a></li>
            <li><a href="/teacher/reset">学生密码重置 </a></li>
        </ul>
    </div>
</nav>

<div class="container-fluid main">
    <div class="tabable tabs-left clearfix">
        <div class="tab-content" >
            <div role="tabpanel" id="userInfo">
					<div class="panel-body">
						<div class="alert">
							<h3>数据统计</h3>
						</div>
						<div class="alert">
							<table class="table">
								<colgroup>
                            			<col width="10%"></col>
                            			<col width="10%"></col>
                            			<col width="10%"></col>
                            			<col width="10%"></col>
                            			<col width="10%"></col>
                            			<col width="10%"></col>
                            			<col width="10%"></col>
                            			<col width="10%"></col>
                            			<col width="10%"></col>
                            			<col width="10%"></col>
                        			</colgroup>
                        			<tr>
									<td>条件选择</td>
									<th colspan="9"></th>
								</tr>
								<tr>
									<td></td>
									<th>统计院系</th>
									<th>
										<select class="form-control" name="szyx" id="szyx">
											<option>---请选择---</option>
											<option value="ALL">全部</option>
											<option value="RJXY">软件学院</option>
		                            			<option value="SXY">商学院</option>
		                            			<option value="DZGCXY">电子工程学院</option>
		                            			<option value="YSSJXY">艺术设计学院</option>
										</select>
									</th>
									<th >
		                    			</th>
									<th>学历：</th>
									<th>
										<select class="form-control" name="xz" id="xz">
											<option>---请选择---</option>
											<option value="0">全部</option>
											<option value="4">本科学生</option>
		                            			<option value="3">专科学生</option>
										</select>
									</th>
		                    			<th  style="height:20px;line-height:20px;">
		                    				<input type="button" id="btn" class="btn btn-info" value="统计"/>
		                    			</th>
		                    			<th colspan="3"></th>
								</tr>
								<tr>
									<td colspan="10"></td>
								</tr>
							</table>
						</div>

						<div style="width: 600px; margin: 0 auto;" id="showStatis5">
							
						</div>
						<div style="width: 600px; margin: 0 auto;" id="showStatis1">
							
						</div>
						<div style="width: 600px; margin: 0 auto;" id="showStatis2">
							
						</div>
						
						<div style="display:none;" id="charJS5">
							<script type="text/javascript">
								gvChartInit();
								$(document).ready(function(){
									$('#myTable5').gvChart({
										chartType: 'PieChart',
										gvSettings: {
											vAxis: {title: 'No of players'},
											hAxis: {title: 'Month'},
											width: 600,
											height: 350
										}
									});
								});
							</script>
						</div>
						<div style="display:none;" id="charJS1">
							<script type="text/javascript">
								gvChartInit();
								$(document).ready(function(){
										$('#myTable1').gvChart({
											chartType: 'PieChart',
											gvSettings: {
											vAxis: {title: 'No of players'},
											hAxis: {title: 'Month'},
											width: 600,
											height: 350
										}
									});
								});
							</script>
						</div>
						<div style="display:none;" id="charJS2">
							<script type="text/javascript">
								gvChartInit();
								$(document).ready(function(){
										$('#myTable2').gvChart({
											chartType: 'PieChart',
											gvSettings: {
											vAxis: {title: 'No of players'},
											hAxis: {title: 'Month'},
											width: 600,
											height: 350
										}
									});
								});
							</script>
						</div>

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