<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%application.setAttribute("basePath", basePath); %>
<%@include file="icd_meta.jsp"%>
<link rel="stylesheet" type="text/css" href="${applicationScope.basePath}/js/login-reg/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="${applicationScope.basePath}js/login-reg/css/style.css" />
<head>
     <title>登陆界面</title>
<script type="text/javascript">
$(function() {
	/* 登录事件 */
	$('#login').click(function() {
		/* ajax提交 */
		var name = $('#name').val();
		var psd = $('#psd').val();
		if(name==''){
			$("#erroNameText").text("用户名不能为空");
			return;
		}
		if(psd==''){
			$("#erroPsdText").text("密码不能为空");
			return;
		}
		$.ajax({
				type : "post",
				url:"<%=basePath%>user/login.action",
				data:{"name":name,"psd":psd},
				dataType : "json",
				success : function(data) {
					if(data==0){
						//正确处理
						document.loginForm.action="<%=basePath%>user/toHomePage.action";
						document.loginForm.submit();
					}else if(data==-1){
						//账号密码错误
						art.dialog.alert("系统错误！");
					}else if(data==-2){
						//用户名密码错误
						$("#erroText").text("用户名密码错误");
					}
				},
				error : function() {
					art.dialog.alert("操作失败，请稍后重试！");
				}
			  });
		
	});
	$('#register').click(function() {
		var name_r_state = $('#name_r');
		var psd_r_state = $('#psd_r');
		var affirm_psd_state = $('#affirm_psd');
		var name_r = $('#name_r').val();
		var psd_r = $('#psd_r').val();
		var affirm_psd = $('#affirm_psd').val();
		if (name_r == '') {
			name_r_state.parent().next().next().css("display", "block");
			return false;
		} else if (psd_r == '') {
			psd_r_state.parent().next().next().css("display", "block");
			return false;
		} else if (affirm_psd == '') {
			affirm_psd_state.parent().next().next().css("display", "block");
			return false;
		} else if (psd_r != affirm_psd) {
			return false;
		} else {
			$('.register').submit();
		}
	})
})

function ok_or_errorBylogin(l) {
	var content = $(l).val();
	if (content != "") {
		$(l).parent().next().next().css("display", "none");
	}
}

function ok_or_errorByRegister(r) {
	var affirm_psd = $("#affirm_psd");
	var psd_r = $("#psd_r");
	var affirm_psd_v = $("#affirm_psd").val();
	var psd_r_v = $("#psd_r").val();
	var content = $(r).val();
	if (content == "") {
		$(r).parent().next().next().css("display", "block");
		return false;
	} else {
		$(r).parent().next().css("display", "block");
		$(r).parent().next().next().css("display", "none");
		if (psd_r_v == "") {
			$(psd_r).parent().next().css("display", "none");
			$(psd_r).parent().next().next().css("display", "none");
			$(psd_r).parent().next().next().css("display", "block");
			return false;
		}
		if (affirm_psd_v == "") {
			$(affirm_psd_v).parent().next().css("display", "none");
			$(affirm_psd_v).parent().next().next().css("display", "none");
			$(affirm_psd_v).parent().next().next().css("display", "block");
			return false;
		}
		if (psd_r_v == affirm_psd_v) {
			$(affirm_psd).parent().next().css("display", "none");
			$(affirm_psd).parent().next().next().css("display", "none");
			$(psd_r).parent().next().css("display", "none");
			$(psd_r).parent().next().next().css("display", "none");
			$(affirm_psd).parent().next().css("display", "block");
			$(psd_r).parent().next().css("display", "block");
		} else {
			$(affirm_psd).parent().next().css("display", "none");
			$(affirm_psd).parent().next().next().css("display", "none");
			$(psd_r).parent().next().css("display", "none");
			$(psd_r).parent().next().next().css("display", "none");
			$(psd_r).parent().next().css("display", "block");
			$(affirm_psd).parent().next().next().css("display", "block");
			return false;
		}
	}
}

function barter_btn(bb) {
	$(bb).parent().parent().fadeOut(1000);
	$(bb).parent().parent().siblings().fadeIn(2000);
}
</script>
</head>

<body class="login_body">

<div class="login_div">
	<div class="col-xs-12 login_title">登录</div>
	<form id="loginForm" name="loginForm" action="user/login.action" class="login" method="post">
		<div class="nav">
			<div class="nav login_nav">
				<div class="col-xs-4 login_username">
					用户名:
				</div>
				<div class="col-xs-6 login_usernameInput">
					<input type="text" name="name" id="name" value="" placeholder="&nbsp;&nbsp;用户名/手机号"  onblur="javascript:ok_or_errorBylogin(this)" />
					<span id="erroNameText" style="color:red;font-size:16px;"></span>
				</div>
			</div>
			<div class="nav login_psdNav">
				<div class="col-xs-4">
					密&nbsp;&nbsp;&nbsp;码:
				</div>
				<div class="col-xs-6">
					<input type="password" name="psd" id="psd" value="" placeholder="&nbsp;&nbsp;密码" onBlur="javascript:ok_or_errorBylogin(this)" />
				</div>
				<span id="erroPsdText" style="color:red;font-size:16px;"></span>
			</div>
			<div class="col-xs-12 login_btn_div">
				<input type="button" class="sub_btn" value="登录" id="login" />
			</div>
			<div id="erroText" class="login_btn_div" style="color:red;font-size:16px;"></div>
		</div>
	</form>

	<div class="col-xs-12 barter_btnDiv">
		<button class="barter_btn" onClick="javascript:barter_btn(this)">没有账号?前往注册</button>
	</div>
</div>

<div class="register_body">
	<div class="col-xs-12 register_title">注册</div>
	<form action="" class="register" method="post">
		<div class="nav">
			<div class="nav register_nav">
				<div class="col-xs-4">
					用户名:
				</div>
				<div class="col-xs-6">
					<input type="text" name="" id="name_r" value="" placeholder="&nbsp;&nbsp;用户名/手机号" onBlur="javascript:ok_or_errorByRegister(this)" />
				</div>
				<div class="col-xs-1 ok_gou">
					√
				</div>
				<div class="col-xs-1 error_cuo">
					×
				</div>
			</div>
			<div class="nav register_psdnav">
				<div class="col-xs-4">
					密&nbsp;&nbsp;&nbsp;码:
				</div>
				<div class="col-xs-6">
					<input type="password" name="" id="psd_r" value="" placeholder="&nbsp;&nbsp;密码" onBlur="javascript:ok_or_errorByRegister(this)" />
				</div>
				<div class="col-xs-1 ok_gou">
					√
				</div>
				<div class="col-xs-1 error_cuo">
					×
				</div>
			</div>
			<div class="nav register_affirm">
				<div class="col-xs-4">
					确认密码:
				</div>
				<div class="col-xs-6">
					<input type="password" name="" id="affirm_psd" value="" placeholder="&nbsp;&nbsp;确认密码" onBlur="javascript:ok_or_errorByRegister(this)" />
				</div>
				<div class="col-xs-1 ok_gou">
					√
				</div>
				<div class="col-xs-1 error_cuo">
					×
				</div>
			</div>
			<div class="col-xs-12 register_btn_div">
				<input type="submit" class="sub_btn" value="注册" id="register" />
			</div>
		</div>
	</form>
	<div class="col-xs-12 barter_register">
		<button class="barter_registerBtn" onClick="javascript:barter_btn(this)" style="">已有秘籍?返回登录</button>
	</div>
</div>
</body>
</html>
