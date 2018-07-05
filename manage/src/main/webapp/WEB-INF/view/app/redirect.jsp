<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<base href="<%=request.getContextPath() %>/">
		<meta charset="utf-8" />
		<title></title>
		<script type="text/javascript">
			var type = '${type}';
			if(type == 'login') {
				location.href="app/index.html?openid=" + '${openid}';
			} else {
				location.href="app/main.html?openid=" + '${openid}';
			}
		</script>
	</head>
	<body>
	</body>
</html>
