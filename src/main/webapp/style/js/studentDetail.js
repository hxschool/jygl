/**
 * 
 * @returns
 */
$(function(){
	$(document).ajaxStop($.unblockUI);
    $("#btnJYXX").click(function(){
    	
    		$("#btnJYXX").hide();
		$("#btnSubmit").show();
		$("#btnRes").show();
    	
    		//hide
        $("#byqxDetail").hide();
        $("#dwxzDetail").hide();
        $("#dwhyDetail").hide();
        $("#dwszdDetail").hide();
        $("#gzzwDetail").hide();
        
        //非下拉
        $("#dwmcUpdate").show();
        $("#dwmcDetail").hide();
        $("#dwzzjgdmUpdate").show();
        $("#dwzzjgdmDetail").hide();
        $("#dwdzUpdate").show();
        $("#dwdzDetail").hide();
        $("#dwlxrUpdate").show();
        $("#dwlxrDetail").hide();
        $("#lxrdhUpdate").show();
        $("#lxrdhDetail").hide();
        $("#lxrsjUpdate").show();
        $("#lxrsjDetail").hide();
        $("#lxrdzyxUpdate").show();
        $("#lxrdzyxDetail").hide();
        $("#lxrczUpdate").show();
        $("#lxrczDetail").hide();
        $("#dwybUpdate").show();
        $("#dwybDetail").hide();
        $("#mobilephoneUpdate").show();
        $("#mobilephoneDetail").hide();
        $("#emailUpdate").show();
        $("#emailDetail").hide();
        $("#qqUpdate").show();
        $("#qqDetail").hide();
        $("#jtdzUpdate").show();
        $("#jtdzDetail").hide();
        $("#jtdhUpdate").show();
        $("#jtdhDetail").hide();
        $("#jtybUpdate").show();
        $("#jtybDetail").hide();
        
        
        
        //remo
        $("#byqxSelectId option").remove();
		$("#byqxSelectId").selectpicker('refresh');
		$("#dwxzSelectId option").remove();
		$("#dwxzSelectId").selectpicker('refresh');
		$("#dwhySelectId option").remove();
		$("#dwhySelectId").selectpicker('refresh');
		$("#gzzwSelectId option").remove();
		$("#gzzwSelectId").selectpicker('refresh');
		
		$.blockUI({
 			message:"<h6>加载中，请稍等...</h6>",
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
        
        //ajax
        $.ajax({
        		url:"/byqx/get",
        		data:{},
        		dataType:"json",
        		type:"post",
        		success:function (result) {
                $.each(result, function(i, obj) {
                    $("#byqxSelectId").append("<option value='"+obj.byqxdm+"'>"+obj.byqx+"</option>");
                    $("#byqxSelectId").selectpicker('refresh');
                });
        		}
        });
        
        $.ajax({
	    		url:"/dwxz/get",
	    		data:{},
	    		dataType:"json",
	    		type:"post",
	    		success:function (result) {
	    			$.each(result, function(i, obj) {
	                  $("#dwxzSelectId").append("<option value='"+obj.dwxzdm+"'>"+obj.dwxz+"</option>");
	                  $("#dwxzSelectId").selectpicker('refresh');
	            });
	    		}
        });
        
        $.ajax({
    		url:"/dwszd/get",
    		data:{},
    		dataType:"json",
    		type:"post",
    		success:function (result) {
    			$.each(result, function(i, obj) {
                  $("#dwszdSelectId").append("<option value='"+obj.dwszddm+"'>"+obj.dwszd+"</option>");
            });
    		}
    });
        
        $.ajax({
	    		url:"/dwhy/get",
	    		data:{},
	    		dataType:"json",
	    		type:"post",
	    		success:function (result) {
	    			$.each(result, function(i, obj) {
	    				$("#dwhySelectId").append("<option value='"+obj.dwhydm+"'>"+obj.dwhy+"</option>");
	    				$("#dwhySelectId").selectpicker('refresh');
	            });
	    		}
	    });
        
        
        $.ajax({
	    		url:"/gzzwlb/get",
	    		data:{},
	    		dataType:"json",
	    		type:"post",
	    		success:function (result) {
	    			$.each(result, function(i, obj) {
	    				$("#gzzwSelectId").append("<option value='"+obj.gzzwlbdm+"'>"+obj.gzzwlb+"</option>");
	    				$("#gzzwSelectId").selectpicker('refresh');
	            });
	    		}
	    });
        
      
        
        
        
        
      
        
        
        //show
        $("#byqxSelect").show();
        $("#dwxzSelect").show();
        $("#dwhySelect").show();
        $("#dwszdSelect").show();
        $("#gzzwSelect").show();
        
        
     });
    
    
    
    
    //返回按钮
    $("#btnRes").click(function(){
    	
    		$("#btnJYXX").show();
    		$("#btnSubmit").hide();
    		$("#btnRes").hide();
    		
    		$("#byqxDetail").show();
        $("#dwxzDetail").show();
        $("#dwhyDetail").show();
        $("#dwszdDetail").show();
        $("#gzzwDetail").show();
    	
    		$("#byqxSelect").hide();
        $("#dwxzSelect").hide();
        $("#dwhySelect").hide();
        $("#dwszdSelect").hide();
        $("#gzzwSelect").hide();
        
        $("#dwmcUpdate").hide();
        $("#dwmcDetail").show();
        $("#dwzzjgdmUpdate").hide();
        $("#dwzzjgdmDetail").show();
        $("#dwdzUpdate").hide();
        $("#dwdzDetail").show();
        $("#dwlxrUpdate").hide();
        $("#dwlxrDetail").show();
        $("#lxrdhUpdate").hide();
        $("#lxrdhDetail").show();
        $("#lxrsjUpdate").hide();
        $("#lxrsjDetail").show();
        $("#lxrdzyxUpdate").hide();
        $("#lxrdzyxDetail").show();
        $("#lxrczUpdate").hide();
        $("#lxrczDetail").show();
        $("#dwybUpdate").hide();
        $("#dwybDetail").show();
        $("#mobilephoneUpdate").hide();
        $("#mobilephoneDetail").show();
        $("#emailUpdate").hide();
        $("#emailDetail").show();
        $("#qqUpdate").hide();
        $("#qqDetail").show();
        $("#jtdzUpdate").hide();
        $("#jtdzDetail").show();
        $("#jtdhUpdate").hide();
        $("#jtdhDetail").show();
        $("#jtybUpdate").hide();
        $("#jtybDetail").show();
        
    });
    
   // $("#btnSubmit").click(function(){
   // 		$("#formUpdate").submit();
   // });
    
});	