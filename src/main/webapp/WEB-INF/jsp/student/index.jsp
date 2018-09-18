<%--
  Created by IntelliJ IDEA.
  User: xuning
  Date: 2017/12/15
  Time: 17:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>学生毕业信息填写</title>
    <link rel="stylesheet" media="screen" href="/css/daimabiji.css" />

    <style>
        .table_style{width: 100%;height: auto;text-align:center}
        .td1{width:40% ;  text-align:right ;font-size:20px;font-family:楷体 }
        .td2{width:50% ; text-align:left }
        .hidden{color:red;display:none;}
        .opt{display: none;}
    </style>
</head>
<form id="msform" action="/student/supdate" method="post">
    <!-- progressbar -->
    <ul id="progressbar">
        <li class="active">联系方式</li>
        <li>毕业去向</li>
        <li>单位信息</li>
        <li>设&nbsp;&nbsp;&nbsp;&nbsp;置</li>
    </ul>
    <!-- fieldsets -->
    <fieldset>
        <h2 class="fs-title">基本信息</h2>
        <h3 class="fs-subtitle">联系方式</h3>
        <table style="align:center;" class="table_style">
            <tr>
                <td class="td1">
                    <span><font color="red"></font>手机号码：</span>
                </td>
                <td class="td2">
                    <input type="text" name="mobilePhone" id="mobilephone" class="input" placeholder="手机号码" />
                    <span class="hidden" id="mobilephone_yz"></span>
                </td>
            </tr>
            <tr>
                <td class="td1">
                    <span><font color="red"></font>电子邮箱：</span>
                </td>
                <td class="td2">
                    <input type="text" name="email" id="email" placeholder="电子邮箱" class="input" />
                    <span class="hidden" id="email_yz"></span>
                </td>
            </tr>
            <tr>
                <td class="td1">
                    <span><font color="red"></font>Q Q号码：</span>
                </td>
                <td class="td2">
                    <input type="number" name="qq" id="qq" placeholder="QQ号码" class="input" />
                    <span class="hidden" id="qq_yz"></span>
                </td>
            </tr>
            <tr>
                <td class="td1">
                    <span><font color="red"></font>家庭住址：</span>
                </td>
                <td class="td2">
                    <input type="text" name="jtdz" id="jtdz" placeholder="家庭住址" class="input" />
                    <span class="hidden" id="jtdz_yz"></span>
                </td>
            </tr>
            <tr>
                <td class="td1">
                    <span><font color="red"></font>家庭电话：</span>
                </td>
                <!-- 0459-6934339    -不能存入数据库 -->
                <td class="td2">
                    <input type="text" name="jtdh" id="jtdh" placeholder="家庭电话" class="input" />
                    <span class="hidden" id="jtdh_yz"></span>
                </td>
            </tr>
            <tr>
                <td class="td1">
                    <span><font color="red"></font>家庭邮编：</span>
                </td>
                <td class="td2">
                    <input type="number" name="jtyb" id="jtyb" placeholder="家庭邮编" class="input" />
                    <span class="hidden" id="jtyb_yz"></span>
                </td>
            </tr>
        </table>
        <input type="button" name="next" id="page1" class=" action-button" value="下一步" />
    </fieldset>


    <fieldset>
        <h2 class="fs-title">毕业信息</h2>
        <h3 class="fs-subtitle">毕业去向</h3>
        <table  class="table_style">
            <tr>
                <td class="td1">
                    <span><font color="red"></font>毕业去向</span>
                </td>
                <td class="td2" >
                    <select id="byqx" name="byqxdm" class="input">
                        <option value="">---毕业去向---</option>
                    </select>
                    <span class="hidden" id="byqx_yz"></span>
                </td>
            </tr>
            <tr>
                <td class="td1">
                    <span><font color="red"></font>单位名称</span>
                </td>
                <td class="td2">
                    <input type="text" name="dwmc" id="dwmc" placeholder="单位名称" class="input" />
                    <span class="hidden" id="dwmc_yz"></span>
                </td>
            </tr>
            <tr>
                <td class="td1">
                    <span><font color="red"></font>组织机构代码/工商营业执照</span>
                </td>
                <td class="td2">
                    <input type="text" name="dwzzjgdm" id="dwzzjgdm" placeholder="组织机构代码/工商营业执照" class="input" />
                    <span class="hidden" id="dwzzjgdm_yz"></span>
                </td>
            </tr>
            <tr>
                <td class="td1">
                    <span><font color="red"></font>单位性质</span>
                </td>
                <td class="td2">
                    <select id="dwxz" name="dwxzdm" class="input">
                        <option value="">---请选择单位性质---</option>
                    </select>
                    <span class="hidden" id="dwxz_yz"></span>
                </td>
            </tr>
            <tr>
                <td class="td1">
                    <span><font color="red"></font>单位行业</span>
                </td>
                <td class="td2">
                    <select id="dwhy" name="dwhydm" class="input">
                        <option value="">---请选择单位行业---</option>
                    </select>
                    <span class="hidden" id="dwhy_yz"></span>
                </td>
            </tr>
            <tr>
                <td class="td1">
                    <span><font color="red"></font>单位所在地</span>
                </td>
                <td class="td2">
                    <select id="dwszd" name="dwszddm"  style="">
                        <option value="" class="opt">---请选择单位所在地---</option>
                        <c:forEach items="${requestScope.dwszds}" var="dwszd">
                            <option class="opt" value="${dwszd.dwszddm}">${dwszd.dwszd}</option>
                        </c:forEach>
                    </select>
                    <span class="hidden" id="dwszd_yz"></span>
                </td>
            </tr>
            <tr>
                <td class="td1">
                    <span><font color="red"></font>工作职位类别</span>
                </td>
                <td class="td2">
                    <select id="gzzwlb" name="gzzwlbdm" class="input">
                        <option value="">---请选择工作职位类别---</option>
                    </select>
                    <span class="hidden" id="gzzwlb_yz"></span>
                </td>
            </tr>
        </table>
        <input type="button" name="previous" class="previous action-button" value="上一步" />
        <input type="button" name="next" id="page2" class=" action-button" value="下一步" />
    </fieldset>
    <fieldset>
        <h2 class="fs-title">毕业信息</h2>
        <h3 class="fs-subtitle">单位信息</h3>
        <table class="table_style">
            <tr>
                <td class="td1">
                    <span>单位联系人姓名：</span>
                </td>
                <td class="td2">
                    <input type="text" name="dwlxr" id="dwlxr" placeholder="单位联系人姓名" class="input" />
                    <span class="hidden" id="dwlxr_yz"></span>
                </td>
            </tr>
            <tr>
                <td class="td1">
                    <span><font color="red"></font>单位联系人电话：</span>
                </td>
                <td class="td2">
                    <input type="number" name="lxrdh" id="lxrdh" placeholder="单位联系人电话" class="input" />
                    <span class="hidden" id="lxrdh_yz"></span>
                </td>
            </tr>
            <tr>
                <td class="td1">
                    <span><font color="red"></font>单位联系人手机：</span>
                </td>
                <td class="td2">
                    <input type="text" name="lxrsj" id="lxrsj" placeholder="单位联系人手机" class="input" />
                    <span class="hidden" id="lxrsj_yz"></span>
                </td>
            </tr>
            <tr>
                <td class="td1">
                    <span>单位联系人电子邮箱：</span>
                </td>
                <td class="td2">
                    <input type="email" name="lxrdzyx" id="lxrdzyx" placeholder="单位联系人电子邮箱" class="input" />
                    <span class="hidden" id="lxrdzyx_yz"></span>
                </td>
            </tr>
            <tr>
                <td class="td1">
                    <span>单位联系人传真：</span>
                </td>
                <td class="td2">
                    <input type="number" name="lxrcz" id="lxrcz" placeholder="单位联系人传真" class="input" />
                    <span class="hidden" id="lxrcz_yz"></span>
                </td>
            </tr>
            <tr>
                <td class="td1">
                    <span><font color="red"></font>单位地址：</span>
                </td>
                <td class="td2">
                    <input type="text" name="dwdz" id="dwdz" placeholder="单位地址" class="input" />
                    <span class="hidden" id="dwdz_yz"></span>
                </td>
            </tr>
            <tr>
                <td class="td1">
                    <span>单位邮编：</span>
                </td>
                <td class="td2">
                    <input type="number" name="dwyb" placeholder="单位邮编" class="input" />
                    <span class="hidden" id="dwyb_yz"></span>
                </td>
            </tr>
        </table>
        <input type="button" name="previous" class="previous action-button" value="上一步" />
        <input type="button" name="next" id="page3" class="action-button" value="下一步" />
    </fieldset>
    <fieldset>
        <h2 class="fs-title">密码设置</h2>
        <h3 class="fs-subtitle">请检查前面所填信息</h3>
        <table class="table_style">
            <tr>
                <td class="td1">
                    设置密码(可以不填写使用默认密码)
                    <input type="hidden" name="ksh" value="${student.ksh}"/>
                    <input type="hidden" name="sfzh" value="${student.sfzh}"/>
                    <input type="hidden" name="bysj" value="${student.bysj}"/>
                </td>
                <td class="td2">
                    <input type="text" name="password" placeholder="设置新密码" class="input" />
                </td>
            </tr>
        </table>
        <input type="button" name="previous" class="previous action-button" value="上一页" />
        <input type="button" id="button" class="submit action-button" value="提交" />
    </fieldset>
