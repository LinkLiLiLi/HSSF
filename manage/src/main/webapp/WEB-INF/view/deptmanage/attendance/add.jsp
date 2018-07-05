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
    <title>考勤填报</title>  
    <link rel="stylesheet" href="css/pintuer.css">
    <link rel="stylesheet" href="css/admin.css">
    <script src="js/jquery.js"></script>
    <script src="js/pintuer.js"></script>
    <script src="laydate/laydate.js"></script>  
</head>
<body>
<div class="panel admin-panel">
  <div class="panel-head"><strong><span class="icon-pencil-square-o"></span>&nbsp;&nbsp;考勤填报</strong></div>
  <div class="body-content">
    <form action="attendance/add" method="post" class="form-x" id="form-article-add" >
      <div class="form-group" >
        <div class="label">
          <label>开始时间：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="startTime" value="" id="startTime"/>
        </div>
      </div>
	  <div class="form-group" >
        <div class="label">
          <label>结束时间：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="endTime" value="" id="endTime"/>
        </div>
      </div>
	  <div class="form-group">
        <div class="label">
          <label>类型：</label>
        </div>
        <div class="field">
          <select name="absentType" class="input w50" style="width: 300px;">
          	<option value="1">请假</option>
          	<option value="2">外出</option>
          	<option value="3">出差</option>
          	<option value="4">加班</option>
          </select>
        </div>
      </div>
      <div class="form-group" >
        <div class="label">
          <label>事由：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="reason" value="" id="reason"/>
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
	    elem: '#startTime',
	    event: 'focus' 
	});
	laydate.render({
	    elem: '#endTime',
	    event: 'focus' 
	});
	function userSub(){
		var startTime = $("input[name ='startTime']").val();
		var endTime = $("input[name ='endTime']").val();
		var reason = $("input[name ='reason']").val();
		if(startTime == '') {
			alert("请选择开始时间！");
			return;
		}
		if(endTime == '') {
			alert("请选择结束时间！");
			return;
		}
		
		if(reason == '') {
			alert("请输入事由！");
			return;
		}
		if(confirm("确认提交？")) {
			$("#form-article-add").submit();
		}
	}
	</script>
</html>