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
    <title>编辑计划</title>  
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
  <div class="panel-head"><strong><span class="icon-pencil-square-o"></span>&nbsp;&nbsp;编辑计划</strong></div>
  <div class="body-content">
    <form action="workplan/edit" method="post" class="form-x" id="form-article-add" >
      <input type="hidden" value="${workPlan.id }" name="id"/>
      <div class="form-group">
        <div class="label">
          <label>指派给：</label>
        </div>
        <div class="field cc">
        <select name="user.id" class="input w50" style="width: 300px;">
				<c:forEach items="${userList }" var="user">
					<option value="${user.id }">${user.name }</option>
				</c:forEach>		 		
		 	</select>
        </div>
      </div>

		<div class="form-group">
        <div class="label">
          <label>开始时间：</label>
        </div>
        <div class="field">
          <input type="text" class="input" id="beginTime" name="beginTime" value="<fmt:formatDate value="${workPlan.beginTime }" pattern="yyyy-MM-dd"/>"/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>结束时间：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="endTime" id="endTime" value="<fmt:formatDate value="${workPlan.endTime }" pattern="yyyy-MM-dd"/>"/>
        </div>
      </div>

      <div class="form-group">
        <div class="label">
          <label>工作内容：</label>
        </div>
        <div class="field">
          <textarea name="content" class="textarea" maxlength="800">${workPlan.content }</textarea>
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
	    elem: '#beginTime',
	    event: 'focus' 
	});
	laydate.render({
	    elem: '#endTime',
	    event: 'focus' 
	});
	function goList(){
		window.location.href="workplan/list";
	}
	function userSub(){
		var beginTime = $("input[name ='beginTime']").val();
		var endTime = $("input[name ='endTime']").val();
		
		var content = $("textarea[name ='content']").val();
		
		if(beginTime == '') {
			alert("请选择开始时间！");
			return;
		}
		
		if(endTime == '') {
			alert("请选择结束时间！");
			return;
		}
		
		if(content == '') {
			alert("请输入工作内容！");
			return;
		}
		
		if(confirm("确认提交？")) {
			$("#form-article-add").submit();
		}
	}
	</script>
</html>