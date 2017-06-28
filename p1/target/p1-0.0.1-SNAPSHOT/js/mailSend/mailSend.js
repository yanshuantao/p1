$(function() {
	/**返回查询*/	
	$("#goBack").bind("click", function() {
		window.location.href=$("#mailurls").val()+"/business/mailSend/queryByPage.jspa";
	});
});