</form>
<script src="/js/jquery-3.2.1.min.js"></script>
<script src="/js/jquery.easing.min.js" type="text/javascript"></script>
<script src="/js/daimabiji.js" type="text/javascript"></script>

<script>
    $("#button").click(function () {
        $("#msform").submit();
    });
</script>
<!-- 加载下拉列表 -->
<script>
    
    $(function () {
        var date = $("#bysj").val();
        $.post("/byqx/"+date+"/get",{},function (date) {
            $.each(date , function (i , obj) {
                $("#byqx").append("<option value='"+obj.byqxdm+"'>"+obj.byqx+"</option>");
            });
        });
        $.post("/dwxz/"+date+"/get",{},function (date) {
            $.each(date , function (i , obj) {
                $("#dwxz").append("<option value='"+obj.dwxzdm+"'>"+obj.dwxz+"</option>");
            });
        });
        $.post("/dwhy/"+date+"/get",{},function (date) {
            $.each(date , function (i , obj) {
                $("#dwhy").append("<option value='"+obj.dwhydm+"'>"+obj.dwhy+"</option>");
            });
        });
//        $.post("/dwszd/"+date+"/get",{},function (date) {
//            $.each(date , function (i , obj) {
//                $("#dwszd").append("<option  value='"+obj.dwszddm+"'>"+obj.dwszd+"</option>");
//            });
//        });
        $.post("/gzzwlb/"+date+"/get",{},function (date) {
            $.each(date , function (i , obj) {
                $("#gzzwlb").append("<option value='"+obj.gzzwlbdm+"'>"+obj.gzzwlb+"</option>");
            });
        });
    });
    
