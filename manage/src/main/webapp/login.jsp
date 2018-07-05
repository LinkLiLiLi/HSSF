
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title></title>
	<link href="<%=request.getContextPath()%>/css/zxstyle.css" rel="stylesheet" />
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/check.js"></script>
</head>
<body class="bdbj" onkeydown="formkeydown();">
	<div class="box">
		<div class="logo">
			<img src="<%=request.getContextPath()%>/images/logo.jpg" alt="logo" />
		</div>
		<div class="login">
			<ul class="loginbj">
				<li class="logintitle">用户登录</li>
				<li class="logindl">
					<form id="loginForm" action="<%=request.getContextPath()%>/checklogin" method="post">
						<ol class="logintext">
							<li>
								<p class="loginname">用户名</p>
								<p class="loginput">
									<label><input class="putin" name="username" type="text"  id="username"/></label>
								</p>
							</li>
							<li>
								<p class="loginname">密&nbsp;&nbsp;&nbsp;&nbsp;码</p>
								<p class="loginput">
									<label><input class="putin" name="password" type="password" id="password" /></label>
								</p>
							</li>
							<li>
								<p class="loginname">验证码</p>
								<p class="loginput clear">
									<span class="loginconput1">
										<label><input class="putin putin1" name="验证码" type="text" maxlength="4" id="verifycode"/></label>
									</span>
									<span class="loginconput2">
										<img id="securityCodeImg" height="34" src="code" onclick="changeSecurityCode();" alt="看不清？点击更换" />
									</span>
								</p>
							</li>
							<li id="loginerror" class="loginerror">
							</li>
							<li class="loginbtn"><a id="submitForm" href="javascript:void(0);" onclick="login();return false;">登录</a></li>
						</ol>
					</form>
				</li>
			</ul>
		</div>
		<div class="bottom"></div>
	</div>
	<script type="text/javascript">
		if (window != top){     
        	top.location.href = location.href;
    	}
	
		$(document).ready(function(){
			$("#username").focus();
		});	
	
		function login() {
			var username = $("#username").val();
			var password = $("#password").val();
			var verifycode = $("#verifycode").val();
			
			if (isBlank(username)) {
				$("#loginerror").text('请输入用户名！');
				return;
			}
			
			if (!isAlphaNumeric(username)) {
				$("#loginerror").text('用户名或密码不正确！');
				return;
			}
			
			if (isBlank(password)) {
				$("#loginerror").text('请输入密码！');
				return;
			}
			
			if (!checkLength(password)) {
				$("#loginerror").text("用户名或密码不正确！");
				return;
			}
			
			if (isBlank(verifycode)) {
				$("#loginerror").text("请输入验证码！");
				return;
			}
			
			if (verifycode.length < 4) {
				$("#loginerror").text("验证码不正确！");
				return;
			}
			
			$.post("login",{userName : username, password:password, validate : verifycode},function(info){
          		if(info.code == 'success'){
  					window.location.href = "index";
  				} else {
  					alert(info.desc);
  				}
          	});
		}
		
		function checkLength(pwd) {
			if(pwd.length< 6 || pwd.length>12) {
				return false;
			} else {
				return true;
			}
		}
		
		function formkeydown(){
			if(window.event){
				if (window.event.keyCode == 13){
					$("#submitForm").click();
				}	
			} else {
				var event = arguments.callee.caller.arguments[0];
				if (event.keyCode == 13){
					$("#submitForm").click();
				}
			}
		}
				
		function changeSecurityCode() {
			$("#securityCodeImg").attr("src", "code?timestamp="+new Date().getTime());
		}			
	</script>
</body>
</html>