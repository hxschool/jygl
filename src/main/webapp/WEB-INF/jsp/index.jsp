<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
    <title>哈尔滨信息工程学院毕业生就业管理系统</title>
</head>
<body>
<style type="text/css">
    .badge {
        background-color: #FF6666;
    }
</style>
<!-- 头部部分开始 -->
<header class="header">
    <div id="navbar-top" class="navbar jym-top">
        <div class="navbar-header">
            <a class="navbar-brand" href="/">就业管理系统</a>
        </div>
        <div class="collapse navbar-collapse">
            <ul class="nav navbar-nav nav-tabs" id="navbar-menu" role="tablist">
                <li class="active"><a href="/selectAll">毕业生</a></li>
                <li><a href="/teacher/userInfo"> 用户管理</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right user-info"
                id="navbar-top-info">
                <li class="dropdown"><a href="#" id="user"
                                        class="dropdown-toggle" data-toggle="dropdown"
                                        data-role="department">${teacher.name}[哈尔滨信息工程学院&nbsp;${teacher.department}]
                    <span class="badge badge-important" id="notification"></span><b
                            class="caret"></b>
                </a>
                    <ul class="dropdown-menu">
                        <li><a href="/message/home/main"><span
                                class="badge badge-important" id="dropdown_notifaction"></span>&nbsp;<span>消息通知
								</span></a></li>
                        <li><a href="/user"><span
                                class="glyphicon glyphicon-edit"></span> 修改个人信息</a></li>
                        <li><a
                                href="http://contact.chsi.com.cn/htgl/register/toEditRegisterInfo.action">修改学信账号信息</a></li>
                        <li><a
                                href="https://account.chsi.com.cn/account/account!editpsd"><span
                                class="glyphicon glyphicon-lock"></span> 修改密码</a></li>
                        <li><a href="/logout.html" style="color:#FF3333;"><span
                                class="glyphicon glyphicon-log-out"></span> 退出登录</a></li>
                    </ul></li>
            </ul>
        </div>
    </div>
</header>
<!-- 头部部分结束 -->

<!-- 中间上部分开始 -->
<nav class="navbar graduate-navbar" role="navigation">
    <div class="container-fluid" id="graduate-nav-wrap">
        <ul class="nav navbar navbar-left">
            <li class="dropdown"><a href="#" class="dropdown-toggle"
                                    data-toggle="dropdown" data-currentYear=""><span id="year">2018届</span><span
                    class="caret"></span></a>
                <ul id="year-list" class="dropdown-menu" role="menu"
                    style="min-width:80px">
                    <li><a href="/graduate/2018/home.html" data-year="2018">2018届</a></li>
                    <li><a href="/graduate/2017/home.html" data-year="2017">2017届</a></li>
                    <li><a href="/graduate/2016/home.html" data-year="2016">2016届</a></li>
                    <li><a href="/graduate/2015/home.html" data-year="2015">2015届</a></li>
                    <li><a href="/graduate/2014/home.html" data-year="2014">2014届</a></li>
                </ul></li>
        </ul>
        <ul class="nav navbar-nav" id="graduate-menu-nav">
            <li><a href="/graduate/2018/home.html">主页 </a></li>
            <li class="subactive"><a href="/graduate/2018/list.html">学生列表
            </a></li>
            <li><a href="/graduate/2018/employer.html">就业单位 </a></li>
            <li><a href="/graduate/2018/feedback.html">学生反馈 </a></li>
            <li><a href="/graduate/2018/statistics.html">就业统计 </a></li>
            <li><a href="/graduate/2018/pubcode.html">公共代码 </a></li>
            <li><a href="/graduate/2018/dispatch.html">派遣地址</a></li>
        </ul>
    </div>
</nav>
<!-- 中间上部分结束 -->

