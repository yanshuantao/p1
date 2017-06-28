<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>



<html xmlns="http://www.w3.org/1999/xhtml">
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
	           	  <div class="sys_right_01">
	               		<p class="fl"> 消息列表</p>	                    
	               </div>
	       	
	
	             <form action="${urls}/business/Messages/queryByPage.jspa" method="post" name="from1" id="from1">
				<div class="sys_right_02" >
                    <ul>
                         <li>
							  <select name="type" id="type" style="width: 135px;height: 28px;line-height: 28px;border: solid #d2d2d2 1px;border-radius: 3px;padding-left: 5px;-webkit-border-radius: 3px;-moz-border-radius: 3px;background-color: #fafafa;color: #838995;float:right; display: inline;">
							  	<option value="">请选择消息类3${pageContext.request.contextPath}型</option>
							  	<option value="1" <c:if test="${page.query['type']==1}">selected="selected"</c:if>>短信</option>
							  	<option value="2" <c:if test="${page.query['type']==2}">selected="selected"</c:if>>站内信</option>
							  	<option value="3" <c:if test="${page.query['type']==3}">selected="selected"</c:if>>邮件</option>
							  	<option value="4" <c:if test="${page.query['type']==4}">selected="selected"</c:if>>通知</option>
							  </select>                        
						 </li>
                         <li>
                             <p class="fl">消息名称：</p>
                             <input name="name" value="${page.query['name'] }" type="text"  class="sys_searching fr"  />
                         </li>
                         <li>
							  <select name="status" id="status" style="width: 135px;height: 28px;line-height: 28px;border: solid #d2d2d2 1px;border-radius: 3px;padding-left: 5px;-webkit-border-radius: 3px;-moz-border-radius: 3px;background-color: #fafafa;color: #838995;float:right; display: inline;">
							  	<option value="">请选择状态</option>
							  	<option value="1" <c:if test="${page.query['status']==1}">selected="selected"</c:if>>待审核</option>
							  	<option value="2" <c:if test="${page.query['status']==2}">selected="selected"</c:if>>审核成功</option>
							  	<option value="3" <c:if test="${page.query['status']==3}">selected="selected"</c:if>>审核失败</option>
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
										消息类型
									</th>
									<th>
										名称
									</th>
									<th>
										提交时间
									</th>
									<th>
										状态
									</th>	
									<th>
										说明
									</th>
									<th>
										审核人
									</th>
									<th>
										审核时间
									</th>
									<th>
										是否模板
									</th>
									<th>
										发送人数
									</th>
									<th>
										操作
									</th>
									
								</tr>
								<c:forEach items="${page.items }" var="items">
									<tr height="38" align="center">
										<td>
											<c:if test="${items.type==1}">
												短信
											</c:if>
											<c:if test="${items.type==2}">
												站内信
											</c:if>
											<c:if test="${items.type==3}">
												邮件
											</c:if>
											<c:if test="${items.type==4}">
												通知
											</c:if>
										</td>
										<td>
											${items.name }
										</td>
										<td>
											<fmt:formatDate type="both" value="${items.createTime }"/>
										</td>
										<td>
											<c:if test="${items.status==1}">待审核</c:if>
											<c:if test="${items.status==2}">成功</c:if>
											<c:if test="${items.status==3}">失败</c:if>
										</td>
										<td alt="hahahahahahah">
											<c:choose>
												<c:when test="${fn:length(items.approveRemark)>10}">
													<div title="${items.approveRemark}"><c:out value="${fn:substring(items.approveRemark, 0, 10)}..."/></div>
												</c:when>
												<c:otherwise>
													<div title="${items.approveRemark}"><c:out value="${items.approveRemark}"/></div>
												</c:otherwise>
											</c:choose>
										</td>
										<td>
											${items.approveUser }
										</td>
										<td>
											<fmt:formatDate type="both" value="${items.approveTime}"/>
										</td>
										<td>
											<c:if test="${empty items.templateId}">自编</c:if>
											<c:if test="${!empty items.templateId}">模板</c:if>
										</td>
										<td>
											${items.receiverCount }
										</td>
										<td>
											<c:if test="${items.status==3}">
												<a href="#" onclick="updateAction('${items.id}','${items.type}');">编辑</a>
											</c:if>
											<c:if test="${(items.status==1)||(items.status==2)}">
												<a href="#" onclick="detailAction('${items.id}','${items.type}');">详情</a>
											</c:if>
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
