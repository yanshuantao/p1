$(document).ready(function(e) {
	//控制表格隔行换色
	$("table tr:odd").css("background","#fafafa");
	$("table tr:even").css("background","#f1f1f1");
	$(".sys_searchResult_title").css("background","#34a9e2");
	$(".sys_searchResult_title td").css("color","#fff");
	
	//控制表格最后一排没有下边框
	//$("table tr:last td").css("border","none");
	//控制偶数行鼠标滑过换背景颜色和字体颜色
	$("table tr:odd").hover(function(){
			$(this).css("background","#fdd3d2");
			$(this).css("color","#fff");
		},function(){
				$(this).css("background","#fafafa");
				$(this).css("color","#8e8e8e");
			});
	//控制奇数行鼠标滑过换背景颜色和字体颜色
	$("table tr:even").hover(function(){
			$(this).css("background","#fdd3d2");
			$(this).css("color","#fff");
		},function(){
				$(this).css("background","#f1f1f1");
				$(this).css("color","#8e8e8e");
			});
	//控制表格第一排鼠标滑过不变颜色
	$(".sys_searchResult_title").hover(function(){
			$(this).css("color","#fff");
			$(this).css("background","#34a9e2");
		},function(){
				$(this).css("color","#fff");
				$(this).css("background","#34a9e2");
			});
			
	
	//控制下拉框变量变化
	var flag = false;
	$(".sys_searching_select").hover(function(){
			flag = true;
		},function(){
				flag = false;
			});
	$(document).mousedown(function(e) {
		//控制分享显示
		if (flag) {
			$(".select_item").slideToggle("fast");
			$(".sys_searching_select").toggleClass("sys_searching_selected");
		}else {
			$(".sys_searching_select").removeClass("sys_searching_selected");
			$(".select_item").slideUp("fast");	
		}
    });
			
	//检索弹出框鼠标划过换背景颜色
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
	
	
	// 隐藏弹出框
	$(".winCloseBtn").click(function(e) {
		$(".popCotainer").fadeOut("fast");
	});
	
});
	

/***********************************************************************
 * ||========== 控制弹出层显示函数
 **********************************************************************/
function popDisplayBlock() {
	$(".popCotainer").fadeIn("fast");
	var docHeight = $(document).height();
	//var scrollHeight = $(window).scrollTop();
	var winWidth = $(document).width();
    //var winHeight = $(window).height();

	var popContentWidth = $(".popContent").width();
	var popContentHeight = $(".popContent").height();
	//$(".popBackground").width(window.screen.width);
	$(".popBackground").height(docHeight);
	$(".popContent").css("left", (winWidth - popContentWidth) / 2);
	$(".popContent").css("top", (docHeight - popContentWidth) / 2);
	// window.parent.document.getElementById("popDiv").style.display =
	// "block"; //获得父元素中的元素
}

// 隐藏弹出框
function winCloseBtn() {
	$(".popCotainer").fadeOut("fast");
}