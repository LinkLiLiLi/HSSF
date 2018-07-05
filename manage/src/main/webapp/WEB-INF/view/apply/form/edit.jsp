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
    <title>编辑表单</title>  
    <link rel="stylesheet" href="css/pintuer.css">
    <link rel="stylesheet" href="css/admin.css">
    <script src="js/jquery.js"></script>
    <script src="js/pintuer.js"></script>
    <script src="laydate/laydate.js"></script>  
</head>
<body>
<div class="panel admin-panel">
  <div class="panel-head"><strong><span class="icon-pencil-square-o"></span>&nbsp;&nbsp;编辑表单</strong></div>
  <div class="body-content">
    <form action="apply/form/edit" method="post" class="form-x" id="form-article-add" enctype="multipart/form-data">
      <input type="hidden" name="id" value="${commonForms.id}"/>
      <div class="form-group">
        <div class="label">
          <label>表单名称：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="formName" value="${commonForms.formName }"/>
        </div>
      </div>
		
		<div class="form-group">
        <div class="label">
          <label>附件：</label>
        </div>
        <div class="field">
          <input type="file" class="input-text" value="" placeholder="" id="" name="file">
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>描述：</label>
        </div>
        <div class="field">
          <textarea name="content" class="textarea" maxlength="200">${commonForms.content }</textarea>
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
		window.location.href="apply/form/list";
	}
	
	function userSub(){
		var formName = $("input[name ='formName']").val();
		var file = $("input[name ='file']").val();
		var content = $("textarea[name ='content']").val();
		
		if(formName == '') {
			alert("请输入表单名称！");
			return;
		}
		
		if(file != '') {
			var fileN =file.substring(file.lastIndexOf('.') + 1);
			
			if(fileN != 'doc' && fileN != 'docx' && fileN != 'xls' && fileN != 'xlsx') {
				alert("附件应为文本文档格式，仅支持doc、docx、xls、xlsx！");
				return;
			}
		}
		
		if(content == '') {
			alert("请输入附件描述！");
			return;
		}
		
		if(confirm("确认提交？")) {
			$("#form-article-add").submit();
		}
	}
	</script>
</html>