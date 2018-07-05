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
    <title>编辑日志</title>  
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
  <div class="panel-head"><strong><span class="icon-pencil-square-o"></span>&nbsp;&nbsp;编辑日志</strong></div>
  <div class="body-content">
    <form action="workjoutanl/edit" method="post" class="form-x" id="form-article-add" >
    	<input type="hidden" name="id" value="${workJoutanl.id }"/>
		<div class="form-group">
        <div class="label">
          <label>日志时间：</label>
        </div>
        <div class="field cc">
          <fmt:formatDate value="${workJoutanl.joutanlDate }" pattern="yyyy-MM-dd"/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>日志内容：</label>
        </div>
        <div class="field">
          <textarea name="content" class="textarea" maxlength="800">${workJoutanl.workContent }</textarea>
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
	    elem: '#joutanlDate',
	    event: 'focus' 
	});
	function goList(){
		window.location.href="workJoutanl/list";
	}
	function userSub(){
		var joutanlDate = $("input[name ='joutanlDate']").val();
		var content = $("textarea[name ='content']").val();
		
		if(joutanlDate == '') {
			alert("请选择日志时间！");
			return;
		}
		
		if(content == '') {
			alert("请输入日志内容！");
			return;
		}
		
		if(confirm("确认提交？")) {
			$("#form-article-add").submit();
		}
	}
	</script>
</html>