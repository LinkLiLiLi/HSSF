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
    <title>编辑入库产品</title>  
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
  <div class="panel-head"><strong><span class="icon-pencil-square-o"></span>&nbsp;&nbsp;编辑入库产品</strong></div>
  <div class="body-content">
    <form action="jxc/income/edit" method="post" class="form-x" id="form-article-add" >
    	<input type="hidden" name="id" value="${detail.id }"/>
      <div class="form-group">
        <div class="label">
          <label>产品用途：</label>
        </div>
        <div class="field cc">
          ${detail.purchaseApply.purpose }
        </div>
      </div>
      
	  <div class="form-group">
        <div class="label">
          <label>产品名称：</label>
        </div>
        <div class="field cc">
          ${detail.productType.typeName }
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>产品型号：</label>
        </div>
        <div class="field cc">
          ${detail.model }
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>厂家：</label>
        </div>
        <div class="field cc">
          ${detail.manufacturer }
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>数量：</label>
        </div>
        <div class="field">
          <input type="text" class="input" id="amount" name="amount" value="${detail.amount }"/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>备注：</label>
        </div>
        <div class="field cc">
          ${detail.remark }
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>图片：</label>
        </div>
        <div class="field cc">
          <c:if test="${detail.image != null}">
          	<img alt="" src="/upload/${detail.image }">
          </c:if>
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
	function userSub(){
		var amount = $("input[name ='amount']").val();
		
		if(amount == '') {
			alert("数量不可以为空！");
			return ;
		}
		
		if(isNaN(amount)) {
			alert("数量输入不正确！");
			return ;
		}
		
		if(confirm("确认提交？")) {
			$("#form-article-add").submit();
		}
	}
	</script>
</html>