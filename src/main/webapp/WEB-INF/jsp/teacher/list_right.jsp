<%--
  Created by IntelliJ IDEA.
  User: xuning
  Date: 2017/11/19
  Time: 20:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

    <div class="detail-box" data-ksh=""><div class="detail-box-content">
        <h3>
            <div class="value"><span class="xm " title="">${student.xm}</span> <small><span class="ksh " title="">(${student.ksh})</span><span data-xbdm="1" class="xb ">${student.xb.xb}</span> | <span class="xl">${student.xl.xl}</span> | <span>${student.yx.yxmc}</span></small></div>
            <input type="hidden" id="ksh" value="${student.ksh}"/>
            <input type="hidden" id="bysj" value="${student.bysj}"/>
            <input type="hidden" id="date" value="${date}"/>
            <input type="hidden" id="sfzh" value="${student.sfzh}"/>
        </h3>
        <ul class="nav nav-tabs" role="tablist">
            <li role="presentation" class="active"><a href="#sdc-jbxx" role="tab" data-toggle="tab"> 基本信息 </a></li>
            <li role="presentation" class=""><a href="#sdc-byqx" role="tab" data-toggle="tab"> 毕业去向 </a></li>
            <li role="presentation"><a href="#sdc-lxfs" role="tab" data-toggle="tab"> 联系方式 </a></li>
        </ul>
        <div class="tab-content">
            <div role="tabpanel" class="tab-pane active" id="sdc-jbxx">
                <table class="table table-condensed" style="margin-bottom:0px;">
                    <colgroup><col width="15%"><col width="40%"><col width="15%"><col width="30%"></colgroup>
                    <tbody><tr>
                        <th title="">身份证号</th>
                        <td>
                            <div class="value"><span data-key="sfzh"> ${student.sfzh}</span></div>

                        </td>
                        <th>出生日期</th><td>${student.csrq}</td></tr>
                    <tr>
                        <th>政治面貌</th>
                        <td>
                            <div class="value"><span data-key="zzmmdm">${student.zzmm.zzmmdm}</span>${student.zzmm.zzmm}</div>

                        </td>
                        <th>学号</th><td>${student.xh}</td></tr>
                    <tr><th>所在院系</th><td><span class="value">${student.szyx}</span></td><th>班级</th><td><span class="value">${student.szbj}</span></td></tr>
                    <tr>
                        <th>生源地</th>
                        <td>
                            <div class="value"><span data-key="syszddm">${student.syszd.syszd}</span></div>

                        </td>
                        <th>民族</th>
                        <td>
                            <div class="value"><span data-key="mzdm">${student.mz.mzdm}${student.mz.mz}</span></div>

                        </td>
                    </tr>
                    <tr>
                        <th>就读时间</th>
                        <td>
                            <div class="value">
                                <span class="rxsj " data-key="rxsj" title="">${student.rxsj} -</span>
                                <span class="bysj " data-key="bysj" title="">${student.bysj}</span>
                            </div>

                        </td>
                        <th>学制</th>
                        <td>
                            <div class="value"><span class="xz" data-key="xz">${student.xz}</span>年</div>

                        </td>
                    </tr>
                    <tr>
                        <th>专业代码</th>
                        <td colspan="3">
                            <div class="value">
                                <span data-key="zydm" class="zydm " title="软件技术">${student.zy.zydm} ${student.zy.zy}</span>
                                <span data-key="zyfx" class="zyfx " title="">${student.zyfx}</span>
                            </div>

                        </td>
                    </tr>
                    <tr>
                        <th>困难生类别</th>
                        <td>
                            <div class="value">
                                <span class="knslb">${student.knslb.knslb}</span>
                            </div>

                        </td>
                        <th>师范生类别</th>
                        <td>
                            <div class="value">
                                <span class="sfslb">${student.sfslb.sfslb}</span>
                            </div>
                        </td>
                    </tr>
                    </tbody></table>
                <table class="table">
                    <tbody><tr>
                        <th>培养方式</th>
                        <td colspan="3">
                            <div class="value">
                                <span class="pyfs">${student.pyfs.pyfs}</span>
                            </div>

                        </td>
                    </tr>
                    <tr>
                        <th>定向/委培单位</th>
                        <td colspan="3">
                            <div class="value"><span class="dxhwpdw" data-key="dxhwpdw"> ${student.dxhwpdw}</span></div>

                        </td>
                    </tr>
                    <tr>
                        <th style="width:10em;">档案是否转入学校</th>
                        <td> <div class="value"><span class="daisinschool" data-key="daisinschool"> ${student.dasfzrxx}</span></div> </td>
                        <th style="width:10em;">户口是否转入学校</th>
                        <td><div class="value"><span class="hkisinschool" data-key="hkisinschool"> ${student.hksfzrxx}</span></div>  </td>
                    </tr>
                    <tr><th style="width:12em;">就业协议书号</th><td>${student.rxqdaszdw}</td><th style="width:13em;">入学前户口所在地派出所</th><td>${student.rxqhkszdpcs}</td></tr>
                    </tbody></table>
            </div>
            <div role="tabpanel" class="tab-pane " id="sdc-lxfs">
                <a id="lxfs_click" href="#" title="点击修改" style="line-height:38px;" class="lxfs-update label label-info">点击修改</a>
                <table class="table" >
                    <tbody><tr>
                        <th>手机号码：</th>
                        <td>
                            <span class="value" id="span-mobilephone">${student.mobilephone}</span>
                            <span class="edit" style="display:none;"><input id="mobilePhone"  class="form-control" data-class="contactInfo.mobilePhone" value="${student.mobilephone}" type="text"></span>
                        </td>
                        <th>电子邮箱：</th>
                        <td>
                            <span class="value" id="span-email">${student.email}</span>
                            <span class="edit" style="display:none;"><input id="email" class="form-control" data-class="contactInfo.email" value="${student.email}" type="text"></span>
                        </td>
                    </tr>
                    <tr>
                        <th>家长姓名：</th>
                        <td>
                            <span class="value" id="span-qq">${student.qq}</span>
                            <span class="edit" style="display:none;"><input id="qq" class="form-control" data-class="contactInfo.qq" value="${student.qq}" type="text"></span>
                        </td>
                        <th>家庭地址：</th>
                        <td>
                            <span class="value" id="span-jtdz">${student.jtdz}</span>
                            <span class="edit" style="display:none;"><input id="jtdz" class="form-control" data-class="contactInfo.jtdz" value="${student.jtdz}" type="text"></span>
                        </td>
                    </tr>
                    <tr>
                        <th>家庭电话：</th>
                        <td>
                            <span class="value" id="span-jtdh">${student.jtdh}</span>
                            <span class="edit" style="display:none;"><input id="jtdh" class="form-control" data-class="contactInfo.jtdh" value="${student.jtdh}" type="text"></span>
                        </td>
                        <th>家庭邮编：</th>
                        <td>
                            <span class="value" id="span-jtyb">${student.jtyb}</span>
                            <span class="edit" style="display: none"><input id="jtyb" class="form-control" data-class="contactInfo.jtyb" value="${student.jtyb}" type="text"></span>
                        </td>
                    </tr>
                    </tbody></table>
                <span class="lxfs-btn" style="display:none;">
                    <button style="margin-left:10px;" class="btn btn-info" id="lxfs-qd">确定</button>
                    <button style="margin-left:10px;" class="btn btn-link" id="lxfs-qx">取消</button>
                </span>
            </div>

            <script>

                $(function () {
                    $("#lxfs_click").click(function () {
                        $("#lxfs_click").hide();
                        $("#sdc-lxfs").find("span[class='value']").hide();
                        $("#sdc-lxfs").find("span[class='edit']").show();
                        $("#sdc-lxfs").find("span[class='lxfs-btn']").show();
                    });
                    $("#lxfs-qd").click(function () {
                        var mobilePhone = $("#mobilePhone").val();
                        var email = $("#email").val();
                        var qq = $("#qq").val();
                        var jtdz = $("#jtdz").val();
                        var jtdh = $("#jtdh").val();
                        var jtyb = $("#jtyb").val();
                        //------
                        var ksh = $("#ksh").val();
                        var sfzh = $("#sfzh").val();
                        var date = $("#date").val();
                        var bysj = $("#bysj").val();
                        $.ajax({
                        		url:'/student/'+date+'/update',
                        		data:{
	                            "ksh":ksh,
	                            "sfzh":sfzh,
	                            "mobilePhone":mobilePhone,
	                            "bysj":bysj,
	                            "email":email,
	                            "qq":qq,
	                            "jtdz":jtdz,
	                            "jtdh":jtdh,
	                            "jtyb":jtyb
                        		},
                        		dataType:"json",
                        		type:"post",
                        		success:function(date){
                        				if(date){
		                                $("#span-mobilephone").html(mobilePhone);
		                                $("#span-email").html(email);
		                                $("#span-qq").html(qq);
		                                $("#span-jtdz").html(jtdz);
		                                $("#span-jtdh").html(jtdh);
		                                $("#span-jtyb").html(jtyb);
		                                $("#sdc-lxfs").find("span[class='value']").show();
		                                $("#sdc-lxfs").find("span[class='edit']").hide();
		                                $("#sdc-lxfs").find("span[class='lxfs-btn']").hide();
		                                $("#lxfs_click").show();
		                            }else {
		                                alert("修改失败");
		                            }
                        		},error:function(e){
                        				$("#span-mobilephone").html(mobilePhone);
		                                $("#span-email").html(email);
		                                $("#span-qq").html(qq);
		                                $("#span-jtdz").html(jtdz);
		                                $("#span-jtdh").html(jtdh);
		                                $("#span-jtyb").html(jtyb);
		                                $("#sdc-lxfs").find("span[class='value']").show();
		                                $("#sdc-lxfs").find("span[class='edit']").hide();
		                                $("#sdc-lxfs").find("span[class='lxfs-btn']").hide();
		                                $("#lxfs_click").show();
                        		}
                        });


                    });
                    $("#lxfs-qx").click(function () {
                        $("#lxfs_click").show();
                        $("#sdc-lxfs").find("span[class='value']").show();
                        $("#sdc-lxfs").find("span[class='edit']").hide();
                        $("#sdc-lxfs").find("span[class='lxfs-btn']").hide();
                    });
                });

            </script>

            <div role="tabpanel" class="tab-pane " id="sdc-byqx">
                <a  href="#" title="点击修改" id="byqx-click" style="line-height:38px;" class="byqx-update label label-info">点击修改</a>
                <table class="table table-condensed emp-table" style="margin-bottom:0px;">
                    <colgroup>
                        <col width="25%"><col width="25%"><col width="25%"><col width="25%">
                    </colgroup>
                    <tbody><tr>
                        <th>毕业去向</th>
                        <td>
                            <span class="value" id="span-byqx">${student.byqx.byqx}</span>
                            <span class="edit" style="display:none;">
                                <select id="byqx" class="form-control">
                                    <option value="">${student.byqx.byqx}</option>
                                </select>
                            </span>
                        </td>
                        <th>单位名称</th>
                        <td>
                            <span class="value" id="span-dwmc">${student.dwmc}</span>
                            <span class="edit" style="display:none;">
                                <input id="dwmc" class="form-control" type="text" value="${student.dwmc}"/>
                            </span>
                        </td>
                    </tr>
                    <tr>
                        <th>组织机构代码/工商营业执照</th>
                        <td>
                            <span class="value" id="span-dwzzjgdm">${student.dwzzjgdm}</span>
                            <span class="edit" style="display:none;">
                                <input class="form-control" id="dwzzjgdm" type="text" value="${student.dwzzjgdm}">
                            </span>
                        </td>
                        <th>单位性质</th>
                        <td>
                            <span class="value" id="span-dwxz">${student.dwxz.dwxz}</span>
                            <span class="edit" style="display:none;">
                                <select class="form-control" id="dwxz">
                                    <option value="">${student.dwxz.dwxz}</option>
                                </select>
                            </span>
                        </td>
                    </tr>
                    <tr>
                        <th>单位行业</th>
                        <td>
                            <span class="value" id="span-dwhy">${student.dwhy.dwhy}</span>
                            <span class="edit" style="display:none;">
                                <select class="form-control" id="dwhy">
                                    <option value="">${student.dwhy.dwhy}</option>
                                </select>
                            </span>
                        </td>
                        <th>单位所在地</th>
                        <td>
                            <span class="value" id="span-dwszd">${student.dwszd.dwszd}</span>
                            <span class="edit" style="display:none;">
                                <select class="form-control " id="dwszd">
                                    <option value="">${student.dwszd.dwszd}</option>
                                </select>
                            </span>
                        </td>
                    </tr>
                    <tr>
                        <th>工作职位类别</th>
                        <td>
                            <span class="value" id="span-gzzwlb">${student.gzzwlb.gzzwlb}</span>
                            <span class="edit" style="display:none;">
                                <select class="form-control " id="gzzwlb">
                                    <option value="">${student.gzzwlb.gzzwlb}</option>
                                </select>
                            </span>
                        </td>
                        <th>单位联系人</th>
                        <td>
                            <span class="value" id="span-dwlxr">${student.dwlxr}</span>
                            <span class="edit" style="display:none;">
                                <input class="form-control" id="dwlxr" type="text" value="${student.dwlxr}">
                            </span>
                        </td>
                    </tr>
                    <tr>
                        <th>联系人电话</th>
                        <td>
                            <span class="value" id="span-lxrdh">${student.lxrdh}</span>
                            <span class="edit" style="display:none;">
                                <input id="lxrdh" class="form-control" type="text" value="${student.lxrdh}">
                            </span>
                        </td>
                        <th>联系人手机</th>
                        <td>
                            <span class="value" id="span-lxrsj">${student.lxrsj}</span>
                            <span class="edit" style="display:none;">
                                <input id="lxrsj" class="form-control" type="text" value="${student.lxrsj}">
                            </span>
                        </td>
                    </tr>
                    <tr>
                        <th>联系人email</th>
                        <td>
                            <span class="value" id="span-lxrdzyx">${student.lxrdzyx}</span>
                            <span class="edit" style="display:none;">
                                <input id="lxrdzyx" class="form-control" type="text" value="${student.lxrdzyx}">
                            </span>
                        </td>
                        <th>联系人传真</th>
                        <td>
                            <span class="value" id="span-lxrcz">${student.lxrcz}</span>
                            <span class="edit" style="display:none;">
                                <input id="lxrcz" class="form-control" type="text" value="${student.lxrcz}">
                            </span>
                        </td>
                    </tr>
                    <tr>
                        <th>单位地址</th>
                        <td>
                            <span class="value" id="span-dwdz">${student.dwdz}</span>
                            <span class="edit" style="display:none;">
                                <input id="dwdz" class="form-control" type="text" value="${student.dwdz}">
                            </span>
                        </td>
                        <th>单位邮编</th>
                        <td>
                            <span class="value" id="span-dwyb">${student.dwyb}</span>
                            <span class="edit" style="display:none;">
                                <input id="dwyb" class="form-control" type="text" value="${student.dwyb}">
                            </span>
                        </td>
                    </tr>
                    </tbody></table>
                <table class="table table-condensed dis-table">
                    <colgroup>
                        <col width="25%"><col width="25%"><col width="25%"><col width="25%">
                    </colgroup>
                    <tbody><tr>
                        <th>报到证签发类别</th>
                        <td>
                            <span class="value" id="span-bdzqflb">${student.bdzqflb.bdzqflb}</span>
                            <span class="edit" style="display:none;">
                                <select class="form-control" id="bdzqflb">
                                    <option value="">${student.bdzqflb.bdzqflb}</option>
                                </select>
                            </span>
                        </td>
                        <th>报到证签往单位名称</th>
                        <td>
                            <span class="value" id="span-bdzqwdwmc">${student.bdzqwdwmc}</span>
                            <span class="edit" style="display:none;">
                                <input id="bdzqwdwmc" class="form-control" type="text" value="${student.bdzqwdwmc}">
                            </span>
                        </td>
                    </tr>
                    <tr>
                        <th>签往单位所在地</th>
                        <td>
                            <span class="value" id="span-qwdwszd">${student.qwdwszd.qwdwszd}</span>
                            <span class="edit" style="display:none;">
                                <select class="form-control" id="qwdwszd">
                                    <option value="">${student.qwdwszd.qwdwszd}</option>
                                </select>
                            </span>
                        </td>
                        <th>档案转寄单位名称</th>
                        <td>
                            <span class="value" id="span-dazjdwmc">${student.dazjdwmc}</span>
                            <span class="edit" style="display:none;">
                                <input id="dazjdwmc" class="form-control" type="text" value="${student.dazjdwmc}">
                            </span>
                        </td>
                    </tr>
                    <tr>
                        <th>档案转寄单位邮编</th>
                        <td>
                            <span class="value" id="span-dazjdwyb">${student.dazjdwyb}</span>
                            <span class="edit" style="display:none;">
                                <input id="dazjdwyb" class="form-control" type="text" value="${student.dazjdwyb}">
                            </span>
                        </td>
                        <th>档案转寄单位地址</th>
                        <td>
                            <span class="value" id="span-dazjdwdz">${student.dazjdwdz}</span>
                            <span class="edit" style="display:none;">
                                <input id="dazjdwdz" class="form-control" type="text" value="${student.dazjdwdz}">
                            </span>
                        </td>
                    </tr>
                    <tr>
                        <th>户口迁转地址</th>
                        <td>
                            <span class="value" id="span-hkqzdz">${student.hkqzdz}</span>
                            <span class="edit" style="display:none;">
                                <input id="hkqzdz" class="form-control" type="text" value="${student.hkqzdz}">
                            </span>
                        </td>
                        <th></th>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <th>报到证起始时间</th>
                        <td>
                            <span class="value" id="span-bdqssj">${student.bdqssj}</span>
                            <span class="edit" style="display:none;">
                                <input id="bdqssj" class="form-control" type="text" value="${student.bdqssj}">
                            </span>
                        </td>
                        <th>报到证编号</th>
                        <td>
                            <span class="value" id="span-bdzbh">${student.bdzbh}</span>
                            <span class="edit" style="display:none;">
                                <input id="bdzbh" class="form-control" type="text" value="${student.bdzbh}">
                            </span>
                        </td>
                    </tr>

                    </tbody></table>
                <span class="byqx-btn" style="display:none;">
                    <button style="margin-left:10px;" class="btn btn-info" id="byqx-qd">确定</button>
                    <button style="margin-left:10px;" class="btn btn-link" id="byqx-qx">取消</button>
                </span>
            </div>
            
            <script>
                
                $(function () {
                    
                    $("#byqx-click").click(function () {
                        $("#sdc-byqx").find("span[class='byqx-btn']").show();
                        $("#byqx-click").hide();
                        $("#sdc-byqx").find("span[class='value']").hide();
                        $("#sdc-byqx").find("span[class='edit']").show();
                        var date = $("#date").val();
                        //发送ajax 
                        $.post("/byqx/"+date+"/get",{},function (result) {
                            $.each(result, function(i, obj) {
                                $("#byqx").append("<option value='"+obj.byqxdm+"'>"+obj.byqx+"</option>");
                            });
                        });
                        $.post("/dwxz/"+date+"/get",{},function (result) {
                            $.each(result, function(i, obj) {
                                $("#dwxz").append("<option value='"+obj.dwxzdm+"'>"+obj.dwxz+"</option>");
                            });
                        });
                        $.post("/dwhy/"+date+"/get",{},function (result) {
                            $.each(result, function(i, obj) {
                                $("#dwhy").append("<option value='"+obj.dwhydm+"'>"+obj.dwhy+"</option>");
                            });
                        });
                        $.post("/dwszd/"+date+"/get",{},function (result) {
                            $.each(result, function(i, obj) {
                                $("#dwszd").append("<option value='"+obj.dwszddm+"'>"+obj.dwszd+"</option>");
                            });
                        });
                        $.post("/gzzwlb/"+date+"/get",{},function (result) {
                            $.each(result, function(i, obj) {
                                $("#gzzwlb").append("<option value='"+obj.gzzwlbdm+"'>"+obj.gzzwlb+"</option>");
                            });
                        });
                        $.post("/bdzqflb/"+date+"/get",{},function (result) {
                            $.each(result, function(i, obj) {
                                $("#bdzqflb").append("<option value='"+obj.bdzqflbdm+"'>"+obj.bdzqflb+"</option>");
                            });
                        });
                        $.post("/qwdwszd/"+date+"/get",{},function (result) {
                            $.each(result, function(i, obj) {
                                $("#qwdwszd").append("<option value='"+obj.qwdwszddm+"'>"+obj.qwdwszd+"</option>");
                            });
                        });

                    });
                    $("#byqx-qd").click(function () {
                        if($("#byqx").val() == ""){
                            var byqxdm=null;
                        }else {
                            var byqxdm=$("#byqx").val();
                        }
                        var dwmc = $("#dwmc").val();
                        var dwzzjgdm = $("#dwzzjgdm").val();
                        if($("#dwxz").val() == ""){
                            var dwxzdm=null;
                        }else {
                            var dwxzdm=$("#dwxz").val();
                        }
                        if($("#dwhy").val() == ""){
                            var dwhydm=null;
                        }else {
                            var dwhydm=$("#dwhy").val();
                        }
                        if($("#dwszd").val() == ""){
                            var dwszddm=null;
                        }else {
                            var dwszddm=$("#dwszd").val();
                        }
                        if($("#gzzwlb").val() == ""){
                            var gzzwlbdm=null;
                        }else {
                            var gzzwlbdm=$("#gzzwlb").val();
                        }
                        var dwlxr = $("#dwlxr").val();
                        var lxrdh = $("#lxrdh").val();
                        var lxrsj = $("#lxrsj").val();
                        var lxrdzyx = $("#lxrdzyx").val();
                        var lxrcz = $("#lxrcz").val();
                        var dwdz = $("#dwdz").val();
                        var dwyb = $("#dwyb").val();
                        if($("#bdzqflb").val() == ""){
                            var bdzqflbdm=null;
                        }else {
                            var bdzqflbdm=$("#bdzqflb").val();
                        }
                        var bdzqwdwmc = $("#bdzqwdwmc").val();
                        if($("#qwdwszd").val() == ""){
                            var qwdwszddm=null;
                        }else {
                            var qwdwszddm=$("#qwdwszd").val();
                        }
                        var dazjdwmc = $("#dazjdwmc").val();
                        var dazjdwyb = $("#dazjdwyb").val();
                        var dazjdwdz = $("#dazjdwdz").val();
                        var hkqzdz = $("#hkqzdz").val();
                        var bdqssj = $("#bdqssj").val();
                        var bdzbh = $("#bdzbh").val();
                        //----
                        var bysj = $("#bysj").val();
                        var ksh = $("#ksh").val();
                        var sfzh = $("#sfzh").val();
                        var date = $("#date").val();

                        $.ajax({
                            type:"post",
                            url:"/student/"+date+ "/update",
							async: false,
                            data: {
                                "byqxdm":byqxdm,"dwmc":dwmc,"dwzzjgdm":dwzzjgdm,"dwxzdm":dwxzdm,"dwhydm":dwhydm,"dwszddm":dwszddm,"gzzwlbdm":gzzwlbdm,"bysj":bysj,"ksh":ksh,
                                "dwlxr":dwlxr,"lxrdh":lxrdh,"lxrsj":lxrsj,"lxrdzyx":lxrdzyx,"lxrcz":lxrcz,"dwdz":dwdz,"dwyb":dwyb,"bdzqflbdm":bdzqflbdm,"sfzh":sfzh,
                                "bdzqwdwmc":bdzqwdwmc,"qwdwszddm":qwdwszddm,"dazjdwmc":dazjdwmc,"dazjdwyb":dazjdwyb,"dazjdwdz":dazjdwdz,"hkqzdz":hkqzdz,"bdqssj":bdqssj,"bdzbh":bdzbh
                            },
                            dataType: "json",
                            success: function(result){
                                if(result){
                                    $("#sdc-byqx").find("span[class='byqx-btn']").hide();
                                    $("#byqx-click").show();
                                    $("#sdc-byqx").find("span[class='value']").show();
                                    $("#sdc-byqx").find("span[class='edit']").hide();

                                    var opt_byqx=$("#byqx").find("option:selected").text();
                                    $("#span-byqx").html(opt_byqx);
                                    $("#span-dwmc").html(dwmc);
                                    $("#span-dwzzjgdm").html(dwzzjgdm);
                                    var opt_dwxz=$("#dwxz").find("option:selected").text();
                                    $("#span-dwxz").html(opt_dwxz);
                                    var opt_dwhy=$("#dwhy").find("option:selected").text();
                                    $("#span-dwhy").html(opt_dwhy);
                                    var opt_dwszd=$("#dwszd").find("option:selected").text();
                                    $("#span-dwszd").html(opt_dwszd);
                                    var opt_gzzwlb=$("#gzzwlb").find("option:selected").text();
                                    $("#span-gzzwlb").html(opt_gzzwlb);
                                    $("#span-dwlxr").html(dwlxr);
                                    $("#span-lxrdh").html(lxrdh);
                                    $("#span-lxrsj").html(lxrsj);
                                    $("#span-lxrdzyx").html(lxrdzyx);
                                    $("#span-lxrcz").html(lxrcz);
                                    $("#span-dwdz").html(dwdz);
                                    $("#span-dwyb").html(dwyb);
                                    var opt_bdzqflb=$("#bdzqflb").find("option:selected").text();
                                    $("#span-bdzqflb").html(opt_bdzqflb);
                                    $("#span-bdzqwdwmc").html(bdzqwdwmc);
                                    var opt_qwdwszd=$("#qwdwszd").find("option:selected").text();
                                    $("#span-qwdwszd").html(opt_qwdwszd);
                                    $("#span-dazjdwmc").html(dazjdwmc);
                                    $("#span-dazjdwyb").html(dazjdwyb);
                                    $("#span-dazjdwdz").html(dazjdwdz);
                                    $("#span-hkqzdz").html(hkqzdz);
                                    $("#span-bdqssj").html(bdqssj);
                                    $("#span-bdzbh").html(bdzbh);

                                    //点击之后清除下拉菜单 option:not(:first)
                                    $("#byqx option:not(:first)").remove();
                                    $("#dwxz option:not(:first)").remove();
                                    $("#dwhy option:not(:first)").remove();
                                    $("#dwszd option:not(:first)").remove();
                                    $("#gzzwlb option:not(:first)").remove();
                                    $("#bdzqflb option:not(:first)").remove();
                                    $("#qwdwszd option:not(:first)").remove();
                                }else{
                                    alert("修改失败");
                                }
                            },error: function(e) {
                                $("#sdc-byqx").find("span[class='byqx-btn']").hide();
                                    $("#byqx-click").show();
                                    $("#sdc-byqx").find("span[class='value']").show();
                                    $("#sdc-byqx").find("span[class='edit']").hide();

                                    var opt_byqx=$("#byqx").find("option:selected").text();
                                    $("#span-byqx").html(opt_byqx);
                                    $("#span-dwmc").html(dwmc);
                                    $("#span-dwzzjgdm").html(dwzzjgdm);
                                    var opt_dwxz=$("#dwxz").find("option:selected").text();
                                    $("#span-dwxz").html(opt_dwxz);
                                    var opt_dwhy=$("#dwhy").find("option:selected").text();
                                    $("#span-dwhy").html(opt_dwhy);
                                    var opt_dwszd=$("#dwszd").find("option:selected").text();
                                    $("#span-dwszd").html(opt_dwszd);
                                    var opt_gzzwlb=$("#gzzwlb").find("option:selected").text();
                                    $("#span-gzzwlb").html(opt_gzzwlb);
                                    $("#span-dwlxr").html(dwlxr);
                                    $("#span-lxrdh").html(lxrdh);
                                    $("#span-lxrsj").html(lxrsj);
                                    $("#span-lxrdzyx").html(lxrdzyx);
                                    $("#span-lxrcz").html(lxrcz);
                                    $("#span-dwdz").html(dwdz);
                                    $("#span-dwyb").html(dwyb);
                                    var opt_bdzqflb=$("#bdzqflb").find("option:selected").text();
                                    $("#span-bdzqflb").html(opt_bdzqflb);
                                    $("#span-bdzqwdwmc").html(bdzqwdwmc);
                                    var opt_qwdwszd=$("#qwdwszd").find("option:selected").text();
                                    $("#span-qwdwszd").html(opt_qwdwszd);
                                    $("#span-dazjdwmc").html(dazjdwmc);
                                    $("#span-dazjdwyb").html(dazjdwyb);
                                    $("#span-dazjdwdz").html(dazjdwdz);
                                    $("#span-hkqzdz").html(hkqzdz);
                                    $("#span-bdqssj").html(bdqssj);
                                    $("#span-bdzbh").html(bdzbh);

                                    //点击之后清除下拉菜单 option:not(:first)
                                    $("#byqx option:not(:first)").remove();
                                    $("#dwxz option:not(:first)").remove();
                                    $("#dwhy option:not(:first)").remove();
                                    $("#dwszd option:not(:first)").remove();
                                    $("#gzzwlb option:not(:first)").remove();
                                    $("#bdzqflb option:not(:first)").remove();
                                    $("#qwdwszd option:not(:first)").remove();
                            }
                        });
//                        $.post("/student/"+date+"/update",{
//                            "ksh":ksh,"bysj":bysj,"sfzh":sfzh,"byqxdm":byqxdm
//                        },function (result) {
//                            alert(result);
//                        });
//                        $.post("/student/"+date+"/update",{
//
// },function (result) {
//                            alert(result);

//                            if(byqxdm != null){
//                                var opt_byqx=$("#byqx").find("option:selected").text();
//                                $("#span-byqx").html(opt_byqx);
//                            }
//                            if(dwzzjgdm != null){
//
//                            }
//
//
//
//                        });
                    });
                        
                        

                    $("#byqx-qx").click(function () {
                        $("#sdc-byqx").find("span[class='byqx-btn']").hide();
                        $("#byqx-click").show();
                        $("#sdc-byqx").find("span[class='value']").show();
                        $("#sdc-byqx").find("span[class='edit']").hide();
                        //点击之后清除下拉菜单
                        $("#byqx option:not(:first)").remove();
                        $("#dwxz option:not(:first)").remove();
                        $("#dwhy option:not(:first)").remove();
                        $("#dwszd option:not(:first)").remove();
                        $("#gzzwlb option:not(:first)").remove();
                        $("#bdzqflb option:not(:first)").remove();
                        $("#qwdwszd option:not(:first)").remove();
                    });
                    
                });
                
            </script>


    </div>
</div>
    </div>
</body>
</html>