</script>


<script>
    $(function(){
       /*  $("#lxrdh").blur(function(){
            if("" == $(this).val()){
                $("#lxrdh_yz").html("联系人电话不能为空").show();
            }else{
                $("#lxrdh_yz").hide();
            }
        });
        var pattern = /^1[34578]\d{9}$/;
        $("#lxrsj").blur(function(){
            if(!(pattern.test($(this).val()))){
                $("#lxrsj_yz").html("请正确输入手机号").show();
            }else{
                $("#lxrsj_yz").hide();
            }
        });
        $("#dwdz").blur(function(){
            if("" == $(this).val()){
                $("#dwdz_yz").html("请输入单位地址").show();
            }else{
                $("#dwdz_yz").hide();
            }
        }); */
        $("#page3").click(function(){
            /* if((!("" == $("#dwdz").val()))  && (!("" == $("#lxrdh").val())) && pattern.test($("#lxrsj").val())  ){
                if(animating) return false;
                animating = true; */

                current_fs = $(this).parent();
                next_fs = $(this).parent().next();

                //activate next step on progressbar using the index of next_fs
                $("#progressbar li").eq($("fieldset").index(next_fs)).addClass("active");

                //show the next fieldset
                next_fs.show();
                //hide the current fieldset with style
                current_fs.animate({opacity: 0}, {
                    step: function(now, mx) {
                        //as the opacity of current_fs reduces to 0 - stored in "now"
                        //1. scale current_fs down to 80%
                        scale = 1 - (1 - now) * 0.2;
                        //2. bring next_fs from the right(50%)
                        left = (now * 50)+"%";
                        //3. increase opacity of next_fs to 1 as it moves in
                        opacity = 1 - now;
                        current_fs.css({'transform': 'scale('+scale+')'});
                        next_fs.css({'left': left, 'opacity': opacity});
                    },
                    duration: 800,
                    complete: function(){
                        current_fs.hide();
                        animating = false;
                    },
                    //this comes from the custom easing plugin
                    easing: 'easeInOutBack'
                });
          /*   }else{
                alert("请完善信息");
            } */
        });
    });
