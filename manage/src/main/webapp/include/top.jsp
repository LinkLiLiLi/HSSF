<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>省级积分后台管理系统</title>
	<link href="<%=request.getContextPath()%>/css/zxstyle.css" rel="stylesheet" />
</head>
<body class="bgbj">
	<div class="top">
	    <ul class="logocon clear"  style="background: url(<%=request.getContextPath()%>/images/bg.jpg) no-repeat 0 -1000px;">
	        <li class="top_logo">
	        	装备中心农自管理系统
	        </li>
	        <li class="top_button clear">
	        	<p class="topuser"><a href="javascript:modifyPwd(0);" onclick="modifyPwd();"></a></p>
	        	<p>
            		<span class="toppass">${sessionScope.user.name }</span>
            		<a class="topexit" href="javascript:void(0);" onclick="logout();">安全退出</a>
            	</p>
	        </li>
	    </ul>
	</div>
	<script type="text/javascript">
		function logout(){
			if (confirm("确认退出？")) {
				window.top.location.href = '<%=request.getContextPath()%>';
			}
		}
		
		function modifyPwd(){
			window.parent.mainFrame.location.href = '<%=request.getContextPath()%>/user/pass';
		}
	</script>
</body>
</html>