var pubVar = {};

$(function() {

/**
 * 批量选中问题
 */
	$("#select_all").bind("click", function() {
		$(":checkbox").attr("checked", "true");
		$("#select_all").css("display", "none");
		$("#cancel_all").css("display", "");
	});
/**
 * 批量取消选中问题
 */
	$("a[name='cancel_all']").bind("click", function() {
		$(":checkbox").removeAttr("checked");
		$("#cancel_all").css("display", "none");
		$("#select_all").css("display", "");
		
	});

/**
 * 批量删除组织机构
 */
	$("[name='del_org']").bind("click", function() {
		dele(this);
	});
	
});

jQuery.validator.addMethod("organization.title", function(value, element) {
	return this.optional(element)||regVldUtils.nickname(value);
}, "由2-16个字母、数字、汉字组成 ");
$(function() {
	pubVar.mobileVld=$('#orgFrom').validate(
			{
				rules : {
					"organization.title" : {
						required : true,
//						nickname:true,
							remote : {
							url : urls + "/admin/org/validateTitle.jspa", // 后台处理程序
							type : "post", // 数据发送方式
							dataType : "json", // 接受数据格式
							data : { // 要传递的数据
								"organization.title" : $("#organization.title", $("#orgFrom")).val(),
								"ogrId" : $("#ogrId", $("#orgFrom")).val()
							}
						}
					},
					"organization.orgTypeId" : {
						required : true
					}
				},
				/* 设置错误信息 */
				messages : {
					"organization.title" : {
						required : "请输入组织机构中文名称",
						remote : "该昵称在系统中已存在！"
					},
					"organization.orgTypeId" : {
						required : "请输入组织机构类型"
					}
				},
				errorPlacement : function(error, element) {
					
					if ( element.is("input[name='organization.title']") ){
//						var errorContent = $(element).next();
						var errorContent = $(element.next("label"));
//                        placement.empty();
						errorContent.empty();
//						$(errorContent).show();
//						error.appendTo(errorContent);
						error.prependTo(errorContent);
					    //error.appendTo ( element.parent() );
					     }
					
					//设置错误信息提示格式
					
//					errorContent.append($('<img src="'+path+'/images/userReg/zc_prix1.jpg" class="abs zc_prix left341" />'));
											

				}
			});
})
function saveMobileRegInfo() {
	if ($("#orgFrom").valid()) {
		if(vldMobileYzm()){//判断验证是否通过
			pubVar.mobileVld.resetForm();
			$("#orgFrom").attr("action", urls + "/admin/org/saveOrganization.jspa?types=1");
			$("#orgFrom").submit();
		}
	}
}

/**
 * 进行问题修改更新操作
 */
 function updateAsk(thisObj) {
	 
	 var tit = $("#title").val();
		if( tit.replace(/\s+$|^\s+/g,"")=="" || tit == null||tit == "" || tit.length>200){
		    alert('请输入标题');
		    return;
	    }
	 var vcon = $("#vcontent").val();
		if(vcon== null || vcon== ""||vcon.length>500 || vcon.replace(/\s+$|^\s+/g,"")==22 ){
		    alert('请在教师回答内容中输入1-500个字符');
		    return;
	    }
	
	var asg = $("#askTag").val();
		if(asg == null||asg == "" ||asg.replace(/\s+$|^\s+/g,"")==""){
		    alert("请输入标签");
		    return;
	    }

	$.ajax( {
		type : "post",
		url : ctx + "/admin/anyAsk/updateAsk.action",
		dataType : "json",
		data : upAsk(),
		success : function(data, textStatus) {
			if (data.status == '1') {
				alert("操作成功！");
				window.location.href=ctx+"/admin/anyAsk/queryAnyAsk.action";
			} else {
				alert("操作失败！");
			}
		},
		error : function() {
			alert("操作失败，请稍后重试！");
		}
		});
}

/**
 * 提交修改问题需要的字段值
 */
function upAsk(thisObj) {

		var saveJsonData = {
			'idAsk' : $("#idAsk").val(),
			'title' : $("#title").val(),
			'vcontent' : $("#vcontent").val(),
			'askTag' : $("#askTag").val()
			};
			return saveJsonData;
}



/**
 * 实现批量删除组织机构的方法
 */
function dele() {
	
	var jsonData = "";
	$(':checkbox').each(function(j) {
		if ($(this).attr("checked")) {
			jsonData += $(this).val() + " ";
		}
	});
	var checkedDataIdCol = jsonData.split(" ");
	
	if(checkedDataIdCol.length <= 1){
		alert("请选择需要操作的问题");
		$(':checkbox').removeAttr("checked");
	}else if(confirm("确认删除吗")){
	$.ajax( {
		type : "post",
		dataType : "json",
		data : parameter(),
		url : urls + "/admin/org/deleteOrganization.jspa",
		success : function(data, textStatus) {
			if (data.status == '1') {
				alert("操作成功！");
				window.location.href=urls+"/admin/org/queryList.jspa";
			} else {
				alert("操作失败！");
			}
		},
		error : function() {
			alert("操作失败，请稍后重试！");
		}
	});
	}
}
/**
 * 删除时传递参数
 */
function parameter() {
	var jsonData = "";
	$(':checkbox').each(function(j) {
		if ($(this).attr("checked")) {
			jsonData += $(this).val() + ",";
		}
	});
	var saveJsonData = {
		'checkedDataId' : jsonData,
		//'askTag' : $("#askTag").val()
	};
	return saveJsonData;
}