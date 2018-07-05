<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>省级积分后台管理系统</title>
		<link href="<%=request.getContextPath()%>/css/zxstyle.css" rel="stylesheet" />
		<style>
			textarea,a,input,button{outline:none;}
			.menuline{width:20px;height:120px;padding-top:7px;}
			
			/*展开*/
			.menuleftopen{width:20px;height:120px;background:url(<%=request.getContextPath()%>/images/menuico1-left.png) no-repeat 0 0 #f5f5f5;border:none;color:#666;font-size:12px;cursor:pointer;}
			.menuleftopen:hover{width:20px;height:120px;background:url(<%=request.getContextPath()%>/images/menuico1-lefth.png) no-repeat 0 0 #f5f5f5;border:none;color:#666;font-size:12px;cursor:pointer;}
			/*end 展开*/
			
			/*收起*/
			.menuleftcolse{width:20px;height:120px;background:url(<%=request.getContextPath()%>/images/menuico-left.png) no-repeat 0 0 #f5f5f5;border:none;color:#666;font-size:12px;cursor:pointer;}
			.menuleftcolse:hover{width:20px;height:120px;background:url(<%=request.getContextPath()%>/images/menuico-lefth.png) no-repeat 0 0 #f5f5f5;border:none;color:#666;font-size:12px;cursor:pointer;}
			/*end 收起*/
		</style>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script>
	</head>
	<body class="bgbj">
    	
	</body>
</html>