<!-- 中间下部分开始 -->
<div class="container-fluid">
    <div class="row" id="mainContent">
        <div class="col-md-2" id="catagory-bar">
            <div class="condition-wrap">
                <form class="form-inline" role="form">
                    <div class="form-group">
                        <label class="sr-only" for="keyword">输入关键字</label> <input
                            type="text" class="form-control" id="keyword"
                            placeholder="输入关键字" title="可以输入考生号、姓名、身份证号、学号、所在院系、所在班级、专业方向">
                    </div>
                    <button type="button" class="btn btn-info" id="search-btn">
                        <span class="glyphicon glyphicon-search"></span>
                    </button>
                </form>
            </div>
            <a href="javascript:void(0);" class="update tree-all tree-active">所有学生信息</a>
            <ul class="list-tree">
                <li data-node="软件学院" data-yxdm="11635" data-fxmc=""><span
                        class="glyphicon glyphicon-folder-close"></span> <a
                        href="javascript:void(0);">软件学院<span class="count-num"></span></a>
                    <ul class='second-tree'></ul></li>
            </ul>
        </div>
        <div class="col-md-10">
            <div style="border-bottom:solid 1px #f3f3f3;">
                <div class="dropdown">
                    <button class="btn btn-link dropdown-toggle" type="button"
                            id="ddm-dateMenu" data-toggle="dropdown" disabled="true">
                        查看：<span class="stu-flags-text">全部</span> <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu stu-flags-list" role="menu"
                        aria-labelledby="ddm-dateMenu">
                        <li role="presentation"><a role="menuitem" tabindex="-1"
                                                   href="#" data-flags="">全部</a></li>
                        <li role="presentation"><a role="menuitem" tabindex="-1"
                                                   href="#" data-flags="stu-one-week">最近一周更新</a></li>
                        <li role="presentation"><a role="menuitem" tabindex="-1"
                                                   href="#" data-flags="stu-one-month">最近一个月更新</a></li>
                        <li role="presentation"><a role="menuitem" tabindex="-1"
                                                   href="#" data-flags="stu-error">学籍核对有问题</a></li>
                    </ul>
                    <div class="pull-right" style="padding:6px;">
                        <input type="hidden" class="pre" value="true"> <a
                            href="/graduate/2018/replace.html" id="replace" class="disabled"><span
                            class="glyphicon glyphicon-transfer"></span> 批量查询替换&nbsp; </a> <a
                            href="/graduate/2018/add.html" id="import" class="disabled"><span
                            class="glyphicon glyphicon-plus"></span> 数据新增&nbsp;</a> <a
                            href="/graduate/2018/update.html" id="update" class="disabled"><span
                            class="glyphicon glyphicon-pencil"></span> 数据更新&nbsp;</a> <a
                            href="/graduate/2018/export.html" id="export"><span
                            class="glyphicon glyphicon-download"></span> 批量导出&nbsp;</a>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6" id="list-bar">
                    <ul class="" id="stuList">
                        <li data-ksh="" class="">
                            <div>
                                <h5>
                                    <span class="list-xm"> 徐宁 </span>
                                    <small>
                                        (
                                            <span class="list-xsh">12312312312312</span>
                                        )
                                        <span class="list-byqx">签就业协议形式就业</span>
                                        <span class="list-jydw" title="就业单位">黑龙江百旺金赋科技有限公司</span>

                                    </small>
                                </h5>
                                <span class="list-xb">男</span> |
                                <span class="list-mz">汉族</span> |
                                <span class="list-xl">专科生毕业</span>  | 软件学院 |
                                <span class="list-zy">网络软件开发技术</span> |
                                <span class="list-pyfs">非定向</span> |
                                <span class="list-sfslb">非师范生</span> |
                                <span class="list-knslb">非困难生</span>


                            </div>

                        </li>


                    </ul>
                    <div class="stulist-item-page clearfix"></div>
                </div>
                <div class="col-md-6">
                    <div id="list-content"></div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 中间下部分结束 -->

<script type="text/javascript" data-main="/resources/js/graduate/list"
        src="style/js/requirejs.min.js"></script>

<!-- 尾部部分开始 -->
<footer>
    <div class="footer">
        <p class="text-center">学校：哈尔滨信息工程学院</p>
        <p class="text-center">版权：黑龙江省哈尔滨信息工程学院软件学院</p>
    </div>
</footer>
<!-- 尾部部分结束 -->
<script src="/js/jquery-1.11.0.js"></script>
</body>
</html>