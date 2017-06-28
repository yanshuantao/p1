jQuery(function($){
	var Murl = '.';

	var actionUrl = $("#actionUrl").val();
	var prePage = parseInt($("#pageNo").val()) - 1;
	var nextPage = parseInt($("#pageNo").val()) + 1;
	var totalPage = $("#totalPage").val();
	var pageSize = $("#pageSize").val();
	//首页
	$("#pageBar #firstPage").click(function(){
		$('#pageNo').val(1);
		$('#pagerForm').submit();
	});
	//上一页
	$("#pageBar #prePage").click(function(){
		$('#pageNo').val(prePage);
		$('#pagerForm').submit();
	});
	//下一页
	$("#pageBar #nextPage").click(function(){
		$('#pageNo').val(nextPage);
		$('#pagerForm').submit();
	});
	//尾页
	$("#pageBar #endPage").click(function(){
		$('#pageNo').val(totalPage);
		$('#pagerForm').submit();
	});
	//改变每页显示条数
	$("#pageBar #selfPageSize").change(function(){
		var selfPageSize = $(this).val();
		$('#pageNo').val(1);
		$('#pageSize').val(selfPageSize);
		$('#pageSizeManual').val(selfPageSize);
		$('#pagerForm').submit();
	});
	//跳转到
	$("#pageBar #selfPage").change(function(){
		var selpage = $(this).val();
		$('#pageNo').val(selpage);
		$('#pagerForm').submit();
	});
	
	$("#pageBar #selfPageSize").val(pageSize);
})