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
    <title>返校申请</title>  
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
  <div class="panel-head"><strong><span class="icon-pencil-square-o"></span>&nbsp;&nbsp;返校申请</strong></div>
  <div class="body-content">
    <form action="apply/online/needhands/add" method="post" class="form-x" id="form-article-add" >
      <div class="form-group">
        <div class="label">
          <label>所在部门：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="deptName" />
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>申请日期：</label>
        </div>
        <div class="field">
          <input type="text" class="input" id="applyTime" name="applyTime" value=""/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>学生姓名：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="userName" />
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>性别：</label>
        </div>
        <div class="field cc">
          <label><input name="gender" type="radio" checked="checked" class="ace" value="0"><span class="lbl">男</span></label>&nbsp;&nbsp;
          <label><input name="gender" type="radio" class="ace" value="1"><span class="lbl">女</span></label>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>就读学校：</label>
        </div>
        <div class="field">
          <input type="text" class="input" id="school" name="school"/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>入学时间：</label>
        </div>
        <div class="field">
          <input type="text" class="input" id="entranceTime" name="entranceTime"  />
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>入中心时间：</label>
        </div>
        <div class="field">
          <input type="text" class="input" id="centerTime" name="centerTime"/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>培养方式：</label>
        </div>
        <div class="field">
          <input type="text" class="input" id="cultivationMode" name="cultivationMode"  />
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>导师姓名：</label>
        </div>
        <div class="field">
          <input type="text" class="input" id="tutor" name="tutor"  />
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>拟离开时间：</label>
        </div>
        <div class="field">
          <input type="text" class="input" id="leaveTime" name="leaveTime" />
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>原由：</label>
        </div>
        <div class="field">
          <input type="text" class="input" id="reason" name="reason"  />
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
	    elem: '#applyTime',
	    event: 'focus' 
	});
 	laydate.render({
	    elem: '#entranceTime',
	    event: 'focus' 
	});
	laydate.render({
	    elem: '#centerTime',
	    event: 'focus' 
	});
	laydate.render({
	    elem: '#leaveTime',
	    event: 'focus' 
	});
	function userSub(){
		if(confirm("确认提交吗？")){
			$("#form-article-add").submit();
		}
	}
	
	function back (){
		window.location.href="apply/online/backToSchool/list";
	}
	</script>
</html>