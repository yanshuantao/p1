<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
	<link rel="stylesheet" type="text/css" href="<%=basePath %>js/jquery-easyui-v1.4.4/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath %>js/jquery-easyui-v1.4.4/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath %>js/jquery-easyui-v1.4.4/demo/demo.css">
	
	<script type="text/javascript" src="<%=basePath %>js/jquery-easyui-v1.4.4/jquery.min.js"></script>
	<script type="text/javascript" src="<%=basePath %>js/jquery-easyui-v1.4.4/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="<%=basePath %>js/jquery-3.1.1.min.js"></script>

  </head>
  
  <body>
	    <form id="addUserForm">
	    	<table>
	    		<tr>
	    			<td>用户名：</td>
	    			<td>
	    				<input type="text" name="userName_add" id="userName_add"/>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td>密码：</td>
	    			<td>
	    				<input type="text" name="pwd_add" id="pwd_add"/>
	    			</td>
	    		</tr>
	    		<tr>
	    			<td>再次输入密码：</td>
	    			<td>
	    				<input type="text" name="repwd_add" id="repwd_add"/>
	    			</td>
	    		</tr>
                <tr style="height: 50px;">  
                    <td colspan="3" align="center">  
                        <a href="#" class="easyui-linkbutton" iconCls="" onclick="saveUser();">保存</a>      
                        <a href="#" class="easyui-linkbutton" iconCls="" onclick="javascript:$('#addUserDiv').dialog('close')">关闭</a>  
                    </td>  
                </tr>  
	    	</table>
	    </form>
<script type="text/javascript">
function saveUser(){
	var name=$("#userName_add").val();
	var pwd=$("#pwd_add").val();
	var repwd=$("#repwd_add").val();
	if(pwd==repwd){
		$.ajax({  
	        method : 'post',  
	        url : '<%=basePath%>user/addUser.action',  
	        data:{   
	       	 userName_add : name,  
	       	 pwd_add : pwd
	        },   
	        async : false,  
	        dataType : 'json',  
	        success : function(data) {
	            if(data==-1){
	           	 $.messager.alert('该用户已存在');
	            }else{  
	                $.messager.alert('提示',"添加成功！");
                    $("#user_dg").datagrid("load");  
                    $("#addUserDiv").dialog("close");  

	            }  
	        },  
	        error : function() {  
	            $.messager.alert('异常','更改记录状态异常！');  
	        }  
	    }); 	
	}else{
		$.messager.alert('输入错误','两次输入密码不一致，请重新输入！');
		$("#pwd_add").val("");
		$("#repwd_add").val("");
	}
	
}
</script>
  </body>
</html>
