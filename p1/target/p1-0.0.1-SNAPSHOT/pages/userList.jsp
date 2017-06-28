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
	<META HTTP-EQUIV="pragma" CONTENT="no-cache"> 
	<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache, must-revalidate"> 
	<META HTTP-EQUIV="expires" CONTENT="Wed, 26 Feb 1997 08:21:57 GMT">
  </head>
  
  <body>
   <div id="tb" style="width: auto; height: 80px;">
           <table style="width: auto; height: 75px;" cellspacing="0" border="0">  
		     <tr>
		     	 <td><a id="query" href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="checkInputQuery();">查询</a></td>
		     </tr>
		   </table>
    </div>  
    <table id="goods_tab" >
    </table>
			
<script type="text/javascript">
/* 查询数据条件 */  
function checkInputQuery(){  
    $('#goods_tab').datagrid('options').url='<%=basePath%>user/getUserList.action';  
    $('#goods_tab').datagrid('load');          
}  

$("#goods_tab").datagrid({  
    title: '用户管理',  
    checkOnSelect: false,  
    pagination:true,  
    pageSize:20,  
    pageNumber:1,  
    toolbar: [{
        text: '新增',
        iconCls: 'icon-add',
        handler:function(){
        	addDialog=$().dialog({
                title: '新增',
                href:'<%=basePath%>user/userAdd.action',
                width: 500,
                height: 300,
                bodyStyle: {overflow: 'hidden'},
                buttons: [{
                    text: '提交',
                    handler: addSubmit
                }]
            });
        }
    }],
    url: '<%=basePath%>user/getUserList.action',  
    loadMsg:'加载中...',  
    fit: true,  
    columns: [[  
        { field: 'id', checkbox: true},  
        { field: 'username', title: '用户名', width:60 },  
        { field: 'telephone', title: '联系方式', width:80},  
        { field: 'trueName', title: '姓名', width:100 },  
        { field: 'sex', title: '性别',width:150,
            formatter: function(value,row,index){  
                if (value=='0'){                              
                    return '男';  
                } else if (value=='1'){  
                    return '女';  
                }  
            }  
        	},  
        { field: 'email', title: '邮箱', width:60 },  
        { field: 'address', title: '地址', width:60 }
    ]]            
});
addUser=function(){
	addDialog=$().dialog({
        title: '新增',
        href:'<%=basePath%>user/userAdd.action',
        width: 500,
        height: 300,
        bodyStyle: {overflow: 'hidden'},
        buttons: [{
            text: '提交',
            handler: addSubmit
        }]
    });
};
addSubmit=function(){
	var name=$("#userName_add").val();
	var pwd=$("#pwd_add").val();
	var repwd=$("#repwd_add").val();
	if(pwd==repwd){
        $("#addUserForm").form("submit", {  
            url: '<%=basePath%>user/addUser.action',  
            onsubmit: function () {  
                return $(this).form("validate");  
            },  
            success: function (result) {  
                if (result == "0") {  
                    $.messager.alert("提示信息", "操作成功");  
                    $("#goods_tab").datagrid("reload");  
                    addDialog.dialog("close");  
                }  
                else {  
                    $.messager.alert("提示信息", "保存数据失败");  
                }  
            }  
        });  

	}else{
		$.messager.alert('输入错误','两次输入密码不一致，请重新输入！');
		$("#pwd_add").val("");
		$("#repwd_add").val("");
	}
};
</script>
  </body>
</html>
