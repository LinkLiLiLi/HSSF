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
    <title>添加节点</title>  
    <link rel="stylesheet" href="css/pintuer.css">
    <link rel="stylesheet" href="css/admin.css">
    <script src="js/jquery.js"></script>
    <script src="js/pintuer.js"></script>
    <script src="laydate/laydate.js"></script>  
</head>
<body>
<div class="panel admin-panel">
  <div class="panel-head"><strong><span class="icon-pencil-square-o"></span>&nbsp;&nbsp;添加节点</strong></div>
  <div class="body-content">
    <form action="product/addnode" method="post" class="form-x" id="form-article-add" >
      <input type="hidden" name="id" value="${id}"/>
	  <div class="form-group">
        <div class="label">
          <label>时间节点：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="nodeDate" id="nodeDate" value="" maxlength="30"/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>进展情况：</label>
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
	    elem: '#nodeDate',
	    event: 'focus' 
	});
	
	function userSub(){
		var nodeDate = $("input[name ='nodeDate']").val();
		var content = $("textarea[name ='content']").val();
		
		if(nodeDate == '') {
			alert("请选择时间节点！");
			return;
		}
		
		if(content == '') {
			alert("请输进展情况！");
			return;
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