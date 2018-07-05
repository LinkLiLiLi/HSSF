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
    <title>中心用人申请</title>  
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
  <div class="panel-head"><strong><span class="icon-pencil-square-o"></span>&nbsp;&nbsp;中心用人申请</strong></div>
  <div class="body-content">
    <form action="apply/online/needhands/add" method="post" class="form-x" id="form-article-add" >
      <div class="form-group">
        <div class="label">
          <label>用人部门：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="dept" />
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>申请日期：</label>
        </div>
        <div class="field">
          <input type="text" class="input" id="applyDate" name="applyDate" value=""/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>聘用岗位：</label>
        </div>
        <div class="field cc">
            <label><input name="post" type="radio" checked="checked" class="ace" value="1"><span class="lbl">科研</span></label>&nbsp;&nbsp;
           	<label><input name="post" type="radio" class="ace" value="2"><span class="lbl">管理</span></label>
           	<label><input name="post" type="radio" class="ace" value="3"><span class="lbl">技术开发</span></label>&nbsp;&nbsp;
           	<label><input name="post" type="radio" class="ace" value="4"><span class="lbl">科研辅助</span></label>
		</div>
      </div>

      <div class="form-group">
        <div class="label">
          <label>聘用方式：</label>
        </div>
        <div class="field cc">
            <label><input name="employType" type="radio" checked="checked" class="ace" value="1"><span class="lbl">事业</span></label>&nbsp;&nbsp;
           	<label><input name="employType" type="radio" class="ace" value="2"><span class="lbl">企业(派得/农芯)</span></label>
           	<label><input name="employType" type="radio" class="ace" value="3"><span class="lbl">合同</span></label>&nbsp;&nbsp;
           	<label><input name="employType" type="radio" class="ace" value="4"><span class="lbl">博士后</span></label>
		</div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>拟聘人姓名：</label>
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
          <label>年龄：</label>
        </div>
        <div class="field">
          <input type="text" class="input" id="age" name="age"/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>拟聘人学历：</label>
        </div>
        <div class="field">
          <input type="text" class="input" id="education" name="education"  />
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>入职日期：</label>
        </div>
        <div class="field">
          <input type="text" class="input" id="joinDate" name="joinDate" />
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>合同期限：</label>
        </div>
        <div class="field">
          <input type="text" class="input" id="termAmount" name="termAmount"  />
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>岗位津贴：</label>
        </div>
        <div class="field">
          <input type="text" class="input" id="amount" name="amount"  />
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>试用期期限：</label>
        </div>
        <div class="field">
          <input type="text" class="input" id="trialAmount" name="trialAmount"  />
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>试用期津贴：</label>
        </div>
        <div class="field">
          <input type="text" class="input" id="trialAmountSubsidy" name="trialAmountSubsidy"  />
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
	    elem: '#applyDate',
	    event: 'focus' 
	});
	laydate.render({
	    elem: '#joinDate',
	    event: 'focus' 
	});
	function userSub(){
		if(confirm("确认提交吗？")){
			$("#form-article-add").submit();
		}
	}
	
	function back (){
		window.location.href="apply/online/needhands/list";
	}
	</script>
</html>