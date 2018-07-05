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
    <title>资产详情</title>  
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
  <div class="panel-head"><strong><span class="icon-pencil-square-o"></span>&nbsp;&nbsp;资产详情</strong></div>
  <div class="body-content">
    <form action="" method="post" class="form-x" id="form-article-add" >
      <div class="form-group">
        <div class="label">
          <label>资产名称：</label>
        </div>
        <div class="field cc">
          ${assets.assetsName}
        </div>
      </div>
		
		<div class="form-group">
        <div class="label">
          <label>资产编号：</label>
        </div>
        <div class="field cc">
          ${assets.assetsNumber}
        </div>
      </div>

		<div class="form-group">
        <div class="label">
          <label>价值：</label>
        </div>
        <div class="field cc">
          ${assets.prize}
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>购置时间：</label>
        </div>
        <div class="field cc">
          <fmt:formatDate value="${assets.buyDate}" pattern="yyyy-MM-dd"/>
        </div>
      </div>
      
	<div class="form-group">
        <div class="label">
          <label>类别：</label>
        </div>
        <div class="field cc">
          ${assets.type }
        </div>
      </div>
      
	<div class="form-group">
        <div class="label">
          <label>所在地：</label>
        </div>
        <div class="field cc">
          ${assets.location}
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>负责人：</label>
        </div>
        <div class="field cc">
          ${assets.charge}
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>状态：</label>
        </div>
        <div class="field cc">
         <c:if test="${assets.status == 1 }">正常</c:if>
			<c:if test="${assets.status == 2 }">报废</c:if>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>是否固定资产：</label>
        </div>
        <div class="field cc">
         <c:if test="${assets.fixedAssets == 0 }">是</c:if>
			<c:if test="${assets.fixedAssets == 1 }">否</c:if>
        </div>
      </div>
    </form>
  </div>
</div>
</body>
	<script type="text/javascript">
	function goList(){
		window.location.href="assets/list";
	}
	</script>
</html>