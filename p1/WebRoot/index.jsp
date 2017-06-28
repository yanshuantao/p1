<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
    <script type="text/javascript" src="../js/jquery-easyui-v1.4.4/jquery.min.js"></script>
	<script type="text/javascript" src="../js/jquery-easyui-v1.4.4/jquery.easyui.min.js"></script>
	<link rel="stylesheet" type="text/css" href="../js/jquery-easyui-v1.4.4/locale/easyui-lang-zh_CN.js">
	
	<link rel="stylesheet" type="text/css" href="../js/jquery-easyui-v1.4.4/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="../js/jquery-easyui-v1.4.4/themes/default/icon.css">
	
  </head>
  
  <body>
    <h2>Basic Tree</h2>
    <p>Click the arrow on the left to expand or collapse nodes.</p>
    <div style="margin:20px 0;"></div>
    <div class="easyui-panel" style="padding:5px">
        <ul class="easyui-tree">
            <li>
                <span>My Documents</span>
                <ul>
                    <li data-options="state:'closed'">
                        <span>Photos</span>
                        <ul>
                            <li>
                                <span>Friend</span>
                            </li>
                            <li>
                                <span>Wife</span>
                            </li>
                            <li>
                                <span>Company</span>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <span>Program Files</span>
                        <ul>
                            <li>Intel</li>
                            <li>Java</li>
                            <li>Microsoft Office</li>
                            <li>Games</li>
                        </ul>
                    </li>
                    <li>index.html</li>
                    <li>about.html</li>
                    <li>welcome.html</li>
                </ul>
            </li>
        </ul>
    </div>
  </body>
</html>
