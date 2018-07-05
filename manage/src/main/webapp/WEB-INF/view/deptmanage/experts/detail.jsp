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
    <title>专家详情</title>  
    <link rel="stylesheet" href="css/pintuer.css">
    <link rel="stylesheet" href="css/admin.css">
    <script src="js/jquery.js"></script>
    <script src="js/pintuer.js"></script>
    <script src="laydate/laydate.js"></script>  
    <style type="text/css">
    	.cc{line-height: 34px;}
    </style>
</head>
<body>
<div class="panel admin-panel">
  <div class="panel-head"><strong><span class="icon-pencil-square-o"></span>&nbsp;&nbsp;专家详情</strong></div>
  <div class="body-content">
  <form action="" method="post" class="form-x">
      <div class="form-group">
        <div class="label">
          <label>专家姓名：</label>
        </div>
        <div class="field cc ">
          ${experts.userName }
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>性别：</label>
        </div>
        <div class="field cc">
          	<c:if test="${experts.gender == 0 }">男</c:if>
          	<c:if test="${experts.gender == 1 }">女</c:if>
        </div>
      </div>
      <div class="form-group" >
        <div class="label">
          <label>身份证号：</label>
        </div>
        <div class="field cc">
          ${experts.idCard }
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>单位：</label>
        </div>
        <div class="field cc">
          ${experts.unit }
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>职称：</label>
        </div>
        <div class="field cc">
          ${experts.title }
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>银行卡号：</label>
        </div>
        <div class="field cc">
          ${experts.bankCard }
        </div>
      </div>
      <div class="form-group" >
        <div class="label">
          <label>开户行：</label>
        </div>
        <div class="field cc">
          ${experts.bankName }
        </div>
      </div>
     
      <div class="form-group">
        <div class="label">
          <label>电话：</label>
        </div>
        <div class="field cc">
          ${experts.phoneNumber }
        </div>
      </div>
              
      <div class="form-group">
        <div class="label">
          <label>邮箱：</label>
        </div>
        <div class="field cc">
			${experts.email }          
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
	</script>
</html>