</script>

<script>

    $(function(){
        /* $("#byqx").change(function(){
            if($(this).val() == ""){
                $("#byqx_yz").html("请选择毕业去向").show();
            }else{
                $("#byqx_yz").hide();
            }
        });
        $("#dwmc").blur(function(){
            if("" == $(this).val()){
                $("#dwmc_yz").html("单位名称不能为空").show();
            }else{
                $("#dwmc_yz").hide();
            }
        });
        $("#dwzzjgdm").blur(function(){
            if("" == $(this).val()){
                $("#dwzzjgdm_yz").html("组织机构代码不能为空").show();
            }else{
                $("#dwzzjgdm_yz").hide();
            }
        });
        $("#dwxz").change(function(){
            if($(this).val() == ""){
                $("#dwxz_yz").html("请选择单位性质").show();
            }else{
                $("#dwxz_yz").hide();
            }
        });
        $("#dwhy").change(function(){
            if($(this).val() == ""){
                $("#dwhy_yz").html("请选择单位行业").show();
            }else{
                $("#dwhy_yz").hide();
            }
        });
        $("#dwszd").change(function(){
            if($(this).val() == ""){
                $("#dwszd_yz").html("请选择单位所在地").show();
            }else{
                $("#dwszd_yz").hide();
            }
        });
        $("#gzzwlb").change(function(){
            if($(this).val() == ""){
                $("#gzzwlb_yz").html("请选择工作职位类别").show();
            }else{
                $("#gzzwlb_yz").hide();
            }
        }); */
        $("#page2").click(function(){
            /* if((!("" == $("#byqx").val())) && (!($("#dwmc").val() == "")) && (!($("#dwzzjgdm").val() == "")) && (!($("#dwxz").val() == "")) && (!($("#dwhy").val() == "")) && (!($("#dwszd").val() == "")) && (!($("#gzzwlb").val() == ""))  ){
                if(animating) return false;
                animating = true; */

                current_fs = $(this).parent();
                next_fs = $(this).parent().next();

                //activate next step on progressbar using the index of next_fs
                $("#progressbar li").eq($("fieldset").index(next_fs)).addClass("active");

                //show the next fieldset
                next_fs.show();
                //hide the current fieldset with style
                current_fs.animate({opacity: 0}, {
                    step: function(now, mx) {
                        //as the opacity of current_fs reduces to 0 - stored in "now"
                        //1. scale current_fs down to 80%
                        scale = 1 - (1 - now) * 0.2;
                        //2. bring next_fs from the right(50%)
                        left = (now * 50)+"%";
                        //3. increase opacity of next_fs to 1 as it moves in
                        opacity = 1 - now;
                        current_fs.css({'transform': 'scale('+scale+')'});
                        next_fs.css({'left': left, 'opacity': opacity});
                    },
                    duration: 800,
                    complete: function(){
                        current_fs.hide();
                        animating = false;
                    },
                    //this comes from the custom easing plugin
                    easing: 'easeInOutBack'
                });
           /*  }else{
                if($("#byqx").val() == ""){
                    $("#byqx_yz").html("请选择毕业去向").show();
                }
                if($("#dwxz").val() == ""){
                    $("#dwxz_yz").html("请选择单位性质").show();
                }
                if($("#dwhy").val() == ""){
                    $("#dwhy_yz").html("请选择单位行业").show();
                }
                if($("#dwszd").val() == ""){
                    $("#dwszd_yz").html("请选择单位所在地").show();
                }
                if($("#gzzwlb").val() == ""){
                    $("#gzzwlb_yz").html("请选择工作职位类别").show();
                }
                alert("请完善信息"); 
            }*/
        });
    });

