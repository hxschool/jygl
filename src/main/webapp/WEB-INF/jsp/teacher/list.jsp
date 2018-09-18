<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
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
    <script src="/js/jquery-3.2.1.min.js"></script>
    <title>哈尔滨信息工程学院毕业生就业管理系统</title>
</head>
<body>
<style type="text/css">
    .badge {
        background-color: #FF6666;
    }
    .page {
        width: 98%;
        margin: 10px auto 0;
        overflow: hidden;
        clear: both;
    }
    .pb15 {
        padding-bottom: 15px;
    }
    .page .r {
        padding: 0 6px;
    }
    .r {
        float: right;
    }



</style>
<!-- 头部部分开始 -->
<jsp:include page="top/top.jsp"></jsp:include>
<!-- 头部部分结束 -->

<!-- 中间上部分开始 -->
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
            <li ><a href="/student/${date}/home">主页 </a></li>
            <li class="subactive"><a href="/student/${date}/list">学生列表 </a></li>
            <li><a href="/teacher/statistical">就业统计 </a></li>
            <li><a href="/teacher/leader">院系负责人 </a></li>
            <li><a href="/teacher/studentpwdreset">学生密码重置 </a></li>
        </ul>
    </div>
</nav>

<!-- 中间上部分结束 -->

<script>
    $(function () {
        $("#btn").click(function () {
            //获取内容
            var date = $("#date").val();
            var url = "/student/"+date+"/list";
	    		var result = {
	    				"szyx" : $("#szyx").val(),
	    				"id": $("#keyword").val()
	    		};
            var form = $("<form method='post'  action='"+url+"'></form>");
			for(var key in result){
				var input = $("<input type='hidden'>"); 
				input.attr({"name":key});
				input.val( result[key]);
				form.append(input);
			}
			$("html").append(form); 
			form.submit();
            
            //window.location.href="/student/"+date+"/list";//?id="+id+"&szyx="+szyx;
//            $.post(",{"id":id},function () {
//
//            });
            //继续做 ，Excel 空指针没解决
        });
    });

    function query(szyx,date) {
    		var url = "/student/"+date+"/list";//?szyx="+szyx;
    		var result = {
    				"szyx" : szyx
    		};
    		var form = $("<form method='post'  action='"+url+"'></form>");
			for(var key in result){
				var input = $("<input type='hidden'>"); 
				input.attr({"name":key});
				input.val( result[key]);
				form.append(input);
			}
			$("html").append(form); 
			form.submit();
       // window.location.href="/student/"+date+"/list?szyx="+szyx;

    }
    function allstudent(date) {
        window.location.href="/student/"+date+"/list";
    }
</script>
<!-- 中间下部分开始 -->

