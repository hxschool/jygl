<%--
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
</head>
<body>
<header class="header">
    <div id="navbar-top" class="navbar jym-top">
        <div class="navbar-header">
            <a class="navbar-brand" href="#">就业管理系统</a>
        </div>
        <div class="collapse navbar-collapse">
            <ul class="nav navbar-nav nav-tabs" id="navbar-menu" role="tablist">
                <li class="active"><a href="/student/studentdetail">个人信息</a></li>
                <li><a href="/student/password">修改密码</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right user-info" id="navbar-top-info">
                <li class="dropdown">
                    <a href="#"  class="dropdown-toggle" data-toggle="dropdown" data-role="department">欢迎:[${student.xm}]同学<span class="badge badge-important" id="notification"></span><b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li><a href="/student/password"><span class="glyphicon glyphicon-edit"></span>　修改密码</a></li>
                        <li><a href="/slogout" style="color:#FF3333;"><span class="glyphicon glyphicon-log-out"></span>　退出登录</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</header>

<div class="container-fluid main">
    <div class="tabable tabs-left clearfix">
        <table class="table">
            <tr>
                <td >
                    <span style="color: red;">如有错误点击重新添加/联系老师进行修改(信息将上传至学信网，请认真核对)</span>
                    <input type="button" class="btn btn-success" id="btn" value="重新填写" />
                </td>
            </tr>


        </table>

        <table class="table table-bordered" style="margin-top: 50px" >
            <tr>
                <td align="center">姓名</td>
                <td>
                    <input type="text"  class="form-control" value="${student.xm}" disabled/>
                </td>
                <td ></td>
                <td align="center">身份证</td>
                <td>
                    <input type="text"  class="form-control" value="${student.sfzh}" disabled/>
                </td>
                <td ></td>
                <td align="center">考生号</td>
                <td>
                    <input type="text"  class="form-control" value="${student.ksh}" disabled/>
                </td>
                <td ></td>
                <td align="center">学号</td>
                <td>
                    <input type="text"  class="form-control" value="${student.xh}" disabled/>
                </td>
            </tr>
            <tr >
                <td colspan="11"></td>
            </tr>
            <tr>
                <td align="center">性别</td>
                <td>
                    <input type="text"  class="form-control" value="${student.xb.xb}" disabled/>
                </td>
                <td ></td>
                <td align="center">民族</td>
                <td>
                    <input type="text"  class="form-control" value="${student.mz.mz}" disabled/>
                </td>
                <td ></td>
                <td align="center">政治代码</td>
                <td>
                    <input type="text"  class="form-control" value="${student.zzmm.zzmm}" disabled/>
                </td>
                <td ></td>
                <td align="center">出生日期</td>
                <td>
                    <input type="text"  class="form-control" value="${student.csrq}" disabled/>
                </td>
            </tr>
            <tr >
                <td colspan="11"></td>
            </tr>
            <tr>
                <td align="center">学校</td>
                <td>
                    <input type="text"  class="form-control" value="${student.yx.yxmc}" disabled/>
                </td>
                <td ></td>
                <td align="center">所在院系</td>
                <td>
                    <input type="text"  class="form-control" value="${student.szyx}" disabled/>
                </td>
                <td ></td>
                <td align="center">所在专业</td>
                <td>
                    <input type="text"  class="form-control" value="${student.zy.zy}" disabled/>
                </td>
                <td ></td>
                <td align="center">所在班级</td>
                <td>
                    <input type="text"  class="form-control" value="${student.szbj}" disabled/>
                </td>
            </tr>
            <tr >
                <td colspan="11"></td>
            </tr>
            <tr>
                <td align="center">学历</td>
                <td>
                    <input type="text"  class="form-control" value="${student.xl.xl}" disabled/>
                </td>
                <td ></td>
                <td align="center">学制</td>
                <td>
                    <input type="text"  class="form-control" value="${student.xz}年" disabled/>
                </td>
                <td ></td>
                <td align="center">就读时间</td>
                <td>
                    <input type="text"  class="form-control" value="${student.rxsj}-${student.bysj}" disabled/>
                </td>
                <td colspan="3"></td>
            </tr>
            <tr >
                <td colspan="11"></td>
            </tr>
            <tr>
                <td align="center">困难生类别</td>
                <td>
                    <input type="text"  class="form-control" value="${student.knslb.knslb}" disabled/>
                </td>
                <td ></td>
                <td align="center">师范生类别</td>
                <td>
                    <input type="text"  class="form-control" value="${student.sfslb.sfslb}" disabled/>
                </td>
                <td ></td>
                <td align="center">培养方式</td>
                <td>
                    <input type="text"  class="form-control" value="${student.pyfs.pyfs}" disabled/>
                </td>
                <td ></td>
                <td align="center">定向/委培单位</td>
                <td>
                    <input type="text"  class="form-control" value="${student.dxhwpdw}" disabled/>
                </td>
            </tr>
            <tr >
                <td colspan="11"></td>
            </tr>
            <tr>
                <td align="center">毕业去向</td>
                <td>
                    <input type="text"  class="form-control" value="${student.byqx.byqx}" disabled/>
                </td>
                <td ></td>
                <td align="center">单位名称</td>
                <td>
                    <input type="text"  class="form-control" value="${student.dwmc}" disabled/>
                </td>
                <td ></td>
                <td align="center">组织机构</td>
                <td>
                    <input type="text"  class="form-control" value="${student.dwzzjgdm}" disabled/>
                </td>
                <td ></td>
                <td align="center">单位性质</td>
                <td>
                    <input type="text"  class="form-control" value="${student.dwxz.dwxz}" disabled/>
                </td>
            </tr>
            <tr >
                <td colspan="11"></td>
            </tr>
            <tr>
                <td align="center">单位行业</td>
                <td>
                    <input type="text"  class="form-control" value="${student.dwhy.dwhy}" disabled/>
                </td>
                <td ></td>
                <td align="center">工作职位</td>
                <td>
                    <input type="text"  class="form-control" value="${student.gzzwlb.gzzwlb}" disabled/>
                </td>
                <td ></td>
                <td align="center">单位所在地</td>
                <td>
                    <input type="text"  class="form-control" value="${student.dwszd.dwszd}" disabled/>
                </td>
                <td ></td>
                <td align="center">单位地址</td>
                <td>
                    <input type="text"  class="form-control" value="${student.dwdz}" disabled/>
                </td>
            </tr>
            <tr >
                <td colspan="11"></td>
            </tr>
            <tr>
                <td align="center">单位联系人</td>
                <td>
                    <input type="text"  class="form-control" value="${student.dwlxr}" disabled/>
                </td>
                <td ></td>
                <td align="center">联系人电话</td>
                <td>
                    <input type="text"  class="form-control" value="${student.lxrdh}" disabled/>
                </td>
                <td ></td>
                <td align="center">联系人手机</td>
                <td>
                    <input type="text"  class="form-control" value="${student.lxrsj}" disabled/>
                </td>
                <td ></td>
                <td align="center">联系人email</td>
                <td>
                    <input type="text"  class="form-control" value="${student.lxrdzyx}" disabled/>
                </td>
            </tr>
            <tr >
                <td colspan="11"></td>
            </tr>
            <tr>
                <td align="center">联系人传真</td>
                <td>
                    <input type="text"  class="form-control" value="${student.lxrcz}" disabled/>
                </td>
                <td ></td>
                <td align="center">单位邮编</td>
                <td>
                    <input type="text"  class="form-control" value="${student.dwyb}" disabled/>
                </td>
                <td ></td>
                <td align="center">入学前户口所在地派出所</td>
                <td>
                    <input type="text"  class="form-control" value="${student.rxqhkszdpcs}" disabled/>
                </td>
                <td ></td>
                <td align="center">入学前档案所在单位</td>
                <td>
                    <input type="text"  class="form-control" value="${student.rxqdaszdw}" disabled/>
                </td>
            </tr>
            <tr >
                <td colspan="11"></td>
            </tr>
            <tr>
                <td align="center">档案是否转入学校</td>
                <td>
                    <input type="text"  class="form-control" value="${student.dasfzrxx}" disabled/>
                </td>
                <td ></td>
                <td align="center">户口是否转入学校</td>
                <td>
                    <input type="text"  class="form-control" value="${student.hksfzrxx}" disabled/>
                </td>
                <td colspan="6"></td>
            </tr>
            <tr >
                <td colspan="11"></td>
            </tr>
            <tr>
                <td align="center">报到证签发类别</td>
                <td>
                    <input type="text"  class="form-control" value="${student.bdzqflb.bdzqflb}" disabled/>
                </td>
                <td ></td>
                <td align="center">报到证签往单位名称</td>
                <td>
                    <input type="text"  class="form-control" value="${student.bdzqwdwmc}" disabled/>
                </td>
                <td ></td>
                <td align="center">签往单位所在地</td>
                <td>
                    <input type="text"  class="form-control" value="${student.qwdwszd.qwdwszd}" disabled/>
                </td>
                <td ></td>
                <td align="center">户口迁转地址</td>
                <td>
                    <input type="text"  class="form-control" value="${student.hkqzdz}" disabled/>
                </td>
            </tr>
            <tr >
                <td colspan="11"></td>
            </tr>
            <tr>
                <td align="center">档案转寄单位名称</td>
                <td>
                    <input type="text"  class="form-control" value="${student.dazjdwmc}" disabled/>
                </td>
                <td ></td>
                <td align="center">档案转寄单位邮编</td>
                <td>
                    <input type="text"  class="form-control" value="${student.dazjdwyb}" disabled/>
                </td>
                <td ></td>
                <td align="center">档案转寄单位地址</td>
                <td>
                    <input type="text"  class="form-control" value="${student.dazjdwdz}" disabled/>
                </td>
                <td ></td>
                <td align="center">报到证编号(时间)</td>
                <td>
                    <input type="text"  class="form-control" value="${student.bdzbh}${student.bdqssj}" disabled/>
                </td>
            </tr>
            <tr >
                <td colspan="11"></td>
            </tr>
            <tr>
                <td align="center">手机号码</td>
                <td>
                    <input type="text"  class="form-control" value="${student.mobilephone}" disabled/>
                </td>
                <td ></td>
                <td align="center">电子邮箱</td>
                <td>
                    <input type="text"  class="form-control" value="${student.email}" disabled/>
                </td>
                <td ></td>
                <td align="center">Q Q号码</td>
                <td>
                    <input type="text"  class="form-control" value="${student.qq}" disabled/>
                </td>
                <td ></td>
                <td align="center">家庭地址</td>
                <td>
                    <input type="text"  class="form-control " value="${student.jtdz}" disabled/>
                </td>
            </tr>
            <tr >
                <td colspan="11"></td>
            </tr>
            <tr>
                <td align="center">家庭电话</td>
                <td>
                    <input type="text"  class="form-control" value="${student.jtdh}" disabled />
                </td>
                <td ></td>
                <td align="center">家庭邮编</td>
                <td>
                    <input type="text"  class="form-control " value="${student.jtyb}" disabled />
                </td>
                <td colspan="6"></td>
            </tr>
        </table>
    </div>
</div>

<jsp:include page="../teacher/footer/footer.jsp"></jsp:include>

</body>
</html>
