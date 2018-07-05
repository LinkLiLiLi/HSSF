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
    <title>创建关系</title>  
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
  <div class="panel-head"><strong><span class="icon-pencil-square-o"></span>&nbsp;&nbsp;建立关系</strong></div>
  <div class="body-content">
    <form action="jxc/manage/addchild" method="post" class="form-x" id="form-article-add" >
      <input name="parentId" type="hidden" value="${manage.id}"/>
      <input name="baseid" type="hidden" value="${baseid}"/>
      <div class="form-group">
        <div class="label">
          <label>上级产品：</label>
        </div>
        <div class="field cc">
          ${manage.productType.typeName }
        </div>
      </div>
      
	  <div class="form-group">
        <div class="label">
          <label>产品：</label>
        </div>
        <div class="field">
          <select name="productType.id" class='input'>
          	<option value="">请选择</option>
          	<c:forEach items="${typeList }" var="type">
          		<option value="${type.id }">${type.typeName }</option>
          	</c:forEach>
          </select>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>所需数量：</label>
        </div>
        <div class="field">
          <input type="text" class="input" id="amount" name="amount" value=""/>
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
		var typeid = $("select[name ='productType.id']").val();
		var amount = $("#amount").val();
		
		if(typeid == '') {
			alert("请选择产品！");
			return ;
		}
		
		if(amount=='') {
			alert("请输入所需数量！");
			return ;
		}
		
		if(isNaN(amount)){
			alert("所需数量输入不正确！");
			return ;
		}
		
		if(confirm("确认提交？")) {
			$("#form-article-add").submit();
		}
	}
	function goList(){
		window.location.href="product/list";
	}
	</script>
</html>