$(function () {
    var id = $("#id").val();
    $("#xm_btn").click(function () {
        $(this).hide();
        $("#xm_btn").parent().next().show();
        $("#xm_btn").parent().parent().prev().children("div .value-wrap").hide();
        $("#xm_btn").parent().parent().prev().children("div .edit-wrap").show();
    });
    $("#xm_qd_btn").click(function () {
        var xm = $("#xm_btn").parent().parent().prev().children("div .edit-wrap").find("input").val();
        $.post("/teacher/update",{"name":xm,"id":id},function (date) {
            if(date>0){
                $("#xm_btn").show();
                $("#xm_btn").parent().next().hide();
                $("#xm_btn").parent().parent().prev().children("div .value-wrap").html(xm);
                $("#xm").attr("value",xm);
                $("#xm_btn").parent().parent().prev().children("div .value-wrap").show();
                $("#xm_btn").parent().parent().prev().children("div .edit-wrap").hide();
            }else {
                alert("修改失败");
            }
        });
    });
    $("#xm_qx_btn").click(function () {
        $("#xm_btn").show();
        $("#xm_btn").parent().next().hide();
        $("#xm_btn").parent().parent().prev().children("div .value-wrap").show();
        $("#xm_btn").parent().parent().prev().children("div .edit-wrap").hide();
    });
    //-----------------------------------
    $("#zw_btn").click(function () {
        $(this).hide();
        $("#zw_btn").parent().next().show();
        $("#zw_btn").parent().parent().prev().children("div .value-wrap").hide();
        $("#zw_btn").parent().parent().prev().children("div .edit-wrap").show();
    });
    $("#zw_qd_btn").click(function () {
        var zw = $("#zw_btn").parent().parent().prev().children("div .edit-wrap").find("input").val();
        $.post("/teacher/update",{"zhiwu":zw,"id":id},function (date) {
            if(date>0){
                $("#zw_btn").show();
                $("#zw_btn").parent().next().hide();
                $("#zw_btn").parent().parent().prev().children("div .value-wrap").html(zw);
                $("#zw").attr("value",zw);
                $("#zw_btn").parent().parent().prev().children("div .value-wrap").show();
                $("#zw_btn").parent().parent().prev().children("div .edit-wrap").hide();
            }else {
                alert("修改失败");
            }
        });
    });
    $("#zw_qx_btn").click(function () {
        $("#zw_btn").show();
        $("#zw_btn").parent().next().hide();
        $("#zw_btn").parent().parent().prev().children("div .value-wrap").show();
        $("#zw_btn").parent().parent().prev().children("div .edit-wrap").hide();
    });
    //-----------------------------------
    $("#dh_btn").click(function () {
        $(this).hide();
        $("#dh_btn").parent().next().show();
        $("#dh_btn").parent().parent().prev().children("div .value-wrap").hide();
        $("#dh_btn").parent().parent().prev().children("div .edit-wrap").show();
    });
    $("#dh_qd_btn").click(function () {
        var dh = $("#dh_btn").parent().parent().prev().children("div .edit-wrap").find("input").val();
        $.post("/teacher/update",{"tel":dh,"id":id},function (date) {
            if(date>0){
                $("#dh_btn").show();
                $("#dh_btn").parent().next().hide();
                $("#dh_btn").parent().parent().prev().children("div .value-wrap").html(dh);
                $("#dh").attr("value",dh);
                $("#dh_btn").parent().parent().prev().children("div .value-wrap").show();
                $("#dh_btn").parent().parent().prev().children("div .edit-wrap").hide();
            }else {
                alert("修改失败");
            }
        });
    });
    $("#dh_qx_btn").click(function () {
        $("#dh_btn").show();
        $("#dh_btn").parent().next().hide();
        $("#dh_btn").parent().parent().prev().children("div .value-wrap").show();
        $("#dh_btn").parent().parent().prev().children("div .edit-wrap").hide();
    });
    //-----------------------------------
    $("#cz_btn").click(function () {
        $(this).hide();
        $("#cz_btn").parent().next().show();
        $("#cz_btn").parent().parent().prev().children("div .value-wrap").hide();
        $("#cz_btn").parent().parent().prev().children("div .edit-wrap").show();
    });
    $("#cz_qd_btn").click(function () {
        var cz = $("#cz_btn").parent().parent().prev().children("div .edit-wrap").find("input").val();
        $.post("/teacher/update",{"fax":cz,"id":id},function (date) {
            if(date>0){
                $("#cz_btn").show();
                $("#cz_btn").parent().next().hide();
                $("#cz_btn").parent().parent().prev().children("div .value-wrap").html(cz);
                $("#cz").attr("value",cz);
                $("#cz_btn").parent().parent().prev().children("div .value-wrap").show();
                $("#cz_btn").parent().parent().prev().children("div .edit-wrap").hide();
            }else {
                alert("修改失败");
            }
        });
    });
    $("#cz_qx_btn").click(function () {
        $("#cz_btn").show();
        $("#cz_btn").parent().next().hide();
        $("#cz_btn").parent().parent().prev().children("div .value-wrap").show();
        $("#cz_btn").parent().parent().prev().children("div .edit-wrap").hide();
    });
    //-----------------------------------
    $("#email_btn").click(function () {
        $(this).hide();
        $("#email_btn").parent().next().show();
        $("#email_btn").parent().parent().prev().children("div .value-wrap").hide();
        $("#email_btn").parent().parent().prev().children("div .edit-wrap").show();
    });
    $("#email_qd_btn").click(function () {
        var email = $("#email_btn").parent().parent().prev().children("div .edit-wrap").find("input").val();
        $.post("/teacher/update",{"email":email,"id":id},function (date) {
            if(date>0){
                $("#email_btn").show();
                $("#email_btn").parent().next().hide();
                $("#email_btn").parent().parent().prev().children("div .value-wrap").html(email);
                $("#email").attr("value",email);
                $("#email_btn").parent().parent().prev().children("div .value-wrap").show();
                $("#email_btn").parent().parent().prev().children("div .edit-wrap").hide();
            }else {
                alert("修改失败");
            }
        });
    });
    $("#email_qx_btn").click(function () {
        $("#email_btn").show();
        $("#email_btn").parent().next().hide();
        $("#email_btn").parent().parent().prev().children("div .value-wrap").show();
        $("#email_btn").parent().parent().prev().children("div .edit-wrap").hide();
    });
    //-----------------------------------
    $("#qq_btn").click(function () {
        $(this).hide();
        $("#qq_btn").parent().next().show();
        $("#qq_btn").parent().parent().prev().children("div .value-wrap").hide();
        $("#qq_btn").parent().parent().prev().children("div .edit-wrap").show();
    });
    $("#qq_qd_btn").click(function () {
        var qq = $("#qq_btn").parent().parent().prev().children("div .edit-wrap").find("input").val();
        $.post("/teacher/update",{"qq":qq,"id":id},function (date) {
            if(date>0){
                $("#qq_btn").show();
                $("#qq_btn").parent().next().hide();
                $("#qq_btn").parent().parent().prev().children("div .value-wrap").html(qq);
                $("#qq").attr("value",qq);
                $("#qq_btn").parent().parent().prev().children("div .value-wrap").show();
                $("#qq_btn").parent().parent().prev().children("div .edit-wrap").hide();
            }else {
                alert("修改失败");
            }
        });
    });
    $("#qq_qx_btn").click(function () {
        $("#qq_btn").show();
        $("#qq_btn").parent().next().hide();
        $("#qq_btn").parent().parent().prev().children("div .value-wrap").show();
        $("#qq_btn").parent().parent().prev().children("div .edit-wrap").hide();
    });



});