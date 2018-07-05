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
    <title>创建渠道商</title>  
    <link rel="stylesheet" href="css/pintuer.css">
    <link rel="stylesheet" href="css/admin.css">
    <script src="js/jquery.js"></script>
    <script src="js/pintuer.js"></script>
    <script src="laydate/laydate.js"></script>  
</head>
<body>
<div class="panel admin-panel">
  <div class="panel-head"><strong><span class="icon-pencil-square-o"></span>&nbsp;&nbsp;创建渠道商</strong></div>
  <div class="body-content">
    <form action="jxc/dealer/adddealer" method="post" class="form-x" id="form-article-add" >
      <div class="form-group">
        <div class="label">
          <label>经销商：</label>
        </div>
        <div class="field">
          <input type="text" class="input" id="dealerName" name="dealerName" value=""/>
        </div>
      </div>
      
	  <div class="form-group">
        <div class="label">
          <label>银行户头：</label>
        </div>
        <div class="field">
          <input type="text" class="input" id="bankInfo" name="bankInfo" value=""/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>联系人：</label>
        </div>
        <div class="field">
          <input type="text" class="input" id="linkName" name="linkName" value=""/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>联系电话：</label>
        </div>
        <div class="field">
          <input type="text" class="input" id="phoneNumber" name="phoneNumber" value=""/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>联系地址：</label>
        </div>
        <div class="field">
          <input type="text" class="input" id="linkAddr" name="linkAddr" value=""/>
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
		var typeName = $("input[name ='dealerName']").val();
		
		if(typeName == '') {
			alert("渠道商名称不可以为空！");
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