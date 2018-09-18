<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: xuning
  Date: 2017/11/18
  Time: 15:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="zh">
<head>
    <title> 哈尔滨信息工程学院就业管理系统</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="description" content="The National University Graduate Employment Management System">
    <meta name="author" content="ncss tech">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/jym.css">
    <!--[if lt IE 9]>
    <script src="/resources/js/html5shiv.js"></script>
    <script src="/resources/js/respond.min.js"></script>
    <![endif]-->
    <link rel="stylesheet" href="/css/graduate.css">
    <link rel="stylesheet" href="/css/list.css">
    <link href="/css/fileinput.min.css" rel="stylesheet" type="text/css"  />
    <script src="/js/fileinput.min.js"></script>

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
            <li class="subactive"><a href="/student/${date}/home">主页 </a></li>
            <li><a href="/student/${date}/list">学生列表 </a></li>
            <li><a href="/teacher/statistical">就业统计 </a></li>
            <li><a href="/teacher/leader">院系负责人 </a></li>
            <li><a href="/teacher/studentpwdreset">学生密码重置 </a></li>
        </ul>
    </div>
</nav>
<div class="per" style="display: none;">
    true
</div>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <div id="updateWarn" class="alert alert-danger" role="alert" style="display: none">当前系统毕业生数为 0，请您先新增毕业生数据！</div>
            <div class="panel panel-default opt-btns-wrap">
                <div class="panel-body">
                    <div class="row toolbar">

                        <div class="col-md-2 tool-icon">
                            <a href="#" data-toggle="modal" data-target="#insert">
                                <span class="glyphicon glyphicon-upload"></span><br/>
                                上传数据
                            </a>
                        </div>
                        <div class="col-md-2 tool-icon">
                            <a href="#" data-toggle="modal" data-target="#update-jb" >
                                <span class="glyphicon glyphicon-pencil"></span><br/>
                                更新${date}届信息
                            </a>
                        </div>
                        <div class="col-md-2 tool-icon" >
                            <a href="#" id="dcsj" class=""  >
                                <input type="hidden" id="dcsj-hidden" value="${date}" />
                                <span class="glyphicon glyphicon-circle-arrow-down"></span><br/>
                                导出数据
                            </a>
                        </div>
                        <div class="col-md-2 tool-icon ">
                            <a href="#" id="mbxz-cn">
                                <input type="hidden" id="date-cn" value="${date}" />
                                <span class=" glyphicon glyphicon-download"></span><br/>
                                模板导出(中文字段)
                            </a>
                        </div>
                        <div class="col-md-2 tool-icon">
                            <a href="#" id="mbxz-en">
                                <input type="hidden" id="date-en" value="${date}" />
                                <span class=" glyphicon glyphicon-download"></span><br/>
                                模板导出(英文字段)
                            </a>
                        </div>
                        <div class="col-md-2 ">
                            <a class="disabled">
                                <input type="hidden"  value="${date}" />
                                <span class=" glyphicon glyphicon-remove"></span><br/>
                                批量删除
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading" >
                    消 息
                    <div class="dropdown pull-right">

                    </div>
                </div>
                <div class="panel-body log-list-content" id="download">

                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="footer/footer.jsp"></jsp:include>

<script src="/js/jquery-3.2.1.min.js"></script>
<script src="/js/bootstrap.min.js"></script>

<script>



    $(function () {
        var val = $("#dcsj-hidden").val();
        var i =0;
        $.post("/student/"+val+"/checkStuList",{},function (date) {
            if(date >0){
                i=1;
                $("#dcsj").removeClass("disabled")
            }else {
                $("#dcsj").addClass("disabled");
            }
        });
        $("#mbxz-cn").click(function () {
            var date = $("#date-cn").val();
            window.location.href="/zdtype/"+date+"/exportMB?languageType=CN";
        });
        $("#mbxz-en").click(function () {
            var date = $("#date-en").val();
            window.location.href="/zdtype/"+date+"/exportMB?languageType=EN";
        });
        $("#dcsj").click(function () {
            if(i == 1){
                var date = $("#dcsj-hidden").val();
                var szyx = '${teacher.department}';
                window.location.href="/student/"+date+"/partExport?szyx="+szyx;
            }
        });
    });
</script>
<script type="text/javascript" data-main="/resources/js/graduate/index" src="/js/requirejs.min.js"></script>
<script>
    $(function () {
        $('#identifier').modal(options);
    });
</script>


<!-- 模态框（Modal） -->
<div class="modal fade" id="insert" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel1">文件上传</h4>
            </div>
            <form action="/student/${date}/upload" method="post" enctype="multipart/form-data">
                <div class="modal-body">
                    <input  type="file" name="filename"  class="input-large"/>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="submit" class="btn btn-primary">提交更改</button>
                </div>
            </form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<!-- 模态框（Modal） -->
<div class="modal fade" id="update-jb" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" >更新该届已有的数据</h4>
            </div>
            <form action="/student/${date}/update_jb" method="post" enctype="multipart/form-data">
                <div class="modal-body">
                    <input  type="file" name="filename"  class="input-large"/>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="submit" class="btn btn-primary">提交更改</button>
                </div>

            </form>


        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>


</body>
</html>