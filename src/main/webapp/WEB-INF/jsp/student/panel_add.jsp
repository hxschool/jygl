<%--
  Created by IntelliJ IDEA.
  User: xuning
  Date: 2017/12/15
  Time: 17:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html class="panel-fit"><head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- 避免IE使用兼容模式 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
    <meta name="renderer" content="webkit">
        <meta name="viewport" content="width=device-width,height=device-height, user-scalable=no,initial-scale=1, minimum-scale=1, maximum-scale=1,target-densitydpi=device-dpi ">  
    <!-- 样式 -->
    <link type="text/css" href="/css/topjui.css" rel="stylesheet">
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/jym.css">
    <link rel="stylesheet" href="/css/bootstrap-select.min.css">
 
    <script src="/js/jquery-3.2.1.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <script src="/js/bootstrap-select.min.js"></script>
    <script src="/js/jquery.blockUI.min.js"></script>
    <script src="https://cdn.bootcss.com/jquery-validate/1.17.0/jquery.validate.js"></script>
    <script>
    			$(function(){
    					
    					$.ajax({
    								url:"http://api-hxci.xuning2911.top:7900/zhcp/api/get/province/all",
    								type:"GET",
    								dataType:"JSON",
    								data:{},
    								success:function(result){
    										if(result.code == 1){
    												$.each(result.data , function(index,obj){
    														$("#province").append("<option value='"+ obj.code +"'>"+obj.name+"</option>");
    														$("#province").selectpicker('refresh');
    												});
    										}else{
    											alert(result.msg);
    										}
    								},
    								error:function(e){
    											alert("请求失败");
    									}
    						
    				});
    				
    				$("#province").change(function(){
    							var te = $(this).find("option:selected").text();
    							$("#showtext").val("");
    							$("#showtext").val(te);
    							$("#dwszdSelectId").val('');
    							$("#city option").remove();
									$("#city").selectpicker('refresh');
									$("#area option").remove();
									$("#area").selectpicker('refresh');
    							$.ajax({
    								url:"http://api-hxci.xuning2911.top:7900/zhcp/api/get/city/"+this.value,
    								data:{"type":"provincecode"},
    								type:"GET",
    								dataType:"JSON",
    								success:function(result){

    										if(result.code == 1){
    												$.each(result.data , function(index,obj){
    														$("#city").append("<option value='"+ obj.code +"'>"+obj.name+"</option>");
    														$("#city").selectpicker('refresh');
    												});
    										}else{
    											alert(result.msg);
    										}
    								},
    								error:function(e){
    										alert("请求失败");
    								}
    							});
    							
    				});
    				
    				$("#city").change(function(){
    							$("#showtext").val($("#province").find("option:selected").text()+$(this).find("option:selected").text());
    							$("#city").selectpicker('refresh');
    							$("#area option").remove();
								$("#area").selectpicker('refresh');
								$("#dwszdSelectId").val('');
    							$.ajax({
    								url:"http://api-hxci.xuning2911.top:7900/zhcp/api/get/area/"+this.value,
    								data:{"type":"citycode"},
    								type:"GET",
    								dataType:"JSON",
    								success:function(result){
    										if(result.code == 1){
    												$.each(result.data , function(index,obj){
    														$("#area").append("<option value='"+ obj.code +"'>"+obj.name+"</option>");
    														$("#area").selectpicker('refresh');
    												});
    										}else{
    											alert(result.msg);
    										}
    								},
    								error:function(e){
    										alert("请求失败");
    								}
    							});
    							
    				});
    				
    			$("#area").change(function(){
    					$("#showtext").val($("#province").find("option:selected").text()+$("#city").find("option:selected").text()+$(this).find("option:selected").text());
    					$("#dwszdSelectId").val(this.value);
    			});
    				
    				
    			});
    		</script>
    <style>
        .main{margin-top:30px;}
        .tabable{padding:15px;}
        .tabs-left{background-color:#FFF;}
        .footer{background-color:#FFF;}
        .hx{
		    margin-left: 2%;
		}
    </style>
     <script type="text/javascript" src="/js/studentDetail.js"></script>
    </head>
<body class="panel-noscroll" style="">
<header class="header">
    <div id="navbar-top" class=" jym-top" style="height:40px">
        <div class="navbar-header">
            <a class="navbar-brand" href="#">就业管理系统</a>
        </div>
        <div class="collapse navbar-collapse">
            <ul class="nav navbar-nav nav-tabs" id="navbar-menu" role="tablist" style="height:41px">
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
<form class="" method="post" id="formUpdate" style="" action="/student/studentForUpdate">
<div class="container-fluid main panel panel-htop easyui-fluid">
    <div class="tabable tabs-left clearfix">
    		<div class="topjui-row">
            <div class="topjui-col-sm6">
               <div class="topjui-input-block">
                    <span style="color: red;">如有错误点击重新添加/联系老师进行修改(信息将上传至学信网，请认真核对)</span>
                    <input type="button" class="btn btn-success" id="btn" value="重新填写" />
               </div>
             </div>
             <div class="topjui-col-sm6">
               <div class="topjui-input-block">
                   <input type="button" class="btn btn-success" id="btnJYXX" value="修改就业信息" />
                   <input type="submit" class="btn btn-success" id="btnSubmit" value="提交信息(请慎重操作)" style="display:none;"/>
                   <input type="button" class="btn btn-info" id="btnRes" value="返回" style="display:none;" />
               </div>
            </div>
         </div>
     </div>
</div>

<div  style="width: 100%; height: 1218px;" class="hx">
    <div style="display: block; width:100%;">
    <div data-toggle="topjui-panel" title=""   class="panel-body " style="width: 96%; height: 500px;">
            <div class="" style="">
                <!-- 基本信息开始 -->
                <div class="topjui-row">
                    <div class="topjui-col-sm12">
                        <fieldset>
                            <legend>基本信息</legend>
                        </fieldset>
                    </div>
                </div>
                <div class="topjui-row">
                    <div class="topjui-col-sm6">
                        <label class="topjui-form-label">考生号</label>
                        <div class="topjui-input-block">
                            <span class="textbox easyui-fluid" style="width: 438px; height: 28px;">
                            		<input value="${studentDetail.ksh}" readonly="readonly"  class="textbox-text validatebox-text" autocomplete="off" tabindex=""  style="margin: 0px; padding-top: 0px; padding-bottom: 0px; height: 28px; line-height: 28px; width: 430px;" type="text">
                          	</span>
                        </div>
                    </div>
                    <div class="topjui-col-sm6">
                        <label class="topjui-form-label">身份证号</label>
                        <div class="topjui-input-block">
                            <span class="textbox easyui-fluid" style="width: 438px; height: 28px;">
                            		<input value="${studentDetail.sfzh}" readonly="readonly"  class="textbox-text validatebox-text" autocomplete="off" tabindex="" style="margin: 0px; padding-top: 0px; padding-bottom: 0px; height: 28px; line-height: 28px; width: 430px;" type="text">
                          	</span>
                       </div>
                    </div>
                </div>
                
                 <div class="topjui-row">
                    <div class="topjui-col-sm6">
                        <label class="topjui-form-label">姓名</label>
                        <div class="topjui-input-block">
                            <span class="textbox easyui-fluid" style="width: 438px; height: 28px;">
                            		<input value="${studentDetail.xm}"  readonly="readonly"  class="textbox-text validatebox-text" autocomplete="off" tabindex="" style="margin: 0px; padding-top: 0px; padding-bottom: 0px; height: 28px; line-height: 28px; width: 430px;"  type="text">
                          	</span>
                        </div>
                    </div>
                    <div class="topjui-col-sm6">
                        <label class="topjui-form-label">学号</label>
                        <div class="topjui-input-block">
                            <span class="textbox easyui-fluid" style="width: 438px; height: 28px;">
                            		<input value="${studentDetail.xh}"  readonly="readonly"  class="textbox-text validatebox-text" autocomplete="off" tabindex=""  style="margin: 0px; padding-top: 0px; padding-bottom: 0px; height: 28px; line-height: 28px; width: 430px;" type="text">
                          	</span>
                       </div>
                    </div>
                </div>
                
                 <div class="topjui-row">
                    <div class="topjui-col-sm6">
                        <label class="topjui-form-label">性别</label>
                        <div class="topjui-input-block">
                            <span class="textbox easyui-fluid" style="width: 438px; height: 28px;">
                            		<input value="${studentDetail.xb.xb}"  readonly="readonly"  class="textbox-text validatebox-text" autocomplete="off" tabindex=""  style="margin: 0px; padding-top: 0px; padding-bottom: 0px; height: 28px; line-height: 28px; width: 430px;"  type="text">
                          	</span>
                        </div>
                    </div>
                    <div class="topjui-col-sm6">
                        <label class="topjui-form-label">民族</label>
                        <div class="topjui-input-block">
                            <span class="textbox easyui-fluid" style="width: 438px; height: 28px;">
                            		<input value="${studentDetail.mz.mz}" readonly="readonly"  class="textbox-text validatebox-text" autocomplete="off" tabindex=""  style="margin: 0px; padding-top: 0px; padding-bottom: 0px; height: 28px; line-height: 28px; width: 430px;" type="text">
                          	</span>
                       </div>
                    </div>
                </div>
                
                <div class="topjui-row">
                    <div class="topjui-col-sm6">
                        <label class="topjui-form-label">政治面貌</label>
                        <div class="topjui-input-block">
                            <span class="textbox easyui-fluid" style="width: 438px; height: 28px;">
                            		<input value="${studentDetail.zzmm.zzmm}" readonly="readonly"  class="textbox-text validatebox-text" autocomplete="off" tabindex="" style="margin: 0px; padding-top: 0px; padding-bottom: 0px; height: 28px; line-height: 28px; width: 430px;"  type="text">
                          	</span>
                        </div>
                    </div>
                    <div class="topjui-col-sm6">
                        <label class="topjui-form-label">出生日期</label>
                        <div class="topjui-input-block">
                            <span class="textbox easyui-fluid" style="width: 438px; height: 28px;">
                            		<input value="${studentDetail.csrq}" readonly="readonly"  class="textbox-text validatebox-text" autocomplete="off" tabindex="" style="margin: 0px; padding-top: 0px; padding-bottom: 0px; height: 28px; line-height: 28px; width: 430px;" type="text">
                          	</span>
                       </div>
                    </div>
                </div>
                
                <div class="topjui-row">
                    <div class="topjui-col-sm6">
                        <label class="topjui-form-label">学校</label>
                        <div class="topjui-input-block">
                            <span class="textbox easyui-fluid" style="width: 438px; height: 28px;">
                            		<input value="${studentDetail.yx.yxmc}" readonly="readonly" class="textbox-text validatebox-text" autocomplete="off" tabindex="" style="margin: 0px; padding-top: 0px; padding-bottom: 0px; height: 28px; line-height: 28px; width: 430px;"  type="text">
                          	</span>
                        </div>
                    </div>
                    <div class="topjui-col-sm6">
                        <label class="topjui-form-label">所在院系</label>
                        <div class="topjui-input-block">
                            <span class="textbox easyui-fluid" style="width: 438px; height: 28px;">
                            		<input value="${studentDetail.szyx}" readonly="readonly" class="textbox-text validatebox-text" autocomplete="off" tabindex=""  style="margin: 0px; padding-top: 0px; padding-bottom: 0px; height: 28px; line-height: 28px; width: 430px;" type="text">
                          	</span>
                       </div>
                    </div>
                </div>
                
                <div class="topjui-row">
                    <div class="topjui-col-sm6">
                        <label class="topjui-form-label">所在专业</label>
                        <div class="topjui-input-block">
                            <span class="textbox easyui-fluid" style="width: 438px; height: 28px;">
                            		<input value="${studentDetail.zy.zy}" readonly="readonly" class="textbox-text validatebox-text" autocomplete="off" tabindex="" style="margin: 0px; padding-top: 0px; padding-bottom: 0px; height: 28px; line-height: 28px; width: 430px;" type="text">
                          	</span>
                        </div>
                    </div>
                    <div class="topjui-col-sm6">
                        <label class="topjui-form-label">所在班级</label>
                        <div class="topjui-input-block">
                            <span class="textbox easyui-fluid" style="width: 438px; height: 28px;">
                            		<input value="${studentDetail.szbj}" readonly="readonly" class="textbox-text validatebox-text" autocomplete="off" tabindex=""  style="margin: 0px; padding-top: 0px; padding-bottom: 0px; height: 28px; line-height: 28px; width: 430px;" type="text">
                          	</span>
                       </div>
                    </div>
                </div>
                
                <div class="topjui-row">
                    <div class="topjui-col-sm6">
                        <label class="topjui-form-label">专业方向</label>
                        <div class="topjui-input-block">
                            <span class="textbox easyui-fluid" style="width: 438px; height: 28px;">
                            		<input value="${studentDetail.zyfx}" readonly="readonly" class="textbox-text validatebox-text" autocomplete="off" tabindex="" style="margin: 0px; padding-top: 0px; padding-bottom: 0px; height: 28px; line-height: 28px; width: 430px;" type="text">
                          	</span>
                        </div>
                    </div>
                    <div class="topjui-col-sm6">
                        <label class="topjui-form-label">就读时间</label>
                        <div class="topjui-input-block">
                            <span class="textbox easyui-fluid" style="width: 438px; height: 28px;">
                            		<input value="${studentDetail.rxsj}-${studentDetail.bysj}" readonly="readonly" class="textbox-text validatebox-text" autocomplete="off" tabindex="" style="margin: 0px; padding-top: 0px; padding-bottom: 0px; height: 28px; line-height: 28px; width: 430px;" type="text">
                          	</span>
                       </div>
                    </div>
                </div>
                
                <div class="topjui-row">
                    <div class="topjui-col-sm6">
                        <label class="topjui-form-label">学历</label>
                        <div class="topjui-input-block">
                            <span class="textbox easyui-fluid" style="width: 438px; height: 28px;">
                            		<input value="${studentDetail.xl.xl}" readonly="readonly" class="textbox-text validatebox-text" autocomplete="off" tabindex="" style="margin: 0px; padding-top: 0px; padding-bottom: 0px; height: 28px; line-height: 28px; width: 430px;"  type="text">
                          	</span>
                        </div>
                    </div>
                    <div class="topjui-col-sm6">
                        <label class="topjui-form-label">学制</label>
                        <div class="topjui-input-block">
                            <span class="textbox easyui-fluid" style="width: 438px; height: 28px;">
                            		<input value="${studentDetail.xz}年" readonly="readonly" class="textbox-text validatebox-text" autocomplete="off" tabindex=""  style="margin: 0px; padding-top: 0px; padding-bottom: 0px; height: 28px; line-height: 28px; width: 430px;" type="text">
                          	</span>
                       </div>
                    </div>
                </div>
                <!-- 基本信息结束 -->
                
                <!-- 基本扩展信息开始 -->
                <div class="topjui-row">
                    <div class="topjui-col-sm12">
                        <fieldset>
                            <legend>基本信息扩展</legend>
                        </fieldset>
                    </div>
                </div>
                
                <div class="topjui-row">
                    <div class="topjui-col-sm6">
                        <label class="topjui-form-label">困难生类别</label>
                        <div class="topjui-input-block">
                            <span class="textbox easyui-fluid" style="width: 438px; height: 28px;">
                            		<input value="${studentDetail.knslb.knslb}" readonly="readonly" class="textbox-text validatebox-text" autocomplete="off" tabindex=""  style="margin: 0px; padding-top: 0px; padding-bottom: 0px; height: 28px; line-height: 28px; width: 430px;"  type="text">
                          	</span>
                        </div>
                    </div>
                    <div class="topjui-col-sm6">
                        <label class="topjui-form-label">师范生类别</label>
                        <div class="topjui-input-block">
                            <span class="textbox easyui-fluid" style="width: 438px; height: 28px;">
                            		<input value="${studentDetail.sfslb.sfslb}" readonly="readonly" class="textbox-text validatebox-text" autocomplete="off" tabindex=""  style="margin: 0px; padding-top: 0px; padding-bottom: 0px; height: 28px; line-height: 28px; width: 430px;" type="text">
                          	</span>
                       </div>
                    </div>
                </div>
                
                <div class="topjui-row">
                    <div class="topjui-col-sm6">
                        <label class="topjui-form-label">培养方式</label>
                        <div class="topjui-input-block">
                            <span class="textbox easyui-fluid" style="width: 438px; height: 28px;">
                            		<input value="${studentDetail.pyfs.pyfs}" readonly="readonly" class="textbox-text validatebox-text" autocomplete="off" tabindex=""  style="margin: 0px; padding-top: 0px; padding-bottom: 0px; height: 28px; line-height: 28px; width: 430px;" type="text">
                          	</span>
                        </div>
                    </div>
                    <div class="topjui-col-sm6">
                        <label class="topjui-form-label">定向/委培单位 	</label>
                        <div class="topjui-input-block">
                            <span class="textbox easyui-fluid" style="width: 438px; height: 28px;">
                            		<input value="${studentDetail.dxhwpdw}" readonly="readonly" class="textbox-text validatebox-text" autocomplete="off" tabindex="" style="margin: 0px; padding-top: 0px; padding-bottom: 0px; height: 28px; line-height: 28px; width: 430px;" type="text">
                          	</span>
                       </div>
                    </div>
                </div>
                
                <div class="topjui-row">
                    <div class="topjui-col-sm6">
                        <label class="topjui-form-label">就业协议书号</label>
                        <div class="topjui-input-block">
                            <span class="textbox easyui-fluid" style="width: 438px; height: 28px;">
                            		<input value="${studentDetail.rxqdaszdw}" readonly="readonly" class="textbox-text validatebox-text" autocomplete="off" tabindex="" style="margin: 0px; padding-top: 0px; padding-bottom: 0px; height: 28px; line-height: 28px; width: 430px;" type="text">
                          	</span>
                        </div>
                    </div>
                    <div class="topjui-col-sm6">
                        <label class="topjui-form-label">入学前户口所在地</label>
                        <div class="topjui-input-block">
                            <span class="textbox easyui-fluid" style="width: 438px; height: 28px;">
                            		<input value="${studentDetail.rxqhkszdpcs}" readonly="readonly"  class="textbox-text validatebox-text" autocomplete="off" tabindex=""  style="margin: 0px; padding-top: 0px; padding-bottom: 0px; height: 28px; line-height: 28px; width: 430px;" type="text">
                          	</span>
                       </div>
                    </div>
                </div>
                
                <div class="topjui-row">
                    <div class="topjui-col-sm6">
                        <label class="topjui-form-label">档案是否转入学校</label>
                        <div class="topjui-input-block">
                            <span class="textbox easyui-fluid" style="width: 438px; height: 28px;">
                            		<input value="${studentDetail.dasfzrxx}" readonly="readonly"  class="textbox-text validatebox-text" autocomplete="off" tabindex="" style="margin: 0px; padding-top: 0px; padding-bottom: 0px; height: 28px; line-height: 28px; width: 430px;" type="text">
                          	</span>
                        </div>
                    </div>
                    <div class="topjui-col-sm6">
                        <label class="topjui-form-label">户口是否转入学校</label>
                        <div class="topjui-input-block">
                            <span class="textbox easyui-fluid" style="width: 438px; height: 28px;">
                            		<input value="${studentDetail.hksfzrxx}" readonly="readonly"  class="textbox-text validatebox-text" autocomplete="off" tabindex="" style="margin: 0px; padding-top: 0px; padding-bottom: 0px; height: 28px; line-height: 28px; width: 430px;" type="text">
                          	</span>
                       </div>
                    </div>
                </div>
                
                
                <!-- 基本扩展信息结束 -->
                
                <!-- 就业信息开始 -->
                
        
        			<input name="sfzh" value="${student.sfzh }" type="hidden"/><input name="xh" value="${student.xh }" type="hidden"/>
                <div class="topjui-row">
                    <div class="topjui-col-sm12">
                        <fieldset>
                            <legend>就业信息</legend>
                        </fieldset>
                    </div>
                </div>
                
                <div class="topjui-row">
                    <div class="topjui-col-sm6">
                        <label class="topjui-form-label">毕业去向</label>
                        <div class="topjui-input-block">
                            <span class="textbox easyui-fluid" style="width: 438px; height: 28px;"  id="byqxDetail">
                            		<input value="${studentDetail.byqx.byqx}" readonly="readonly"   class="textbox-text validatebox-text" autocomplete="off" tabindex=""  style="margin: 0px; padding-top: 0px; padding-bottom: 0px; height: 28px; line-height: 28px; width: 430px;"  type="text" />
                          	</span>
                          	<span style="display:none;" id="byqxSelect" >
	                          	<select name="byqxdm" class="selectpicker" id="byqxSelectId" data-live-search-placeholder="搜索" data-live-search="true" title="请选择"  >
		                        </select>
	                        </span>
                        </div>
                    </div>
                    <div class="topjui-col-sm6">
                        <label class="topjui-form-label">单位名称</label>
                        <div class="topjui-input-block">
                            <span class="textbox easyui-fluid" style="width: 438px; height: 28px;" id="dwmcDetail">
                            		<input value="${studentDetail.dwmc}" readonly="readonly"   class="textbox-text validatebox-text" autocomplete="off" tabindex=""  style="margin: 0px; padding-top: 0px; padding-bottom: 0px; height: 28px; line-height: 28px; width: 430px;" type="text">
                          	</span>
                          	<span style="display:none;" id="dwmcUpdate">
                            		<input value="${studentDetail.dwmc}" class="form-control"  name="dwmc"  style="margin: 0px; padding-top: 0px; padding-bottom: 0px; height: 28px; line-height: 28px; width: 430px;" type="text">
                          	</span>
                       </div>
                    </div>
                </div>
                
                <div class="topjui-row">
                    <div class="topjui-col-sm6">
                        <label class="topjui-form-label">组织机构</label>
                        <div class="topjui-input-block">
                            <span class="textbox easyui-fluid" style="width: 438px; height: 28px;" id="dwzzjgdmDetail">
                            		<input value="${studentDetail.dwzzjgdm}" readonly="readonly"  class="textbox-text validatebox-text" autocomplete="off" tabindex=""  style="margin: 0px; padding-top: 0px; padding-bottom: 0px; height: 28px; line-height: 28px; width: 430px;" type="text">
                          	</span>
                          	<span style="display:none;" id="dwzzjgdmUpdate">
                            		<input value="${studentDetail.dwzzjgdm}" class="form-control"  name="dwzzjgdm"  style="margin: 0px; padding-top: 0px; padding-bottom: 0px; height: 28px; line-height: 28px; width: 430px;" type="text">
                          	</span>
                        </div>
                    </div>
                    <div class="topjui-col-sm6">
                        <label class="topjui-form-label">单位性质</label>
                        <div class="topjui-input-block">
                            <span class="textbox easyui-fluid" style="width: 438px; height: 28px;" id="dwxzDetail">
                            		<input value="${studentDetail.dwxz.dwxz}" readonly="readonly"  class="textbox-text validatebox-text" autocomplete="off" tabindex=""  style="margin: 0px; padding-top: 0px; padding-bottom: 0px; height: 28px; line-height: 28px; width: 430px;" type="text">
                          	</span>
                          	<span style="display:none;" id="dwxzSelect" >
	                          	<select name="dwxzdm" class="selectpicker" id="dwxzSelectId" data-live-search-placeholder="搜索" data-live-search="true" title="请选择"  >
		                        </select>
	                        </span>
                       </div>
                    </div>
                </div>
                
                <div class="topjui-row">
                    <div class="topjui-col-sm6">
                        <label class="topjui-form-label">单位行业</label>
                        <div class="topjui-input-block">
                            <span class="textbox easyui-fluid" style="width: 438px; height: 28px;" id="dwhyDetail">
                            		<input value="${studentDetail.dwhy.dwhy}" readonly="readonly"  class="textbox-text validatebox-text" autocomplete="off" tabindex=""  style="margin: 0px; padding-top: 0px; padding-bottom: 0px; height: 28px; line-height: 28px; width: 430px;" type="text">
                          	</span>
                          	<span style="display:none;" id="dwhySelect" >
	                          	<select name="dwhydm" class="selectpicker" id="dwhySelectId" data-live-search-placeholder="搜索" data-live-search="true" title="请选择"  >
		                        </select>
	                        </span>
                        </div>
                    </div>
                    <div class="topjui-col-sm6">
                        <label class="topjui-form-label">工作职位</label>
                        <div class="topjui-input-block">
                            <span class="textbox easyui-fluid" style="width: 438px; height: 28px;" id="gzzwDetail">
                            		<input value="${studentDetail.gzzwlb.gzzwlb}" readonly="readonly" class="textbox-text validatebox-text" autocomplete="off" tabindex=""  style="margin: 0px; padding-top: 0px; padding-bottom: 0px; height: 28px; line-height: 28px; width: 430px;" type="text">
                          	</span>
                          	<span style="display:none;" id="gzzwSelect" >
	                          	<select name="gzzwlbdm" class="selectpicker" id="gzzwSelectId" data-live-search-placeholder="搜索" data-live-search="true" title="请选择"  >
		                        </select>
	                        </span>
                       </div>
                    </div>
                </div>
                
                <div class="topjui-row">
                    <div class="topjui-col-sm6">
                        <label class="topjui-form-label">单位所在地</label>
                        <div class="topjui-input-block">
                            <span class="textbox easyui-fluid" style="width: 438px; height: 28px;" id="dwszdDetail">
                            		<input value="${studentDetail.dwszd.dwszd}" readonly="readonly" class="textbox-text validatebox-text" autocomplete="off" tabindex=""  style="margin: 0px; padding-top: 0px; padding-bottom: 0px; height: 28px; line-height: 28px; width: 430px;" type="text">
                          	</span>
                          	<span style="display:none;" id="dwszdSelect" >
	                          <select name="dwszddm" class=""  id="dwszdSelectId"  data-live-search-placeholder="搜索" data-live-search="true"  >
	                          		<option value="0">---请选择---</option>
		                        </select> 
		                       
	                        </span>
                        </div>
                    </div>
                    <div class="topjui-col-sm6">
                        <label class="topjui-form-label">单位地址</label>
                        <div class="topjui-input-block">
                            <span class="textbox easyui-fluid" style="width: 438px; height: 28px;" id="dwdzDetail">
                            		<input value="${studentDetail.dwdz}" readonly="readonly"  class="textbox-text validatebox-text" autocomplete="off" tabindex=""  style="margin: 0px; padding-top: 0px; padding-bottom: 0px; height: 28px; line-height: 28px; width: 430px;" type="text">
                          	</span>
                          	<span style="display:none;" id="dwdzUpdate">
                            		<input value="${studentDetail.dwdz}" class="form-control"  name="dwdz"  style="margin: 0px; padding-top: 0px; padding-bottom: 0px; height: 28px; line-height: 28px; width: 430px;" type="text">
                          	</span>
                       </div>
                    </div>
                </div>
                
                <div class="topjui-row">
                    <div class="topjui-col-sm6">
                        <label class="topjui-form-label">单位联系人</label>
                        <div class="topjui-input-block">
                            <span class="textbox easyui-fluid" style="width: 438px; height: 28px;" id="dwlxrDetail">
                            		<input value="${studentDetail.dwlxr}" readonly="readonly"  class="textbox-text validatebox-text" autocomplete="off" tabindex="" style="margin: 0px; padding-top: 0px; padding-bottom: 0px; height: 28px; line-height: 28px; width: 430px;" type="text">
                          	</span>
                          	<span style="display:none;" id="dwlxrUpdate">
                            		<input value="${studentDetail.dwlxr}" class="form-control"  name="dwlxr"  style="margin: 0px; padding-top: 0px; padding-bottom: 0px; height: 28px; line-height: 28px; width: 430px;" type="text">
                          	</span>
                        </div>
                    </div>
                    <div class="topjui-col-sm6">
                        <label class="topjui-form-label">联系人电话</label>
                        <div class="topjui-input-block">
                            <span class="textbox easyui-fluid" style="width: 438px; height: 28px;" id="lxrdhDetail">
                            		<input value="${studentDetail.lxrdh}" readonly="readonly"  class="textbox-text validatebox-text" autocomplete="off" tabindex="" style="margin: 0px; padding-top: 0px; padding-bottom: 0px; height: 28px; line-height: 28px; width: 430px;" type="text">
                          	</span>
                          	<span style="display:none;" id="lxrdhUpdate">
                            		<input value="${studentDetail.lxrdh}" class="form-control"  name="lxrdh"  style="margin: 0px; padding-top: 0px; padding-bottom: 0px; height: 28px; line-height: 28px; width: 430px;" type="text">
                          	</span>
                       </div>
                    </div>
                </div>
                
                <div class="topjui-row">
                    <div class="topjui-col-sm6">
                        <label class="topjui-form-label">联系人手机</label>
                        <div class="topjui-input-block">
                            <span class="textbox easyui-fluid" style="width: 438px; height: 28px;" id="lxrsjDetail">
                            		<input value="${studentDetail.lxrsj}" readonly="readonly" class="textbox-text validatebox-text" autocomplete="off" tabindex="" style="margin: 0px; padding-top: 0px; padding-bottom: 0px; height: 28px; line-height: 28px; width: 430px;" type="text">
                          	</span>
                          	<span style="display:none;" id="lxrsjUpdate">
                            		<input value="${studentDetail.lxrsj}" class="form-control"  name="lxrsj"  style="margin: 0px; padding-top: 0px; padding-bottom: 0px; height: 28px; line-height: 28px; width: 430px;" type="text">
                          	</span>
                        </div>
                    </div>
                    <div class="topjui-col-sm6">
                        <label class="topjui-form-label">联系人email</label>
                        <div class="topjui-input-block">
                            <span class="textbox easyui-fluid" style="width: 438px; height: 28px;" id="lxrdzyxDetail">
                            		<input value="${studentDetail.lxrdzyx}" readonly="readonly" class="textbox-text validatebox-text" autocomplete="off" tabindex="" style="margin: 0px; padding-top: 0px; padding-bottom: 0px; height: 28px; line-height: 28px; width: 430px;" type="text">
                          	</span>
                          	<span style="display:none;" id="lxrdzyxUpdate">
                            		<input value="${studentDetail.lxrdzyx}" class="form-control"  name="lxrdzyx"  style="margin: 0px; padding-top: 0px; padding-bottom: 0px; height: 28px; line-height: 28px; width: 430px;" type="text">
                          	</span>
                       </div>
                    </div>
                </div>
                
                <div class="topjui-row">
                    <div class="topjui-col-sm6">
                        <label class="topjui-form-label">联系人传真</label>
                        <div class="topjui-input-block">
                            <span class="textbox easyui-fluid" style="width: 438px; height: 28px;" id="lxrczDetail">
                            		<input value="${studentDetail.lxrcz}" readonly="readonly" class="textbox-text validatebox-text" autocomplete="off" tabindex=""  style="margin: 0px; padding-top: 0px; padding-bottom: 0px; height: 28px; line-height: 28px; width: 430px;" type="text">
                          	</span>
                          	<span style="display:none;" id="lxrczUpdate">
                            		<input value="${studentDetail.lxrcz}" class="form-control"  name="lxrcz"  style="margin: 0px; padding-top: 0px; padding-bottom: 0px; height: 28px; line-height: 28px; width: 430px;" type="text">
                          	</span>
                        </div>
                    </div>
                    <div class="topjui-col-sm6">
                        <label class="topjui-form-label">单位邮编</label>
                        <div class="topjui-input-block">
                            <span class="textbox easyui-fluid" style="width: 438px; height: 28px;" id="dwybDetail">
                            		<input value="${studentDetail.dwyb}"  readonly="readonly" class="textbox-text validatebox-text" autocomplete="off" tabindex=""  style="margin: 0px; padding-top: 0px; padding-bottom: 0px; height: 28px; line-height: 28px; width: 430px;" type="text">
                          	</span>
                          	<span style="display:none;" id="dwybUpdate">
                            		<input value="${studentDetail.dwyb}" class="form-control"  name="dwyb"  style="margin: 0px; padding-top: 0px; padding-bottom: 0px; height: 28px; line-height: 28px; width: 430px;" type="text">
                          	</span>
                       </div>
                    </div>
                </div>
                
                <div class="topjui-row">
                    <div class="topjui-col-sm6">
                        <label class="topjui-form-label">报到证签发类别</label>
                        <div class="topjui-input-block">
                            <span class="textbox easyui-fluid" style="width: 438px; height: 28px;" id="bdzqflbDetail">
                            		<input value="${studentDetail.bdzqflb.bdzqflb}" readonly="readonly" class="textbox-text validatebox-text" autocomplete="off" tabindex=""  style="margin: 0px; padding-top: 0px; padding-bottom: 0px; height: 28px; line-height: 28px; width: 430px;" type="text">
                          	</span>
                        </div>
                    </div>
                    <div class="topjui-col-sm6">
                        <label class="topjui-form-label">报到证签往单位名称</label>
                        <div class="topjui-input-block">
                            <span class="textbox easyui-fluid" style="width: 438px; height: 28px;" id="bdzqwdwmcDetail">
                            		<input value="${studentDetail.bdzqwdwmc}" readonly="readonly"  class="textbox-text validatebox-text" autocomplete="off" tabindex="" style="margin: 0px; padding-top: 0px; padding-bottom: 0px; height: 28px; line-height: 28px; width: 430px;" type="text">
                          	</span>
                       </div>
                    </div>
                </div>
                
                <div class="topjui-row">
                    <div class="topjui-col-sm6">
                        <label class="topjui-form-label">签往单位所在地</label>
                        <div class="topjui-input-block">
                            <span class="textbox easyui-fluid" style="width: 438px; height: 28px;" id="qwdwszdDetail">
                            		<input value="${studentDetail.qwdwszd.qwdwszd}" readonly="readonly"  class="textbox-text validatebox-text" autocomplete="off" tabindex="" style="margin: 0px; padding-top: 0px; padding-bottom: 0px; height: 28px; line-height: 28px; width: 430px;" type="text">
                          	</span>
                        </div>
                    </div>
                    <div class="topjui-col-sm6">
                        <label class="topjui-form-label">户口迁转地址</label>
                        <div class="topjui-input-block">
                            <span class="textbox easyui-fluid" style="width: 438px; height: 28px;" id="hkqzdzDetail">
                            		<input value="${studentDetail.hkqzdz}" readonly="readonly"  class="textbox-text validatebox-text" autocomplete="off" tabindex=""  style="margin: 0px; padding-top: 0px; padding-bottom: 0px; height: 28px; line-height: 28px; width: 430px;" type="text">
                          	</span>
                       </div>
                    </div>
                </div>
                
                <div class="topjui-row">
                    <div class="topjui-col-sm6">
                        <label class="topjui-form-label">档案转寄单位名称</label>
                        <div class="topjui-input-block">
                            <span class="textbox easyui-fluid" style="width: 438px; height: 28px;" id="dazjdwmcDetail">
                            		<input value="${studentDetail.dazjdwmc}" readonly="readonly"  class="textbox-text validatebox-text" autocomplete="off" tabindex=""  style="margin: 0px; padding-top: 0px; padding-bottom: 0px; height: 28px; line-height: 28px; width: 430px;" type="text">
                          	</span>
                        </div>
                    </div>
                    <div class="topjui-col-sm6">
                        <label class="topjui-form-label">档案转寄单位邮编</label>
                        <div class="topjui-input-block">
                            <span class="textbox easyui-fluid" style="width: 438px; height: 28px;" id="dazjdwybDetail">
                            		<input value="${studentDetail.dazjdwyb}" readonly="readonly" class="textbox-text validatebox-text" autocomplete="off" tabindex="" style="margin: 0px; padding-top: 0px; padding-bottom: 0px; height: 28px; line-height: 28px; width: 430px;" type="text">
                          	</span>
                       </div>
                    </div>
                </div>
                
                <div class="topjui-row">
                    <div class="topjui-col-sm6">
                        <label class="topjui-form-label">档案转寄单位地址</label>
                        <div class="topjui-input-block">
                            <span class="textbox easyui-fluid" style="width: 438px; height: 28px;" id="dazjdwdzDetail">
                            		<input value="${studentDetail.dazjdwdz}" readonly="readonly"  class="textbox-text validatebox-text" autocomplete="off" tabindex=""  style="margin: 0px; padding-top: 0px; padding-bottom: 0px; height: 28px; line-height: 28px; width: 430px;" type="text">
                          	</span>
                        </div>
                    </div>
                    <div class="topjui-col-sm6">
                        <label class="topjui-form-label">报到证编号(时间)</label>
                        <div class="topjui-input-block">
                            <span class="textbox easyui-fluid" style="width: 438px; height: 28px;">
                            		<input value="${studentDetail.bdzbh}${studentDetail.bdqssj}" readonly="readonly" class="textbox-text validatebox-text" autocomplete="off" tabindex=""  style="margin: 0px; padding-top: 0px; padding-bottom: 0px; height: 28px; line-height: 28px; width: 430px;" type="text">
                          	</span>
                       </div>
                    </div>
                </div>
                
                <!-- 就业信息结束 -->
                
                <!-- 联系方式开始 -->
                <div class="topjui-row">
                    <div class="topjui-col-sm12">
                        <fieldset>
                            <legend>联系方式</legend>
                        </fieldset>
                    </div>
                </div>
                
                <div class="topjui-row">
                    <div class="topjui-col-sm6">
                        <label class="topjui-form-label">手机号码</label>
                        <div class="topjui-input-block">
                            <span class="textbox easyui-fluid" style="width: 438px; height: 28px;" id="mobilephoneDetail">
                            		<input value="${studentDetail.mobilephone}" readonly="readonly"  class="textbox-text validatebox-text" autocomplete="off" tabindex="" style="margin: 0px; padding-top: 0px; padding-bottom: 0px; height: 28px; line-height: 28px; width: 430px;" type="text">
                          	</span>
                          	<span style="display:none;" id="mobilephoneUpdate">
                            		<input required value="${studentDetail.mobilephone}" class="form-control"  name="mobilePhone"  style="margin: 0px; padding-top: 0px; padding-bottom: 0px; height: 28px; line-height: 28px; width: 430px;" type="text">
                          	</span>
                        </div>
                    </div>
                    <div class="topjui-col-sm6">
                        <label class="topjui-form-label">电子邮箱</label>
                        <div class="topjui-input-block">
                            <span class="textbox easyui-fluid" style="width: 438px; height: 28px;" id="emailDetail">
                            		<input value="${studentDetail.email}" readonly="readonly" class="textbox-text validatebox-text" autocomplete="off" tabindex=""  style="margin: 0px; padding-top: 0px; padding-bottom: 0px; height: 28px; line-height: 28px; width: 430px;" type="text">
                          	</span>
                          	<span style="display:none;" id="emailUpdate">
                            		<input required value="${studentDetail.email}" class="form-control"  name="email"  style="margin: 0px; padding-top: 0px; padding-bottom: 0px; height: 28px; line-height: 28px; width: 430px;" type="text">
                          	</span>
                       </div>
                    </div>
                </div>
                
                <div class="topjui-row">
                    <div class="topjui-col-sm6">
                        <label class="topjui-form-label">家长姓名</label>
                        <div class="topjui-input-block">
                            <span class="textbox easyui-fluid" style="width: 438px; height: 28px;" id="qqDetail">
                            		<input value="${studentDetail.qq}" readonly="readonly" class="textbox-text validatebox-text" autocomplete="off" tabindex="" style="margin: 0px; padding-top: 0px; padding-bottom: 0px; height: 28px; line-height: 28px; width: 430px;" type="text">
                          	</span>
                          	<span style="display:none;" id="qqUpdate">
                            		<input required value="${studentDetail.qq}" class="form-control"  name="qq"  style="margin: 0px; padding-top: 0px; padding-bottom: 0px; height: 28px; line-height: 28px; width: 430px;" type="text">
                          	</span>
                        </div>
                    </div>
                    <div class="topjui-col-sm6">
                        <label class="topjui-form-label">家庭地址</label>
                        <div class="topjui-input-block">
                            <span class="textbox easyui-fluid" style="width: 438px; height: 28px;" id="jtdzDetail">
                            		<input value="${studentDetail.jtdz}" readonly="readonly"  class="textbox-text validatebox-text" autocomplete="off" tabindex=""  style="margin: 0px; padding-top: 0px; padding-bottom: 0px; height: 28px; line-height: 28px; width: 430px;" type="text">
                          	</span>
                          	<span style="display:none;" id="jtdzUpdate">
                            		<input value="${studentDetail.jtdz}" class="form-control"  name="jtdz"  style="margin: 0px; padding-top: 0px; padding-bottom: 0px; height: 28px; line-height: 28px; width: 430px;" type="text">
                          	</span>
                       </div>
                    </div>
                </div>
                
                <div class="topjui-row">
                    <div class="topjui-col-sm6">
                        <label class="topjui-form-label">家庭电话</label>
                        <div class="topjui-input-block">
                            <span class="textbox easyui-fluid" style="width: 438px; height: 28px;" id="jtdhDetail">
                            		<input value="${studentDetail.jtdh}" readonly="readonly" class="textbox-text validatebox-text" autocomplete="off" tabindex=""  style="margin: 0px; padding-top: 0px; padding-bottom: 0px; height: 28px; line-height: 28px; width: 430px;" type="text">
                          	</span>
                          	<span style="display:none;" id="jtdhUpdate">
                            		<input required value="${studentDetail.jtdh}" class="form-control"  name="jtdh"  style="margin: 0px; padding-top: 0px; padding-bottom: 0px; height: 28px; line-height: 28px; width: 430px;" type="text">
                          	</span>
                        </div>
                    </div>
                    <div class="topjui-col-sm6">
                        <label class="topjui-form-label">家庭邮编	</label>
                        <div class="topjui-input-block">
                            <span class="textbox easyui-fluid" style="width: 438px; height: 28px;" id="jtybDetail">
                            		<input value="${studentDetail.jtyb}" readonly="readonly" class="textbox-text validatebox-text" autocomplete="off" tabindex="" style="margin: 0px; padding-top: 0px; padding-bottom: 0px; height: 28px; line-height: 28px; width: 430px;" type="text">
                          	</span>
                          	<span style="display:none;" id="jtybUpdate">
                            		<input required value="${studentDetail.jtyb}" class="form-control"  name="jtyb"  style="margin: 0px; padding-top: 0px; padding-bottom: 0px; height: 28px; line-height: 28px; width: 430px;" type="text">
                          	</span>
                       </div>
                    </div>
                </div>
            
                <!-- 联系方式结束 -->
        </div>
     
</form>             
           
<footer>
    <div class="footer" style="width:100%">
        <p class="text-center">学校：<a href="javascript:void(0);" target="_blank">哈尔滨信息工程学院</a></p>
        <p class="text-center">版权：<a href="javascript:void(0);" target="_blank">哈尔滨信息工程学院软件学院</a></p>
        <p class="text-center">备案号：<a href="javascript:void(0);" target="_blank">黑ICP备17006741号-1</a></p>
    </div>
</footer>  </div>  
	</div></div>
	</body></html>