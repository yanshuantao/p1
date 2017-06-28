<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>系统管理后台</title>
        <link rel="stylesheet" type="text/css" href="css/layout.css"/>
         <!--[if IE]> <script src=”http://html5shiv.googlecode.com/svn/trunk/html5.js”></script> <![endif]-->
        
        <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
        
        
    </head>
    
    <body onResize="Resize()" onLoad="Resize()">
        <table cellpadding="0" cellspacing="0" border="0" width="100%">
            <tr>
            	<!--头部导航 开始-->
            	<div class="sys_header">
                	<div class="sys_logo fl">
                    	LOGO
                    </div>
                    <div class="sys_search fl re">
                    	<input type="text" placeholder="请输入搜索内容" value="" class="sys_searchInput ab" />
                        <input type="button" value="" class="sys_searchBtn ab" />
                    </div>
                    <div class="sys_userInfor fr">
                    	<ul>
                        	<li class="sys_userMessage01 fl re">
                            	<!--没有消息不显示下面span-->
                            	<span class="sys_messageCount1 ab">
                                	11
                                </span>
                            </li>
                            <li class="sys_userMessage02 fl re">
                            	<!--没有消息不显示下面span-->
                            	<span class="sys_messageCount2 ab">
                                	3
                                </span>
                            </li>
                            <li class="sys_userName fl re">
                            	<span>Admin管理员</span>
                                <div class="sys_userManager ab" style="display: none;">
                                	<ul>
                                    	<li>
                                        	管理一
                                        </li>
                                        <li>
                                        	管理二
                                        </li>
                                        <li>
                                        	管理三
                                        </li>
                                        <li>
                                        	管理四
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <li class="sys_userHeadimage fl">
                            	<img src="images/headimg.jpg" width="44" height="44" />
                            </li>
                            <div class="clear"></div>
                        </ul>
                    </div>
                    <div class="clear"></div>
                </div>
                <!--头部导航 结束-->
            </tr>
            <tr>
                <td width="210">
                	<!--左侧内容 开始-->
                	<div class="sys_left">
                    	<div class="sys_left_content">
                            <div class="sys_tree_first">
                                消息中心系统
                                
                                <!--二级菜单-->
                                <div class="sys_tree_second fl" style="display: none;">
                                    <div class="sys_tree_rect01 ab"></div>
                                    <ul>
                                        <li>
                                            <p class="sys_tree_second_p">消息管理</p>
                                             <!--三级菜单-->
                                              <div class="sys_tree_third fl" style="display: none;">
                                               <p class="sys_tree_second_p">手机短信管理</p>  
                                                <!--四级菜单-->
                                                <div class="sys_tree_rect02 ab"></div>
                                                   <ul>
                                                       <li>
                                                         <p class="sys_tree_second_p" onclick="changeRight('${pageContext.request.contextPath}/business/replyMessage/replyMessage_list.jsp');">回复列表</p>                                                                                        
                                                         <div class="clear"></div>
                                                        </li>
                                                        <li>
                                                         <p class="sys_tree_second_p" onclick="changeRight('${pageContext.request.contextPath}/business/sendmessage/examineList.jsp');">短信审核管理</p>                                                                                        
                                                         <div class="clear"></div>
                                                        </li>
                                                        <li>
                                                         <p class="sys_tree_second_p" onclick="changeRight('${pageContext.request.contextPath}/business/accountbalance/queryByPage.jspa');">短信账户统计</p>                                                                                        
                                                         <div class="clear"></div>
                                                        </li>
                                                         <li>
                                                         <p class="sys_tree_second_p" onclick="changeRight('${pageContext.request.contextPath}/business/message/list.jsp');">短信平台管理</p>                                                                                        
                                                         <div class="clear"></div>
                                                        </li>
                                                    </ul>
                                               
                                            </div>
                                            
                                             <div class="sys_tree_third fl" style="display: none;">
                                               <p class="sys_tree_second_p" onclick="mailSendList();">电子邮件管理</p>  
                                               
                                            </div>
                                             
                                            <div class="sys_tree_third fl" style="display: none;">
                                               <p class="sys_tree_second_p">系统消息管理</p>  
                                              <!--四级菜单-->
                                                <div class="sys_tree_rect02 ab"></div>
                                                   <ul>
                                                       <li>
                                                         <p class="sys_tree_second_p" onclick="systemNoticeMessage();">公告管理</p>                                                                                        
                                                         <div class="clear"></div>
                                                        </li>
                                                        <li>
                                                         <p class="sys_tree_second_p"  onclick="systemStationMessage();">审核消息</p>                                                                                        
                                                         <div class="clear"></div>
                                                        </li>
                                                    </ul>
                                               
                                            </div>
                                            <div class="sys_tree_third fl" style="display: none;">
                                               <p class="sys_tree_second_p" onclick="changeRight('${pageContext.request.contextPath}/business/templateNew/list.jsp');">模板管理</p>  
                                            </div>
                                            
                                            <div class="clear"></div>
                                        </li>
                                        <li>
                                            <p class="sys_tree_second_p" onclick = "">日志管理</p>
                                            <div class="clear"></div>
                                        </li>
                                    </ul>
                                </div>
                                <div class="clear"></div>
                            </div>
                        </div>
                    </div>
                    <!--左侧内容 结束-->
                </td>
                <td>
                   <!--右侧内容 开始-->
                   <div class="sys_right">
                       <iframe src="" frameborder="0"  id="iframe02" name="iframe02" width="100%" onload="this.height=this.contentWindow.document.body.scrollHeight" allowtransparency="ture" scrolling="yes"></iframe>
                   </div> 
                   <!--右侧内容 结束-->
                </td>
            </tr>
        </table>
        <!--日历插件-->
        
        <script>
		$(document).ready(function(e) {
			//树形结构控制
			
			//一级点击事件控制
			$(".sys_tree_first").click(function(e) {
				$(this).children(".sys_tree_second").slideToggle("fast");
				$(this).siblings().children(".sys_tree_second").slideUp("fast");
				$(this).toggleClass("sys_tree_first_select");
				$(this).siblings().removeClass("sys_tree_first_select");
            });
			

			//二级点击事件控制
			$(".sys_tree_second li").click(function(event) {
				//取消事件冒泡
				if(event.preventDefault) {    
					// Firefox    
					event.preventDefault();
					event.stopPropagation();
				} else {    
					// IE    
					event.cancelBubble=true;
					event.returnValue = false;
				}				
				$(this).children(".sys_tree_third").slideToggle("fast")
				$(this).siblings().children(".sys_tree_third").slideUp("fast");
				$(this).children("p").toggleClass("sys_tree_second_select");
				$(this).siblings().children("p").removeClass("sys_tree_second_select");
            });
			
			//页面窗口大小改变触发函数
			Resize = function(){
				var docHeight = $(window).height();
				$(".sys_left").height(docHeight - 90);
				$(".sys_right").height(docHeight - 65);
			}
			//用户管理变量变化
			var flug = false;
			$(".sys_userName").hover(function(){
					flug = true;
				},function(){
						flug = false;
					});
			//控制分享变量变化
			var flag = false;
			$(".sys_searching_select").hover(function(){
					flag = true;
				},function(){
						flag = false;
					});
			$(document).mousedown(function(e) {
				//用户管理弹出
                if (flug) {
					$(".sys_userName").toggleClass("sys_userName_click");
					$(".sys_userManager").slideToggle("fast");
				}else {
					$(".sys_userName").removeClass("sys_userName_click");
					$(".sys_userManager").slideUp("fast");	
				}
				//控制分享显示
				if (flag) {
					$(".select_item").slideToggle("fast");
					$(".sys_searching_select").toggleClass("sys_searching_selected");
				}else {
					$(".sys_searching_select").removeClass("sys_searching_selected");
					$(".select_item").slideUp("fast");	
				}
            });
			
			//控制左侧菜单一级最后一个没有边框
			$(".sys_tree_first:last").css("border","none");
			//控制表格隔行换色
			$(".sys_right_04 table tr:odd").css("background","#fafafa");
			$(".sys_right_04 table tr:even").css("background","#f1f1f1");
			$(".sys_searchResult_title").css("background","#ffffff");
			$(".sys_right_04 table tr:last td").css("border","none");
			//控制偶数行鼠标滑过换背景颜色和字体颜色
			$(".sys_right_04 table tr:odd").hover(function(){
					$(this).css({"background":"#fdd3d2","color":"#fff"});
				},function(){
						$(this).css({"background":"#fafafa","color":"#8e8e8e"});
					});
			//控制奇数行鼠标滑过换背景颜色和字体颜色
			$(".sys_right_04 table tr:even").hover(function(){
					$(this).css({"background":"#fdd3d2","color":"#fff"});
				},function(){
						$(this).css({"background":"#f1f1f1","color":"#8e8e8e"});
					});
			//控制表格第一排鼠标滑过不变颜色
			$(".sys_searchResult_title").hover(function(){
					$(this).css({"background":"#ffffff","color":"#4792c1"});
				},function(){
						$(this).css({"background":"#ffffff","color":"#4792c1"});
					});
					
			//检索弹出框鼠标划过
			$(".select_item dd").hover(function(){
				$(this).css("background","#f2f2f2");
				},function(){
					$(this).css("background","none");
					});
					
			//下拉框传值
			$(".select_item dd").click(function(e) {
                var selectValue = $(this).text();
				$(".select_value").text(selectValue);
            });
			
			
        });
		
		 //公告管理
		 function systemNoticeMessage(){
		        document.getElementById("iframe02").src= "${pageContext.request.contextPath}/business/messages/list.jsp";
		 }
		 
		 //站内信管理
		 function systemStationMessage(){
		        document.getElementById("iframe02").src= "${pageContext.request.contextPath}/business/messages_approve/messageApprove_list.jsp";
		 }
		 function mailSendList(){
		        document.getElementById("iframe02").src= "${pageContext.request.contextPath}/business/mailSend/queryByPage.jspa";
		 	}
		 function changeRight(path){
            $("#iframe02").attr("src",path);
        }
		 
		</script>
        
    </body>
</html>
