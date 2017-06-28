<%@ page language="java" import="java.util.*,com.yst.dto.SysModule,com.yst.model.SysUserModel" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
  SysUserModel model= (SysUserModel)session.getAttribute(session.getId()); 
  List<SysModule> menuList = model.getModuleList();
%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/js/jquery-easyui-v1.4.4/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/js/jquery-easyui-v1.4.4/themes/icon.css">
    <script type="text/javascript" src="<%=basePath%>/js/jquery-easyui-v1.4.4/jquery.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>/js/jquery-easyui-v1.4.4/jquery.easyui.min.js"></script>
		<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/js/artDialog4.1.7/skins/blue.css"/>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/artDialog4.1.7/artDialog.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/artDialog4.1.7/plugins/iframeTools.source.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/artDialog4.1.7/artDialog.source.js"></script> 
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/artDialog4.1.7/plugins/iframeTools.js"></script>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/layout.css"/>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/csc.css"/>
	<style type="text/css">
	*{margin: 0;padding: 0}
	body{font-size: 12px;font-family: "宋体","微软雅黑";}
	ul,li{list-style: none;}
	a:link,a:visited{text-decoration: none;}
	.list{width: 210px;border-bottom:solid 1px #316a91;margin:auto auto 0 auto;}
	.list ul li{background-color:#467ca2; border:solid 1px #316a91; border-bottom:0;}
	.list ul li a{padding-left: 10px;color: #fff; font-size:12px; display: block; font-weight:bold; height:36px;line-height: 36px;position: relative;
	}
	.list ul li .inactive{ background:url(<%=basePath%>images/off.png) no-repeat 184px center;}
	.list ul li .inactives{background:url(<%=basePath%>images/on.png) no-repeat 184px center;} 
	.list ul li ul{display: none;}
	.list ul li ul li { border-left:0; border-right:0; background-color:#6196bb; border-color:#467ca2;}
	.list ul li ul li ul{display: none;}
	.list ul li ul li a{ padding-left:20px;}
	.list ul li ul li ul li { background-color:#d6e6f1; border-color:#6196bb; }
	.last{ background-color:#d6e6f1; border-color:#6196bb; }
	.list ul li ul li ul li a{ color:#316a91; padding-left:30px;}
	</style>
    <script type="text/javascript">
        function showcontent(url) {
            var aa = "<%=basePath%>user/getUserList.action";
            alert(aa);
            $("#main-center").href=aa;
        }
        //在右边center区域打开菜单，新增tab
            function Open(text, url) {
                if ($("#tabs").tabs('exists', text)) {
                    $('#tabs').tabs('select', text);
                } else {
                    $('#tabs').tabs('add', {
                        title : text,
                        closable : true,
                        content : text,
                        href:url
                    });
                }
            }

        $(document).ready(function() {
        	$('.inactive').click(function(){
        		if($(this).siblings('ul').css('display')=='none'){
        			$(this).parent('li').siblings('li').removeClass('inactives');
        			$(this).addClass('inactives');
        			$(this).siblings('ul').slideDown(100).children('li');
        			if($(this).parents('li').siblings('li').children('ul').css('display')=='block'){
        				$(this).parents('li').siblings('li').children('ul').parent('li').children('a').removeClass('inactives');
        				$(this).parents('li').siblings('li').children('ul').slideUp(100);

        			}
        		}else{
        			//控制自身变成+号
        			$(this).removeClass('inactives');
        			//控制自身菜单下子菜单隐藏
        			$(this).siblings('ul').slideUp(100);
        			//控制自身子菜单变成+号
        			$(this).siblings('ul').children('li').children('ul').parent('li').children('a').addClass('inactives');
        			//控制自身菜单下子菜单隐藏
        			$(this).siblings('ul').children('li').children('ul').slideUp(100);

        			//控制同级菜单只保持一个是展开的（-号显示）
        			$(this).siblings('ul').children('li').children('a').removeClass('inactives');
        		}
        	})
        });

    </script>
</head>
<body class="easyui-layout">
<!-- 
    <div data-options="region:'north',border:'false'" style="height:10%;">
       <h2 align="center">
          	某某管理系统
       </h2>
    </div>
     -->
    <div data-options="region:'west',title:'导航2菜单',split:true" style="width:17%;">
		    <div class="list">
			<ul class="yiji">
			<c:forEach	items="${endModuleList}" var="menu">
				<c:if test="${empty menu.sonList}">
					<li>
						<a href="#">${menu.name}</a>
					</li>
				</c:if>
				<c:if test="${!empty menu.sonList}">
					<li>
						<a href="#" class="inactive">${menu.name}</a>
					<ul>
						<c:forEach items="${menu.sonList}" var="menuOne">
								<li>
									<a href="#" onclick="Open('${menuOne.name}','<%=basePath%>${menuOne.url}');">${menuOne.name}</a>
								</li>
						</c:forEach>
					</ul>
					</li>
				</c:if>
			</c:forEach>
			</ul>
		</div>
    </div>
    <div id="main-center" data-options="region:'center'" style="padding:5px;background:#eee;">
	    <div class="easyui-tabs" fit="true" border="false" id="tabs">
      		<div title="首页">
      		   <img alt="" src="<%=basePath%>/images/love.png" style="width:auto;height:auto;">
      		</div>
    	</div>

    </div>
    <div id="tabsMenu" class="easyui-menu" style="width:120px;"> 

	    <div name="close">关闭</div> 
	
	    <div name="Other">关闭其他</div> 
	
	    <div name="All">关闭所有</div>

  	</div> 
    
</body>
</html>