</script>

<script>
    $(function(){
        var mobilephone = $("#mobilephone").val();
        var email = $("#email").val();
        var pattern = /^1[34578]\d{9}$/;
        $("#mobilephone").blur(function(){
        		if(!(pattern.test($("#mobilephone").val()))){
                //$("#mobilephone_yz").html("请正确输入手机号码").show();
            }else{
                $("#mobilephone_yz").hide();
         	}
        });
        $("#email").blur(function(){
            if(!$("#email").val().match(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/)){
                $("#email_yz").html("请正确输入邮箱").show();
            }else{
                $("#email_yz").hide();
            }
        });
       /*  $("#jtdz").blur(function(){
            if(!("" == $(this).val())){
                $("#jtdz_yz").hide();
            }else{
                $("#jtdz_yz").html("家庭地址不能为空").show();
            }
        });
        $("#qq").blur(function(){
            if(!("" == $(this).val())){
                $("#qq_yz").hide();
            }else{
                $("#qq_yz").html("QQ号不能为空").show();
            }
        });
        $("#jtyb").blur(function(){
            if(!("" == $(this).val())){
                $("#jtyb_yz").hide();
            }else{
                $("#jtyb_yz").html("邮编不能为空").show();
            }
        }); */
        $("#page1").click(function(){
        		if( $("#mobilephone").val() == "" || (  $("#mobilephone").val() != "" && pattern.test($("#mobilephone").val()) )  ){
        				current_fs = $(this).parent();
                    next_fs = $(this).parent().next();

                    //activate next step on progressbar using the index of next_fs
                    $("#progressbar li").eq($("fieldset").index(next_fs)).addClass("active");

                    //show the next fieldset
                    next_fs.show();
                    //hide the current fieldset with style
                    current_fs.animate({opacity: 0}, {
                        step: function(now, mx) {
                            //as the opacity of current_fs reduces to 0 - stored in "now"
                            //1. scale current_fs down to 80%
                            scale = 1 - (1 - now) * 0.2;
                            //2. bring next_fs from the right(50%)
                            left = (now * 50)+"%";
                            //3. increase opacity of next_fs to 1 as it moves in
                            opacity = 1 - now;
                            current_fs.css({'transform': 'scale('+scale+')'});
                            next_fs.css({'left': left, 'opacity': opacity});
                        },
                        duration: 800,
                        complete: function(){
                            current_fs.hide();
                            animating = false;
                        },
                        //this comes from the custom easing plugin
                        easing: 'easeInOutBack'
                    });
        		}else{
        			if(!(pattern.test($("#mobilephone").val()))){
                        $("#mobilephone_yz").html("请正确输入手机号码").show();
                    }else{
                        $("#mobilephone_yz").hide();
                 }	
        		}
        });

    });

</script>
<link rel="stylesheet" href="/css/combo.select.css">
<script src="/js/jquery.combo.select.js" ></script>
<script>
    $(function(){
        $("#dwszd").comboSelect();
    });
</script>
</html>
