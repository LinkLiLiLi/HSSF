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
    <title>项目商务节点</title>  
    <link rel="stylesheet" href="css/pintuer.css">
    <link rel="stylesheet" href="css/admin.css">
    <script src="js/jquery.js"></script>
    <script src="js/pintuer.js"></script>
    <script src="laydate/laydate.js"></script>  
</head>
<body>
<div class="panel admin-panel">
  <div class="panel-head"><strong><span class="icon-pencil-square-o"></span>&nbsp;&nbsp;创建项目商务节点</strong></div>
  <div class="body-content">
    <form action="project/business/addnode" method="post" class="form-x" id="form-article-add" enctype="multipart/form-data">
      <input type="hidden" value="${id }" name="id"/>
      
      <div class="form-group">
        <div class="label">
          <label>时间节点：</label>
        </div>
        <div class="field">
          <input type="text" class="input" id="nodeDate" name="nodeDate" value=""/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>最新进展：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="progress" value=""/>
        </div>
      </div>
	
	  <div class="form-group">
        <div class="label">
          <label>业务细节：</label>
        </div>
        <div class="field">
          <textarea name="content"></textarea>
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
		var progress = $("input[name ='progress']").val();
		
		if(nodeDate == '') {
			alert("时间节点不可以为空！");
			return ;
		}
		
		if(progress == '') {
			alert("最新进展不可以为空！");
			return ;
		}
		
		if(confirm("确认提交？")) {
			$("#form-article-add").submit();
		}
	}
	function goList(){
		window.location.href="project/business/list";
	}
	</script>
</html>