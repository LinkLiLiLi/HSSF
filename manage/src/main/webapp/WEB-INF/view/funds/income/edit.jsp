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
    <title>编辑经费到账</title>  
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
  <div class="panel-head"><strong><span class="icon-pencil-square-o"></span>&nbsp;&nbsp;编辑经费到账</strong></div>
  <div class="body-content">
    <form action="funds/edit" method="post" class="form-x" id="form-article-add" >
    <input type="hidden" name="id" value="${fundsIncome.id }"/>
      <div class="form-group">
        <div class="label">
          <label>财务编号：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="financialNumber" value="${fundsIncome.financialNumber }"/>
        </div>
      </div>
		
	  <div class="form-group">
        <div class="label">
          <label>隶属项目：</label>
        </div>
        <div class="field">
          <select name="project.id" class="input w50" style="width: 300px;" onchange="projectChange()">
          	<option value="">全部</option>
          	<c:forEach items="${projectList }" var="project">
          		<option <c:if test="${fundsIncome.project.id == project.id }">selected</c:if> value="${project.id }">${project.projectName }</option>
          	</c:forEach>
          </select>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>总经费：</label>
        </div>
        <div class="field cc" id="totalAmount">
          
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>已到账经费：</label>
        </div>
        <div class="field cc" id="fundAmount">
          
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>本次经费金额：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="amount" value="${fundsIncome.amount }"/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>到账时间：</label>
        </div>
        <div class="field">
          <input type="text" class="input" id="changeTime" name="changeTime" value="<fmt:formatDate value="${fundsIncome.changeTime }" pattern="yyyy-MM-dd"/>"/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>发票情况：</label>
        </div>
        <div class="field">
          <select name="billInfo" class="input w50" style="width: 300px;">
          	<option <c:if test="${fundsIncome.billInfo == 0 }">selected</c:if> value="0">已开发票</option>
          	<option <c:if test="${fundsIncome.billInfo == 1 }">selected</c:if> value="1">未开发票</option>
          </select>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>备注：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="remark" value="${fundsIncome.remark }"/>
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
	    elem: '#changeTime',
	    event: 'focus' 
	});
	
	projectChange();
	
	function projectChange(){
		var projectId = $("select[name='project.id']").val();
		
		if(projectId == '') {
			$("#totalAmount").html('');
			$("#fundAmount").html('');
		}
		
		$.post("project/view/" + projectId,{},function(result){
			$("#totalAmount").html(result.totalMoney);
			$("#fundAmount").html(result.fundMoney);
		});
	}
	
	function userSub(){
		var amount = $("input[name ='amount']").val();
		var projectId = $("select[name ='project.id']").val();
		
		if(projectId == '') {
			alert("请选择隶属项目！");
			return ;
		}
		
		if(amount == '') {
			alert("本次到账金额不可以为空！");
			return ;
		}
		
		if(isNaN(amount)) {
			alert("本次到账金额输入错误！");
			return ;
		}
		
		if(confirm("确认提交？")) {
			$("#form-article-add").submit();
		}
	}
	function goList(){
		window.location.href="apply/online/remuneration/list";
	}
	</script>
</html>