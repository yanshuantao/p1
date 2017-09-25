<%@ page language="java" import="java.util.*,com.app.message.enums.*" pageEncoding="utf-8"%>
<%@include file="../icd_meta.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script>
	//保存
	function save(){
		$.ajax({
			type : "post",
			url : "${urls}/business/Messages/messageUpdateDo.jspa",
			data:$('#from1').serialize(),
			dataType : "json",
			success : function(data) {
				if(data.result=='000000'){
					var win = art.dialog.open.origin;
					win.location.reload(); 
				}else if(data.result=='000001'){
					art.dialog.alert("保存失败");
				}
			},
			error : function() {
				art.dialog.alert("操作失败，请稍后重试！");
			}
		});
	}
	//返回
	function goBack(){
		art.dialog.close();  
	}
</script>
	</head>
	<body>
		<form action="${applicationScope.basePath}/user/updateDo.jspa" name="from1" id="from1" method="post">
			<table cellpadding="0" cellspacing="0" width="1000" border="0" style="margin-left:10%;margin-top:5%;" id="table1">
				<tr>
	    			<td>用户名：</td>
	    			<td>
	    				<input type="text" name="user.username" id="username" value="${user.username}"/>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td>性别：</td>
	    			<td>
	    				<input type="radio"  name="user.sex" value="男"/>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td>手机号：</td>
	    			<td>
	    				<input type="text" name="user.telephone" id="telephone" value="${user.telephone}"/>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td>邮箱：</td>
	    			<td>
	    				<input type="text" name="user.email" id="email" value="${user.email}"/>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td>地址：</td>
	    			<td>
	    				<input type="text" name="user.address" id="address" value="${user.address}"/>
	    			</td>
	    		</tr>
				<tr>
					<td width="35%" align="center" height="35"
						style="font-size: 12px; color: #aeafaf; vertical-align: middle;">
						<input  type="button" value="保存" class="pro_c1_viewBtn dependFinishBtn radius4 fl" onclick="save();" />
						<input type="button" value="返回" class="pro_c1_viewBtn dependFinishBtn radius4 fl" onclick="javascript:goBack();" style="margin-left:30px;">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>