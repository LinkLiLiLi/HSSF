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
    <title>出库申请审核</title>  
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
  <div class="panel-head"><strong><span class="icon-pencil-square-o"></span>&nbsp;&nbsp;出库申请审核</strong></div>
  <div class="body-content">
    <form action="jxc/out/audit" method="post" class="form-x" id="form-article-add" >
      <input type="hidden" name="id" value="${apply.id }"/>
      <div class="form-group">
        <div class="label">
          <label>产品名称：</label>
        </div>
        <div class="field cc">
          ${apply.productType.typeName }
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>规格/型号：</label>
        </div>
        <div class="field cc">
          ${apply.model}
        </div>
      </div>
      
	  <div class="form-group">
        <div class="label">
          <label>数量：</label>
        </div>
        <div class="field cc">
          ${apply.amount } 
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>出库用途：</label>
        </div>
        <div class="field cc">
          ${apply.purpose }
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>关联项目：</label>
        </div>
        <div class="field cc">
          ${apply.project.projectName}
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>备注：</label>
        </div>
        <div class="field cc">
          ${apply.remark }
        </div>
      </div>
      
       <div class="form-group">
        <div class="label">
          <label>审核：</label>
        </div>
        <div class="field cc">
           <select name="status" class="input" style="width: 200px;">
				<option value="1">审核通过</option>           	
				<option value="2">拒绝审核</option>
           </select>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>审核描述：</label>
        </div>
        <div class="field">
           <input type="text" class="input" id="auditMsg" name="auditMsg" value=""/>
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
	function userSub(){
		var auditMsg = $("input[name ='auditMsg']").val();
		
		if(auditMsg == '') {
			alert("审核描述不可以为空！");
			return ;
		}
		
		if(confirm("确认审核？")) {
			$("#form-article-add").submit();
		}
	}
	</script>
</html>