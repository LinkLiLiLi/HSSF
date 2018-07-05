<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<base href="<%=request.getContextPath() %>/">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">
<title></title>
<link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css">
<script src="js/jquery.js"></script>
<script src="js/pintuer.js"></script>
</head>
<body>
<div class="panel admin-panel">
  <div class="panel-head"><strong><span class="icon-key"></span> 修改密码</strong></div>
  <div class="body-content">
    <form method="post" class="form-x" action="user/editpass" id="passform">
      <div class="form-group">
        <div class="label">
          <label for="sitename">管理员：</label>
        </div>
        <div class="field">
          <label style="line-height:33px;">
           ${sessionScope.user.name }
          </label>
        </div>
      </div>      
      <div class="form-group">
        <div class="label">
          <label for="sitename">原始密码：</label>
        </div>
        <div class="field">
          <input type="password" class="input w50" name="oldpass" size="50" placeholder="请输入原始密码"  />       
        </div>
      </div>      
      <div class="form-group">
        <div class="label">
          <label for="sitename">新密码：</label>
        </div>
        <div class="field">
          <input type="password" class="input w50" name="newpass" size="50" placeholder="请输入新密码"/>         
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label for="sitename">确认新密码：</label>
        </div>
        <div class="field">
          <input type="password" class="input w50" name="renewpass" size="50" placeholder="请再次输入新密码" />          
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label></label>
        </div>
        <div class="field">
          <button class="button bg-main icon-check-square-o" type="button" onclick="sumform()"> 提交</button>   
        </div>
      </div>      
    </form>
    <script type="text/javascript">
	    var msg = '${msg}';
		
		if(msg != '') {
			alert(msg);
		}
    	function sumform(){
    		var oldpass = $("input[name='oldpass']").val();
    		var newpass = $("input[name='newpass']").val();
    		var renewpass = $("input[name='renewpass']").val();
    		
    		if(oldpass == '') {
    			alert("请输入旧密码！");
    			return;
    		}
    		
    		if(newpass == '') {
    			alert("请输入新密码！");
    			return;
    		}
    		
    		if(renewpass == '') {
    			alert("请输入确认新密码！");
    			return;
    		}
    		
    		if(newpass != renewpass){
    			alert("新密码和确认密码不一致！");
    			return;
    		}
    		if(confirm("确认修改？")){
    			$("#passform").submit();
    		}
    	}
    </script>
  </div>
</div>
</body></html>