<div id="alert" class="alert" style="display:none;"></div>
<div class="container-fluid">
    <div class="row" id="mainContent">
        <div class="col-md-2" id="catagory-bar" style="height: 650px">
            <div class="condition-wrap">
                <form class="form-inline" role="form">
                    <div class="form-group">
                        <label class="sr-only" for="keyword">输入关键字</label>
                        <input type="hidden" id="date" value="${date}" />
                        <input type="hidden" id="szyx" value="${szyx}" />
                        <input  type="text" class="form-control" id="keyword" name="id" placeholder="输入关键字" title="可以输入考生号、姓名、身份证号、学号" value="${id}"/>
                    </div>
                    <button type="button" class="btn btn-info" id="btn">go</button>
                </form>
            </div>
            <c:if test="${teacher.department == null || teacher.department == '' }">
            		<a href="javascript:void(0);" class="update tree-all tree-active" onclick="allstudent('${date}')">所有学生信息(共${requestScope.allcount}人)</a>
            		<ul class="list-tree">
                		<c:forEach items="${requestScope.count}" var="c">
                			<li ><span class="glyphicon glyphicon-folder-close"></span> <a href="javascript:void(0);" onclick="query('${c.Szyx}','${date}')">${c.Szyx}<span class="count-num">(共${c.count}人)</span></a><ul class='second-tree'></ul> </li>
                		</c:forEach>
            		</ul>
            	</c:if>
            	<c:if test="${teacher.department != null && teacher.department != '' }">
            		<a href="javascript:void(0);" class="update tree-all tree-active">所有学生信息(共${requestScope.allcount}人)</a>
            		<ul class="list-tree">
                		<c:forEach items="${requestScope.count}" var="c">
                			<c:if test="${c.Szyx == teacher.department }">
                				<li ><span class="glyphicon glyphicon-folder-close"></span> <a href="javascript:void(0);" onclick="query('${c.Szyx}','${date}')">${c.Szyx}<span class="count-num">(共${c.count}人)</span></a><ul class='second-tree'></ul> </li>
                			</c:if>
                		</c:forEach>
            		</ul>
            	</c:if>
        </div>
        <div class="col-md-10" >
            <div style="border-bottom:solid 1px #f3f3f3;" >
                <div class="dropdown" >
                    <button class="btn btn-link dropdown-toggle" type="button" id="ddm-dateMenu" data-toggle="dropdown" disabled="true">
                        查看：
                    </button>

                    <div class="pull-right" style="padding:6px;display:none;">
                        <input type="hidden" class="pre" value="true">

                    </div>
                </div>
            </div>
            <div class="row" >
                <div class="col-md-6" id="list-bar" >
                    <ul class="" id="stuList" style="height: 580px">
                        <c:forEach var="student" items="${pagination.list}">
                            <li>
                                <div>
                                    <h5>
                                        <span class="list-xm"> ${student.xm} </span>
                                        <small>
                                            (
                                            <span class="list-xsh">${student.ksh}</span>
                                            )
                                            <span class="list-byqx">${student.byqx.byqx}</span>
                                            <span class="list-jydw" title="就业单位">${student.dwmc}</span>
                                        </small>
                                    </h5>
                                        <span class="list-xb">${student.xb.xb}</span> |
                                    <span class="list-mz">${student.mz.mz}</span> |
                                    <span class="list-xl">${student.xl.xl}</span>  | ${student.szyx} |
                                    <span class="list-zy">${student.zy.zy}</span> |
                                    <span class="list-pyfs">${student.pyfs.pyfs}</span> |
                                    <span class="list-sfslb">${student.sfslb.sfslb}</span> |
                                    <span class="list-knslb">${student.knslb.knslb}</span>
                                </div>
                            </li>
                        </c:forEach>

                    </ul>
                    <div class="stulist-item-page clearfix">

                    <nav aria-label="Page navigation">
                        <ul class="pagination">
                            <li>
                                <a href="/student/${date}/list?pageNo=1&szyx=${szyx}&id=${id}" aria-label="Previous">
                                    <span aria-hidden="true">首页</span>
                                </a>
                            </li>
                            <c:if test="${pageNo>1}">
                                <li>
                                    <a href="/student/${date}/list?pageNo=${pageNo-1 }&szyx=${szyx}&id=${id}" aria-label="Previous">
                                        <span aria-hidden="true">上一页</span>
                                    </a>
                                </li>
                            </c:if>
                            <c:if test="${pageNo<=1}">
                                <li class="disabled">
                                    <a href="javascript:void(0);" aria-label="Previous">
                                        <span aria-hidden="true">上一页</span>
                                    </a>
                                </li>
                            </c:if>


                            <%--<c:forEach  begin="1" end="${pagination.totalPage}" varStatus="i">--%>
                                    <%--<li><a href="/student/${date}/list?pageNo=${i.index }&szyx=${szyx}&id=${id}">${i.index }</a></li>--%>
                                    <li class="disabled"><a href="javascript:void(0);">${pageNo }/${pagination.totalPage }</a></li>
                            <%--</c:forEach>--%>
                            <c:if test="${pageNo<pagination.totalPage}">
                                <li >
                                    <a   href="/student/${date}/list?pageNo=${pageNo+1 }&szyx=${szyx}&id=${id}" aria-label="Next">
                                        <span aria-hidden="true">下一页</span>
                                    </a>
                                </li>
                            </c:if>
                            <c:if test="${pageNo>=pagination.totalPage}">
                                <li class="disabled">
                                    <a   href="javascript:void(0);" aria-label="Next">
                                        <span aria-hidden="true">下一页</span>
                                    </a>
                                </li>
                            </c:if>
                            <li>
                                <a href="/student/${date}/list?pageNo=${pagination.totalPage }&szyx=${szyx}&id=${id}" aria-label="Next">
                                    <span aria-hidden="true">尾页</span>
                                </a>
                            </li>
                        </ul>
                    </nav>
                    </div>
                    <%--<div class="stulist-item-page clearfix">--%>
	                    <%--<span class="r inb_a page_b">--%>
                            <%--<c:forEach  begin="1" end="${(pagination.totalCount/pagination.pageSize) +1 }" varStatus="i">--%>
                               <%--${i.index }--%>
                            <%--</c:forEach>--%>
                        <%--</span>--%>
                    <%--</div>--%>


                </div>



                <div id="list-content" data-index="0" style="height: 613.333px;">
                    <%--<jsp:include page="list_right.jsp"></jsp:include>--%>
                </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 中间下部分结束 -->

<script type="text/javascript" data-main="/resources/js/graduate/list"
        src="style/js/requirejs.min.js"></script>

<!-- 尾部部分开始 -->
<jsp:include page="footer/footer.jsp"></jsp:include>
<!-- 尾部部分结束 -->

<script src="/js/bootstrap.min.js"></script>
<script>

    $(function () {
        $("ul#stuList li").mouseover(function()
        {
            $(this).css("background","skyblue");
        }).mouseout(function()
        {
            $(this).css("background","#ffffff");
        });

        $("ul#stuList ").on("click","li",function () {
            var y = $(this).children("div").children("h5");
            var name=y.children("span").text();
            var xsh = y.children("small").children("span.list-xsh").text();
            $.post("/student/selectOne",{"xm":name,"ksh":xsh},function (data) {
                $("#list-content").html(data);
            },"html");
//
//
//
//            var xb = y.parent().children("span.list-xb").text();

        });
    });


</script>
</body>
</html>