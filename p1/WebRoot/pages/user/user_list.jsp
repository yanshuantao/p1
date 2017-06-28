<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/tag/page.tld" prefix="page" %>
<html>
	<head>
		<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/js/artDialog4.1.7/skins/blue.css"/>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/artDialog4.1.7/artDialog.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/artDialog4.1.7/plugins/iframeTools.source.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/artDialog4.1.7/artDialog.source.js"></script> 
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/artDialog4.1.7/plugins/iframeTools.js"></script>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/layout.css"/>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/csc.css"/>
		<jsp:include page="../icd_meta.jsp"/>
<script type="text/javascript">

	//群发短信
	function sendMessage(){
		document.forms[0].action = "${urls}/business/Messages/mobileMessageAdd.jspa";
		document.forms[0].submit();
	}
	//群发邮件
	function sendEmail(){
		document.forms[0].action = "${urls}/business/Messages/emailAdd.jspa";
		document.forms[0].submit();
	}

	//编辑
	function updateAction(id,type){
		art.dialog.open(
		  		'${urls}/business/Messages/messageUpdate.jspa?id='+id+'&type='+type,
				  {
			  		width:800,
			  	   	height:600,
			  	   	title:'消息编辑'
				  },false);
	}
	//详情
	function detailAction(id,type){
		art.dialog.open(
	  		'${urls}/business/Messages/messageDetail.jspa?id='+id+'&type='+type,
			  {
		  		width:800,
		  	   	height:600,
		  	   	title:'消息详情'
			  },false);
	}		
	//重置
	function reset2(){
		$(':input','#from1') .not(':button, :submit, :reset, :hidden,:checkbox') .val('') .removeAttr('checked') .removeAttr('selected');
	}	
	
</script>
	</head>

	<body>
		<div class="sys_right">
	           <div class="sys_right_content">
	             <form action="${pageContext.request.contextPath}/users/list.action" method="post" name="from1" id="from1">
				<div class="sys_right_02" >
                    <ul>
                         <li>
                             <p class="fl">用户名：</p>
                             <input name="username" value="${page.query['username'] }" type="text"  class="sys_searching fr"  />
                         </li>
                         <li>
                         	 <p class="fl">手机号：</p>
                             <input name="telephone" value="${page.query['telephone'] }" type="text"  class="sys_searching fr"  />
						 </li>
						 <li>
                         	 <p class="fl">性别：</p>
							  <select name="sex" id="sex" style="width: 135px;height: 28px;line-height: 28px;border: solid #d2d2d2 1px;border-radius: 3px;padding-left: 5px;-webkit-border-radius: 3px;-moz-border-radius: 3px;background-color: #fafafa;color: #838995;float:right; display: inline;">
							  	<option value="">请选择</option>
							  	<option value="0" <c:if test="${page.query['sex']==1}">selected="selected"</c:if>>男</option>
							  	<option value="1" <c:if test="${page.query['sex']==2}">selected="selected"</c:if>>女</option>
							  </select>                        
						 </li>
                         <li id="sys_searchingLast" style="width:300px;">
	                       <input type="button" value="重置" class="pro_c1_viewBtn dependFinishBtn radius4 fl" onclick="reset2();"/>
	                       <input type="submit" value="查询" class="pro_c1_viewBtn dependFinishBtn radius4 fr"/>
                        </li>
                        <li style="width:300px;margin-left:100px;">
	                       <input type="button" value="群发短信" class="pro_c1_viewBtn dependFinishBtn radius4 fl" onclick="sendMessage();"/>
	                       <input type="button" value="群发邮件" class="pro_c1_viewBtn dependFinishBtn radius4 fr" onclick="sendEmail();"/>
                        </li>
                         <div class="clear"></div>
                      </ul>
									
				  </div>
				  
				  <div class="sys_right_03">
			            <p class="fl">
			                   查询结果   
			            </p>      
		            </div>
		            
			       <div  class="sys_right_04">
							<table cellpadding="0" cellspacing="0" width="100%" border="1">
								<tr height="38" align="center" class="sys_searchResult_title">
									<th>
										用户名
									</th>
									<th>
										性别
									</th>
									<th>
										手机号
									</th>
									<th>
										邮箱
									</th>
									<th>
										地址
									</th>	
									<th>
										操作
									</th>
									
								</tr>
								<c:forEach items="${page.items }" var="items">
									<tr height="38" align="center">
										<td>
											${items.username }
										</td>
										<td>
											${items.sex }
										</td>
										<td>
											${items.telephone }
										</td>
										<td>
											${items.email }
										</td>
										<td>
											${items.address }
										</td>
										<td>
											<a href="#" onclick="updateAction('${items.id}');">编辑</a>
											<a href="#" onclick="detailAction('${items.id}');">详情</a>
										</td>
									</tr>
								</c:forEach>
							</table>
					    </div>
				    </form>
				<page:pageForm />
	    </div>
   </div>
</body>
</html>
