var Class = { // 全局静态类, 用于声明一个新的类并提供构造函数支持
	create : function() {
		return function() { // 返回一个函数, 代表着这个新声明的类的构造函数
			// 一个命名为initialize的函数将被这个类实现作为类的构造函数
			this.initialize.apply(this, arguments);// initialize函数将在你实例化一个变量的时候被调用执行(即上面7个步骤中的第5步)
		};
	}
};
var regesVldUtils = Class.create();
regesVldUtils.prototype = {
	initialize : function(str) {
		this.str = str;
	},
	trim : function(str) {
		return str.replace(/^\s+|\s+$/, '');
	},
	symbol : function(str) {// 符号
		return /[\!\"\#\$\%\&\'\(\)\*\+\,\-\.\/\:\;\<\=\>\?\@\[\]\^\_\`\{\|\}\~\|\\]/
				.test(str);
	},
	mobile : function(str) {
		return /^1[3458]\d{9}$/.test(str);
	},
	idCard : function(str) {
		return (/^[1-9](\d{13}|\d{16}){1}[\d|x|X]{1}$/.test(str))
				&& !this.idCardLogic(str);
	},
	username : function(str) {
		return /^\w$/.test(str);
	},
	nameEn : function(str) {
		return /^[A-Za-z\s\.]*$/.test(str);
	},
	nameCn : function(str) {
		return /^[\u4e00-\u9fa5]*$/.test(str);
	},
	nickname : function(str) {// 中英文，数字，下划线，减号
		return /^[\u4e00-\u9fa5A-Za-z0-9]*$/.test(str);
	},
	password : function(str) {
		return /^[\!\"\#\$\%\&\'\(\)\*\+\,\-\.\/\:\;\<\=\>\?\@\[\]\^\_\`\{\|\}\~\|\\\w]+$/.test(str);
	},
	blank : function(str) {
		return /\s/.test(str);
	},
	chinaCode : function(str) {// 中文汉字
		return /^[\u4e00-\u9fa5]+$ /.test(str);
	},
	email : function(str) {// 邮箱
		return /^['_a-z0-9-\\+]+(\\.['_a-z0-9-\\+]+)*@[a-z0-9-]+(\\.[a-z0-9-]+)*\\.([a-z]{2}|aero|arpa|asia|biz|com|coop|edu|gov|info|int|jobs|mil|mobi|museum|name|nato|net|org|pro|tel|travel|xxx)$/
				.test(str);
		// return /^\w+[-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/.test(str);
	},
	url : function(str) {
		return /^http\:\/\/([\w-]+\.)+[\w-]+(\/[\w-\.\/\?\%\&\=]*)?$/.test(str);
	},
	phone : function(str) {
		return /^((\d{4}-[1-9]{1}\d{6})|(\d{3}-[1-9]{1}\d{7}))$/.test(str);
	},
	idCardLogic : function(idcard) {
		var Errors = new Array(
				"",
				"<b style='color:#C21D0E; font-size:12px;'>身份证号码位数不对!</b>",
				"<b style='color:#C21D0E; font-size:12px;'>身份证号码出生日期超出范围或含有非法字符!</b>",
				"<b style='color:#C21D0E; font-size:12px;'>身份证号码校验错误!</b>",
				"<b style='color:#C21D0E; font-size:12px;'>身份证地区非法!</b>");
		var area = {
			11 : "北京",
			12 : "天津",
			13 : "河北",
			14 : "山西",
			15 : "内蒙古",
			21 : "辽宁",
			22 : "吉林",
			23 : "黑龙江",
			31 : "上海",
			32 : "江苏",
			33 : "浙江",
			34 : "安徽",
			35 : "福建",
			36 : "江西",
			37 : "山东",
			41 : "河南",
			42 : "湖北",
			43 : "湖南",
			44 : "广东",
			45 : "广西",
			46 : "海南",
			50 : "重庆",
			51 : "四川",
			52 : "贵州",
			53 : "云南",
			54 : "西藏",
			61 : "陕西",
			62 : "甘肃",
			63 : "青海",
			64 : "宁夏",
			65 : "xinjiang",
			71 : "台湾",
			81 : "香港",
			82 : "澳门",
			91 : "国外"
		};
		var idcard, Y, JYM;
		var S, M;
		var idcard_array = new Array();
		idcard_array = idcard.split("");
		if (area[parseInt(idcard.substr(0, 2))] == null)
			return Errors[4];
		switch (idcard.length) {
		case 15:
			if ((parseInt(idcard.substr(6, 2)) + 1900) % 4 == 0
					|| ((parseInt(idcard.substr(6, 2)) + 1900) % 100 == 0 && (parseInt(idcard
							.substr(6, 2)) + 1900) % 4 == 0)) {
				ereg = /^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}$/;// 测试出生日期的合法性
			} else {
				ereg = /^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}$/;// 测试出生日期的合法性
			}
			if (ereg.test(idcard))
				return Errors[0];
			else
				return Errors[2];
			break;
		case 18:
			if (parseInt(idcard.substr(6, 4)) % 4 == 0
					|| (parseInt(idcard.substr(6, 4)) % 100 == 0 && parseInt(idcard
							.substr(6, 4)) % 4 == 0)) {
				ereg = /^[1-9][0-9]{5}19[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}[0-9Xx]$/;// 闰年出生日期的合法性正则表达式
			} else {
				ereg = /^[1-9][0-9]{5}19[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}[0-9Xx]$/;// 平年出生日期的合法性正则表达式
			}
			if (ereg.test(idcard)) {
				S = (parseInt(idcard_array[0]) + parseInt(idcard_array[10]))
						* 7
						+ (parseInt(idcard_array[1]) + parseInt(idcard_array[11]))
						* 9
						+ (parseInt(idcard_array[2]) + parseInt(idcard_array[12]))
						* 10
						+ (parseInt(idcard_array[3]) + parseInt(idcard_array[13]))
						* 5
						+ (parseInt(idcard_array[4]) + parseInt(idcard_array[14]))
						* 8
						+ (parseInt(idcard_array[5]) + parseInt(idcard_array[15]))
						* 4
						+ (parseInt(idcard_array[6]) + parseInt(idcard_array[16]))
						* 2 + parseInt(idcard_array[7]) * 1
						+ parseInt(idcard_array[8]) * 6
						+ parseInt(idcard_array[9]) * 3;
				Y = S % 11;
				M = "F";
				JYM = "10X98765432";
				M = JYM.substr(Y, 1);
				if (M == idcard_array[17])
					return Errors[0];
				else
					return Errors[3];
			} else
				return Errors[2];
			break;
		default:
			return Errors[1];
			break;
		}
	}

};

var regVldUtils=new regesVldUtils();
