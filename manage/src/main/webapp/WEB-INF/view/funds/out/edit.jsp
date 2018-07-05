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
    <title>创建经费到账</title>  
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
  <div class="panel-head"><strong><span class="icon-pencil-square-o"></span>&nbsp;&nbsp;创建经费到账</strong></div>
  <div class="body-content">
    <form action="funds/out/edit" method="post" class="form-x" id="form-article-add" >
      <input type="hidden" value="${fundsout.id }" name="id"/>
      <div class="form-group">
        <div class="label">
          <label>时间：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="outTime" id="outTime" value="<fmt:formatDate value="${fundsout.outTime }" pattern="yyyy-MM-dd"/>"/>
        </div>
      </div>
		
	  <div class="form-group">
        <div class="label">
          <label>支出项目：</label>
        </div>
        <div class="field">
          <select name="project.id" class="input w50" style="width: 300px;">
          	<option value="">全部</option>
          	<c:forEach items="${projectList }" var="project">
          		<option value="${project.id }" <c:if test="${fundsout.project.id ==project.id }">selected</c:if>>${project.projectName }</option>
          	</c:forEach>
          </select>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>收款单位：</label>
        </div>
        <div class="field cc" id="totalAmount">
           <input type="text" class="input" name="unit" value="${fundsout.unit }"/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>金额：</label>
        </div>
        <div class="field">
          <input type="text" class="input" id="amount" name="amount" value="${fundsout.amount }"/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>经办人：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="dealMan" value="${fundsout.dealMan }"/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>备注：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="remark" value="${fundsout.remark }"/>
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
	    elem: '#outTime',
	    event: 'focus' 
	});
	
	function userSub(){
		var amount = $("input[name ='amount']").val();
		var projectId = $("select[name ='project.id']").val();
		
		if(projectId == '') {
			alert("请选择支出项目！");
			return ;
		}
		
		if(amount == '') {
			alert("金额不可以为空！");
			return ;
		}
		
		if(isNaN(amount)) {
			alert("金额输入错误！");
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