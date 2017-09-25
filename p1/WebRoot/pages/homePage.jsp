<%@ page language="java" import="java.util.*,com.yst.dto.SysModule,com.yst.model.SysUserModel" pageEncoding="UTF-8"%>
<%
  List<SysModule> menuList = (List<SysModule>)session.getAttribute("moduleList");
%>
<%@include file="icd_meta.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<style type="text/css">
	*{margin: 0;padding: 0}
	body{font-size: 12px;font-family: "宋体","微软雅黑";}
	ul,li{list-style: none;}
	a:link,a:visited{text-decoration: none;}
	.list{width: 210px;border-bottom:solid 1px #316a91;margin:auto auto 0 auto;}
	.list ul li{background-color:#95B8E7; border:solid 1px #316a91; border-bottom:0;}
	.list ul li a{padding-left: 10px;color: #fff; font-size:18px; display: block; font-weight:bold; height:36px;line-height: 36px;position: relative;
	}
	.list ul li .inactive{ background:url(${applicationScope.basePath}images/off.png) no-repeat 184px center;}
	.list ul li .inactives{background:url(${applicationScope.basePath}images/on.png) no-repeat 184px center;} 
	.list ul li ul{display: none;}
	.list ul li ul li { border-left:0; border-right:0; background-color:#6196bb; border-color:#467ca2;}
	.list ul li ul li ul{display: none;}
	.list ul li ul li a{ padding-left:20px;}
	.list ul li ul li ul li { background-color:#d6e6f1; border-color:#6196bb; }
	.last{ background-color:#d6e6f1; border-color:#6196bb; }
	.list ul li ul li ul li a{ color:#316a91; padding-left:30px;}
	</style>
    <script type="text/javascript">
        //在右边center区域打开菜单，新增tab
            function Open(text, url) {
            	if (url){    
                    content2 = '<iframe scrolling="no" frameborder="0"  src="'+url+'" style="width:100%;height:100%;"></iframe>';
            	} else {    
                    content2 = '未实现';    
                } 
                 if ($("#tabs").tabs('exists', text)) {
                    $('#tabs').tabs('select', text);
                } else {
                    $('#tabs').tabs('add', {
                        title : text,
                        closable : true,
                        content : content2
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
 
    <div data-options="region:'north',border:'false'" style="height:10%;">
<!--头部导航 开始-->
        	<div class="sys_header">
            	<div class="sys_logo fl">
                	<img src="${applicationScope.basePath}images/logo.png" width="240" height="43" />
                </div>
                <div class="sys_userInfor fr">
                	<ul>
                        <li class="sys_userHeadimage fl">
                       		<img src="${applicationScope.basePath}images/admin.png" width="44" height="44" />
                        </li>
                        <li class="sys_userName fl re">
                        	<span style="font-size:16px " id="sessionUserName">${sessionScope.muser.username}</span>
                            <div class="sys_userManager ab" style="display: none;">
                            	<ul>
                                	<li onclick="editMessage('${sessionScope.muser.id}');">
                                    	修改个人信息
                                    </li>
                                    <li  onclick="editPwd('${sessionScope.muser.id}',0);">
                                    	修改密码
                                    </li>
                                </ul>
                            </div>
                        </li>
                        
                        <li class="sys_userHeadimage fl">
                        	<img src="${applicationScope.basePath}images/logout.png" width="44" height="44" onclick="logout()"/>
                        </li>
                        <div class="clear"></div>
                    </ul>
                </div>
                <div class="clear"></div>
            </div>
            <!--头部导航 结束-->    </div>

    <div data-options="region:'west',title:'导航菜单',split:true" style="width:17%;">
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
											<a href="#" onclick="Open('${menuOne.name}','${applicationScope.basePath}${menuOne.url}');">${menuOne.name}</a>
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
      		   <img alt="" src="${applicationScope.basePath}/images/love.png" style="width:auto;height:auto;">
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
