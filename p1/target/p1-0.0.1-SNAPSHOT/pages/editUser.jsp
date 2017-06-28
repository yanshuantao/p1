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
	    <form action="addUser.action" id="addUserForm">
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
	    	</table>
	    </form>
<script type="text/javascript">
$("#addUserForm").form("submit",{
	onsubmit:function (){
	     $.ajax({  
	         method : 'post',  
	         url : '<%=basePath%>user/addUser.action',  
	         data:{   
	        	 userName_add : "userName_add",  
	        	 pwd_add : "pwd_add"
	         },   
	         async : false,  
	         dataType : 'json',  
	         success : function(data) {  
	             if(data==-1){
	            	 $.messager.alert('该用户已存在');
	             }else{  
	                 $.messager.alert('提示',"保存失败！");  
	             }  
	         },  
	         error : function() {  
	             $.messager.alert('异常','更改记录状态异常！');  
	         }  
	     });  
	}
})
</script>
  </body>
</html>
