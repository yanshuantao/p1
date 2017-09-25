<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!-- jstl start -->
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!-- jstl end -->
<!-- 分页 标签-->
<%@ taglib uri="/WEB-INF/tag/page.tld" prefix="page" %>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">    
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!-- jquery -->
<script type="text/javascript" src="${applicationScope.basePath}/js/jquery-1.7.2.min.js"></script>
<!-- 系统样式和js -->
<link rel="stylesheet" type="text/css" href="${applicationScope.basePath}/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="${applicationScope.basePath}/css/layout.css"/>
<link rel="stylesheet" type="text/css" href="${applicationScope.basePath}/css/csc.css"/>
<script type="text/javascript" src="${applicationScope.basePath}/js/page.js"></script>
<script type="text/javascript" src="${applicationScope.basePath}/js/common-list.js" ></script>
<script type="text/javascript" src="${applicationScope.basePath}/js/bootstrap.min.js" ></script>
<script type="text/javascript" src="${applicationScope.basePath}/js/datetime/WdatePicker.js"></script>
<!-- 系统样式和js end -->
<!-- art插件 start -->
<link type="text/css" rel="stylesheet" href="${applicationScope.basePath}js/artDialog4.1.7/skins/blue.css"/>
<script type="text/javascript" src="${applicationScope.basePath}js/artDialog4.1.7/artDialog.js"></script>
<script type="text/javascript" src="${applicationScope.basePath}js/artDialog4.1.7/plugins/iframeTools.source.js"></script>
<script type="text/javascript" src="${applicationScope.basePath}js/artDialog4.1.7/artDialog.source.js"></script> 
<script type="text/javascript" src="${applicationScope.basePath}js/artDialog4.1.7/plugins/iframeTools.js"></script>
<!-- art插件 end -->
<!-- easyui start -->
<link rel="stylesheet" type="text/css" href="${applicationScope.basePath}/js/jquery-easyui-v1.4.4/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${applicationScope.basePath}/js/jquery-easyui-v1.4.4/themes/icon.css">
<script type="text/javascript" src="${applicationScope.basePath}/js/jquery-easyui-v1.4.4/jquery.min.js"></script>
<script type="text/javascript" src="${applicationScope.basePath}/js/jquery-easyui-v1.4.4/jquery.easyui.min.js"></script>
<!-- easyui end -->

