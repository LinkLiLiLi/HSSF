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
    <title>调薪申请</title>  
    <link rel="stylesheet" href="css/pintuer.css">
    <link rel="stylesheet" href="css/admin.css">
    <script src="js/jquery.js"></script>
    <script src="js/pintuer.js"></script>
    <script src="laydate/laydate.js"></script>  
</head>
<body>
<div class="panel admin-panel">
  <div class="panel-head"><strong><span class="icon-pencil-square-o"></span>&nbsp;&nbsp;调薪申请</strong></div>
  <div class="body-content">
    <form action="apply/online/salary/edit" method="post" class="form-x" id="form-article-add" enctype="multipart/form-data">
      <input type="hidden" name="id" value="${salary.id }"/>
      <div class="form-group">
        <div class="label">
          <label>所属部门：</label>
        </div>
        <div class="field">
          <input type="text" class="input" id="dept" name="dept" value="${salary.dept }"/>
        </div>
      </div>
		
		<div class="form-group">
        <div class="label">
          <label>姓名：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="userName" id="userName" value="${salary.userName }"/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>学历/位：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="education" id="education" value="${salary.education }"/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>入中心时间：</label>
        </div>
        <div class="field">
          <input type="text" class="input" id="centerTime" name="centerTime" value="${salary.centerTime }"/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>编制：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="organization" value="${salary.organization }"/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>职称：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="titleName" value="${salary.titleName }"/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>现岗位津贴：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="beforeAmount" value="${salary.beforeAmount }"/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>月工资：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="beforeWages" value="${salary.beforeWages }"/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>调整后岗贴：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="afterAmount" value="${salary.afterAmount }"/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>调整后月工资：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="afterWages" value="${salary.afterWages }"/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>变动日期：</label>
        </div>
        <div class="field">
          <input type="text" class="input" id="changeTime" name="changeTime"  value="${salary.changeTime }"/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>申请日期：</label>
        </div>
        <div class="field">
          <input type="text" class="input" id="applyTime" name="applyTime" value="${salary.applyTime }"/>
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
	    elem: '#centerTime',
	    event: 'focus' 
	});
 	laydate.render({
	    elem: '#applyTime',
	    event: 'focus' 
	});
	laydate.render({
	    elem: '#changeTime',
	    event: 'focus' 
	});
	function userSub(){
		if(confirm("确认提交吗？")){
			$("#form-article-add").submit();
		}
	}
	
	function back (){
		window.location.href="apply/online/salary/list";
	}
	</script>
</html>