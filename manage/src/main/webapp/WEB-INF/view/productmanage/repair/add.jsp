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
    <title>创建记录</title>  
    <link rel="stylesheet" href="css/pintuer.css">
    <link rel="stylesheet" href="css/admin.css">
    <script src="js/jquery.js"></script>
    <script src="js/pintuer.js"></script>
    <script src="laydate/laydate.js"></script>  
</head>
<body>
<div class="panel admin-panel">
  <div class="panel-head"><strong><span class="icon-pencil-square-o"></span>&nbsp;&nbsp;创建记录</strong></div>
  <div class="body-content">
    <form action="repair/add" method="post" class="form-x" id="form-article-add" >
      <div class="form-group">
        <div class="label">
          <label>产品名称：</label>
        </div>
        <div class="field">
          <input type="text" class="input" id="productName" name="productName" value=""/>
        </div>
      </div>
		
		<div class="form-group">
        <div class="label">
          <label>产品数量：</label>
        </div>
        <div class="field">
          <input type="text" class="input" id="amount" name="amount" value=""/>
        </div>
      </div>
      
		<div class="form-group">
        <div class="label">
          <label>返修单位：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="unit" value=""/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>出厂日期：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="productionDate" id="productionDate" value=""/>
        </div>
      </div>

	<div class="form-group">
        <div class="label">
          <label>维修过程记录：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="processLog" value=""/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>备注：</label>
        </div>
        <div class="field">
          <textarea name="content" class="textarea" maxlength="200"></textarea>
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
	laydate.render({
	    elem: '#productionDate',
	    event: 'focus' 
	});
	function userSub(){
		var productName = $("input[name ='productName']").val();
		var amount = $("input[name ='amount']").val();
		var unit = $("input[name ='unit']").val();
		var productionDate = $("input[name ='productionDate']").val();
		var processLog = $("input[name ='processLog']").val();
		
		if(productName == '') {
			alert("请输入产品名称！");
			return;
		}
		
		if(amount == '') {
			alert("请输入产品数量！");
			return;
		}
		
		if(isNaN(amount)) {
			alert("产品数量输入错误！");
			return;
		}
		
		
		if(unit == '') {
			alert("请输入返修单位！");
			return;
		}
		
		if(productionDate == '') {
			alert("请选择出厂日期！");
			return;
		}
		
		if(processLog == '') {
			alert("请输入维修过程！");
			return;
		}
		
		if(confirm("确认提交？")) {
			$("#form-article-add").submit();
		}
	}
	function goList(){
		window.location.href="repair/list";
	}
	</script>
</html>