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
    <title>编辑专家</title>  
    <link rel="stylesheet" href="css/pintuer.css">
    <link rel="stylesheet" href="css/admin.css">
    <script src="js/jquery.js"></script>
    <script src="js/pintuer.js"></script>
    <script src="laydate/laydate.js"></script>  
</head>
<body>
<div class="panel admin-panel">
  <div class="panel-head"><strong><span class="icon-pencil-square-o"></span>&nbsp;&nbsp;编辑专家</strong></div>
  <div class="body-content">
    <form action="experts/edit" method="post" class="form-x" id="form-article-add" >
    	<input type="hidden" name="id" value="${experts.id }"/>
      <div class="form-group">
        <div class="label">
          <label>专家姓名：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="userName" value="${experts.userName }" maxlength="10"/>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>性别：</label>
        </div>
        <div class="field">
          <select name="gender" class="input w50" style="width: 300px;">
          	<option value="0" <c:if test="${experts.gender == 0 }">selected</c:if>>男</option>
          	<option value="1" <c:if test="${experts.gender == 1 }">selected</c:if>>女</option>
          </select>
        </div>
      </div>
      <div class="form-group" >
        <div class="label">
          <label>身份证号：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="idCard" value="${experts.idCard }" maxlength="20"/>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>单位：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="unit" value="${experts.unit }" maxlength="30"/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>职称：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="title" value="${experts.title }" maxlength="20"/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>银行卡号：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="bankCard" value="${experts.bankCard }" />
          
        </div>
      </div>
      <div class="form-group" >
        <div class="label">
          <label>开户行：</label>
        </div>
        <div class="field">
          <input type="text" class="input"  name="bankName" value="${experts.bankName }" />
          
        </div>
      </div>
     
      <div class="form-group">
        <div class="label">
          <label>电话：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="phoneNumber" value="${experts.phoneNumber }" maxlength="50"/>
          
        </div>
      </div>
              
      <div class="form-group">
        <div class="label">
          <label>邮箱：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="email" value="${experts.email }" maxlength="30"/>
          
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label></label>
        </div>
        <div class="field">
          <button class="button bg-main icon-check-square-o" type="button" onClick="userSub();"> 提交</button>
        </div>
      </div>
    </form>
  </div>
</div>
</body>
	<script type="text/javascript">
	function goList(){
		window.location.href="experts/list";
	}
	function userSub(){
		var userName = $("input[name ='userName']").val();
		
		if(userName == '') {
			alert("请输入专家姓名！");
			return;
		}
		
		if(confirm("确认修改？")) {
			$("#form-article-add").submit();
		}
	}
	</script>
</html>