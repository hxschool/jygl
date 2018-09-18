<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            /*font-size: 12px;*/
        }
        html, body {
            height: 100%;
            width: 100%;
        }
        #alert {
            z-index: 2;
            border: 1px solid rgba(0,0,0,.2);
            width: 800px;
            height: 500px;
            border-radius: 6px;
            box-shadow: 0 5px 15px rgba(0,0,0,.5);
            background: #fff;
            z-index: 1000;
            position: absolute;
            left: 50%;
            top: 8%;
            margin-left: -299px;
            display: none;
        }
        .model-head {
            padding: 15px;
            color: #73879C;
            border-bottom: 1px solid #e5e5e5;
        }
        .close {
            padding: 0;
            cursor: pointer;
            background: 0 0;
            border: 0;
            float: right;
            font-size: 14px !important;
            font-weight: 700;
            text-shadow: 0 1px 0 #fff;
            opacity: 0.4;
            margin-top: 5px;
        }
        #close:hover {
            cursor: pointer;
            color: #000;
        }
        #mask {
            position: absolute;
            top: 0;
            left: 0;
            height: 100%;
            width: 100%;
            background: #000;
            opacity: 0.3;
            display: none;
            z-index: 1;
        }
        .model-content {
            position: relative;
            padding: 15px;
        }
        .model-foot {
            padding: 15px;
            text-align: right;
        }
    </style>
    <%--<link href="/css/flow.css" rel="stylesheet" type="text/css"  />--%>
    <%--<link rel="stylesheet" href="/css/bootstrap.min.css">--%>
</head>
<body>

<!--content-->
<div align="center" id="alert" class="">
    <div class="model-head">
        <span class="close">&times;</span>
        <h4 class="modal-title">学生上传表字段模板</h4>
    </div>
    <div class="model-content">
        <div class="main">
            <div class="row">
                <div class="col-md-12">
                    <div class="flow">
                        <div class="flowListBox"> </div>
                    </div>
                </div>
                <div class="col-md-12" id="flowDiv">
                    <ol id="iList">
                        <div id="contA">
                            <ul style="float: left;padding-left: 50px;list-style-type:none; ">
                                <li><input type="radio" checked name="dczd" value="dczd" id="dczd" />导出学生表信息字段</li>
                            </ul>
                            <%--<span style="position: fixed">--%>
                                <%--<input type="radio" checked  style="float: left;" /><h4 class="modal-title" style="float: left;">导出学生表信息字段</h4>--%>
                            <%--</span>--%>
                        </div>
                        <div class="contentList" id="contB">
                            <table>
                                <tr>
                                    <c:forEach items="${requestScope.zdtypes}" var="zdtype" varStatus="i">

                                            <td>
                                                <input type="checkbox" value="${zdtype.zddm}"> ${zdtype.zdmc}(${zdtype.zddm})
                                            </td>

                                        <c:if test="${(i.index+1) % 4==0 }">
                                </tr>
                                <tr>
                                        </c:if>
                                    </c:forEach>
                                </tr>
                            </table>

                        </div>
                        <div class="contentList" id="contC">cc</div>
                        <div class="contentList" id="contD">dd</div>
                    </ol>
                </div>
            </div>
        </div>
    </div>

    <div class="foot-btn">
        <button type="button" class="btn btn-primary" id="btnBack">上一步</button>
        <button type="button" class="btn btn-default"  style="float:right; display:none" id="btnok">完成</button>
        <button type="button" class="btn btn-success"  style="float:right; margin-right:10px;" id="btnNext">下一步</button>
    </div>
</div>

<div id="mask" ></div>

<!--content/-->
<script type="text/javascript" src="/js/flow.js"></script>
<script type="text/javascript">
    var myAlert = document.getElementById("alert");
    var myMask=document.getElementById('mask');

//    $("#content a").click(function(){
////        myMask.style.display="block";
//        myAlert.style.display = "block";
//        document.body.style.overflow = "hidden";
////        alert($(window).width());
//    })
//    $(".close").click(function(){
//        myAlert.style.display = "none";
////        myMask.style.display = "none";
//    })
</script>
</body>
</html>