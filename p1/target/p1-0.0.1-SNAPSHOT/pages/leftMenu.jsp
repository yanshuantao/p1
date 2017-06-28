<%@ page language="java" import="java.util.*,com.yst.dto.SysModule" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<script src="<%=basePath%>/js/login-reg/js/jquery-1.7.2.min.js" type="text/javascript"></script>

<html>
  <head>
    <base href="<%=basePath%>">
 <script type="text/javascript">
 alert(2);
 alert(${aaa});
 </script>
  </head>
  <body>
        <div id="divCaiDan" runat="server" class="easyui-accordion" data-options="fit:true">
                <c:forEach items="${endModuleList }" var="module">
	            <div title="module.name" style="padding: 8px 0px 8px 0px">
	                <div style="line-height: 22px; margin-left: 12px;">
	                    <a href=""  title="学院管理" onclick="showcontent('<%=basePath%>index.jsp')">学院管理</a>
	                </div>
	            </div>
	            </c:forEach>
            </div>
  </body>
  <body onselectstart="return false;" class="easyui-layout" style="overflow-y: hidden; "  fit="true"   scroll="no">


        <div data-options="region:'north'" style="height:50px">
        </div>
        <div data-options="region:'west' title="West" style="width: 150px;">
                <c:forEach items="${endModuleList }" var="module">
	            <div title="module.name" style="padding: 8px 0px 8px 0px">
	                <div style="line-height: 22px; margin-left: 12px;">
	                    <a href=""  title="学院管理" onclick="showcontent('<%=basePath%>index.jsp')">学院管理</a>
	                </div>
	            </div>
	            </c:forEach>
        </div>
        <div data-options="region:'south',href:'<%=basePath%>pages/bottom.jsp'" title="bottom" style="height:10%;">
        </div>
        <div id="main-center" data-options="region:'center',title:'Main Title',iconCls:'icon-ok'">
        </div>
</body>
  
</html>
