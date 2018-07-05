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
    <title>人事变动</title>  
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
  <div class="panel-head"><strong><span class="icon-pencil-square-o"></span>&nbsp;&nbsp;人事变动</strong></div>
  <div class="body-content">
    <form action="apply/online/changeDept/add" method="post" class="form-x" id="form-article-add" >
      <div class="form-group">
        <div class="label">
          <label>姓名：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="userName" />
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>入中心日期：</label>
        </div>
        <div class="field">
          <input type="text" class="input" id="centerTime" name="centerTime" value=""/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>变动前部门：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="beforeDept" />
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>变动后部门：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="afterDept" />
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>类别：</label>
        </div>
        <div class="field cc">
            <label><input name="changeType" type="radio" checked="checked" class="ace" value="1"><span class="lbl">类别</span></label>&nbsp;&nbsp;
          	<label><input name="changeType" type="radio" class="ace" value="2"><span class="lbl">借调</span></label>
          	<label><input name="changeType" type="radio" class="ace" value="3"><span class="lbl">调薪</span></label>&nbsp;&nbsp;
          	<label><input name="changeType" type="radio" class="ace" value="4"><span class="lbl">其他</span></label>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>截止期限：</label>
        </div>
        <div class="field">
          <input type="text" class="input" id="changeEndTime" name="changeEndTime"/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>其他：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="otherInfo"  />
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>变动前津贴：</label>
        </div>
        <div class="field">
          <input type="text" class="input" id="beforeAmount" name="beforeAmount"/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>变动后津贴：</label>
        </div>
        <div class="field">
          <input type="text" class="input" id="afterAmount" name="afterAmount"  />
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>执行日期：</label>
        </div>
        <div class="field">
          <input type="text" class="input" id="changeTime" name="changeTime"/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>填报时间：</label>
        </div>
        <div class="field">
          <input type="text" class="input" id="applyTime" name="applyTime"/>
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
	    elem: '#centerTime',
	    event: 'focus' 
	});
	laydate.render({
	    elem: '#changeTime',
	    event: 'focus' 
	});
	laydate.render({
	    elem: '#changeEndTime',
	    event: 'focus' 
	});
	function userSub(){
		if(confirm("确认提交吗？")){
			$("#form-article-add").submit();
		}
	}
	
	function back (){
		window.location.href="apply/online/changeDept/list";
	}
	</script>
</html>