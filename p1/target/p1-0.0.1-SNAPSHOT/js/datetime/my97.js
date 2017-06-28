/**
  * showAfterDate：是否可以选择今天以后的日期，可以为空，默认false;
  * linkage:是否联动，可以为空，需要end的ID存在,默认false;
  * showTime:是否显示时间，可以为空，默认为false;格式为：yyyy-MM-dd HH:mm:ss
  * start:开始时间的ID，可以为空，默认为startDate;
  * end:结束时间的ID,可以为空，默认为endDate;
*/
function selectDate(showAfterDate,linkage,showTime,start,end){
	showAfterDate = showAfterDate==null?false:showAfterDate;
	linkage = linkage==null?false:linkage;
	start = start==null?"startDate":start;
	end = end==null?"endDate":end;
	showTime = showTime==null?false:showTime;
	var startEle=$dp.$(start);
	var endEle=$dp.$(end);
	var minDate,maxDate,onpicked;
	if(linkage){
		if($dp.$(end) == null){
			alert("时间联动，请设置endDate的ID！");
		}
		onpicked = function(){endEle.focus();};
	}else{
		if($dp.$(start) != null && $dp.$(end) != null){
			minDate = "#F{$dp.$D('"+start+"')}";
		}
	}
	dateFmt = 'yyyy-MM-dd';
	if(!showAfterDate){
		maxDate = '%y-%M-%d';
		if(showTime){
			maxDate = '%y-%M-%d %H-%m-%s';
		}
	}
	
	if(showTime){
		dateFmt = 'yyyy-MM-dd HH:mm:ss';
	}
	
    WdatePicker({
    	skin:'whyGreen',
		readOnly : true,
		errDealMode:1,
		maxDate:maxDate,
		minDate:minDate,
		dateFmt:dateFmt,
		onpicked:onpicked
	});
}

/**
 * 只能选择今天
 * @param showTime 是否显示时间，默认false
 */
function onlySelectToday(showTime){
	showTime = showTime==null?false:showTime;
	if(showTime){
		minDate = '%y-%M-%d %H-%m-%s';
		maxDate = '%y-%M-%d %H-%m-%s';
		dateFmt = 'yyyy-MM-dd HH:mm:ss';
	}else{
		minDate = '%y-%M-%d';
		maxDate = '%y-%M-%d';
		dateFmt = 'yyyy-MM-dd';
	}
	
    WdatePicker({
    	skin:'whyGreen',
		readOnly : true,
		errDealMode:1,
		maxDate:maxDate,
		minDate:minDate,
		dateFmt:dateFmt
	});
}

/**
 * 选择时间区间内的时间
 * @param start
 * @param end
 * @param linkage
 */
function selectDayArea(start,end,linkage){
	linkage = linkage==null?false:linkage;
	minDate = start;
	maxDate = end;
	dateFmt = 'yyyy-MM-dd';
	
	var endEle=$dp.$("endDate");

	if(linkage){
		onpicked = function(){endEle.focus();};
	}else{
		if($dp.$("startDate") != null && $dp.$("endDate") != null){
			minDate = "#F{$dp.$D('"+"startDate"+"')}";
		}
	}
	
	WdatePicker({
		skin:'whyGreen',
		readOnly : true,
		errDealMode:1,
		maxDate:maxDate,
		minDate:minDate,
		dateFmt:dateFmt,
		onpicked:onpicked
	});
}

function selectMonth(showAfterDate,linkage,showTime,start,end){
	showAfterDate = showAfterDate==null?false:showAfterDate;
	linkage = linkage==null?false:linkage;
	start = start==null?"startDate":start;
	end = end==null?"endDate":end;
	showTime = showTime==null?false:showTime;
	var startEle=$dp.$(start);
	var endEle=$dp.$(end);
	var minDate,maxDate,onpicked;
	if(linkage){
		if($dp.$(end) == null){
			alert("时间联动，请设置endDate的ID！");
		}
		onpicked = function(){endEle.focus();};
	}else{
		if($dp.$(start) != null && $dp.$(end) != null){
			minDate = "#F{$dp.$D('"+start+"')}";
		}
	}
	dateFmt = 'yyyy-MM';
	if(!showAfterDate){
		maxDate = '%y-%M';
		if(showTime){
			maxDate = '%y-%M-%d %H-%m-%s';
		}
	}
	
	if(showTime){
		dateFmt = 'yyyy-MM-dd HH:mm:ss';
	}
    WdatePicker({
    	skin:'whyGreen',
		readOnly : true,
		errDealMode:1,
		maxDate:maxDate,
		minDate:minDate,
		dateFmt:dateFmt,
		onpicked:onpicked
	});
}

//只能选择今天以前的日期
function selectTodayBeforeDate(showAfterDate,linkage,showTime,start,end){
	showAfterDate = showAfterDate==null?false:showAfterDate;
	linkage = linkage==null?false:linkage;
	start = start==null?"startDate":start;
	end = end==null?"endDate":end;
	showTime = showTime==null?false:showTime;
	var startEle=$dp.$(start);
	var endEle=$dp.$(end);
	var minDate,maxDate,onpicked;
	if(linkage){
		if($dp.$(end) == null){
			alert("时间联动，请设置endDate的ID！");
		}
		onpicked = function(){endEle.focus();};
	}else{
		if($dp.$(start) != null && $dp.$(end) != null){
			minDate = "#F{$dp.$D('"+start+"')}";
		}
	}
	dateFmt = 'yyyy-MM-dd';
	if(!showAfterDate){
		maxDate = '%y-%M-#{%d-1}';
		if(showTime){
			maxDate = '%y-%M-%d %H-%m-%s';
		}
	}
	
	if(showTime){
		dateFmt = 'yyyy-MM-dd HH:mm:ss';
	}
	
    WdatePicker({
    	skin:'whyGreen',
		readOnly : true,
		errDealMode:1,
		maxDate:maxDate,
		minDate:minDate,
		dateFmt:dateFmt,
		onpicked:onpicked
	});
}




//只能选择今天以后的日期
function selectTodayAfterDate(showAfterDate,linkage,showTime,start,end){
	showAfterDate = showAfterDate==null?false:showAfterDate;
	linkage = linkage==null?false:linkage;
	start = start==null?"startDate":start;
	end = end==null?"endDate":end;
	showTime = showTime==null?false:showTime;
	var startEle=$dp.$(start);
	var endEle=$dp.$(end);
	var minDate,maxDate,onpicked;
	
	dateFmt = 'yyyy-MM-dd';
	if(!showAfterDate){
		minDate = '%y-%M-%d';
		if(showTime){
			minDate = '%y-%M-%d %H-%m-%s';
		}
	}
	
	if(linkage){
		if($dp.$(end) == null){
			alert("时间联动，请设置endDate的ID！");
		}
		onpicked = function(){endEle.focus();};
	}else{
		if($dp.$(start) != null && $dp.$(end) != null){
			minDate = "#F{$dp.$D('"+start+"')}";
		}
	}
	if(showTime){
		dateFmt = 'yyyy-MM-dd HH:mm:ss';
	}
	
  WdatePicker({
  	skin:'whyGreen',
		readOnly : true,
		errDealMode:1,
		maxDate:maxDate,
		minDate:minDate,
		dateFmt:dateFmt,
		onpicked:onpicked
	});
}
