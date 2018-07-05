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
    <title>编辑转账单</title>  
    <link rel="stylesheet" href="css/pintuer.css">
    <link rel="stylesheet" href="css/admin.css">
    <script src="js/jquery.js"></script>
    <script src="js/pintuer.js"></script>
    <script src="laydate/laydate.js"></script>  
</head>
<body>
<div class="panel admin-panel">
  <div class="panel-head"><strong><span class="icon-pencil-square-o"></span>&nbsp;&nbsp;编辑转账单</strong></div>
  <div class="body-content">
    <form action="funds/transfer/edit" method="post" class="form-x" id="form-article-add" >
    	<input type="hidden" name="id" value="${transfer.id }"/>
      <div class="form-group">
        <div class="label">
          <label>申请时间：</label>
        </div>
        <div class="field">
          <input type="text" class="input" id="transDate" name="transDate" value="<fmt:formatDate value="${transfer.transDate }" pattern="yyyy-MM-dd"/>"/>
        </div>
      </div>
		
		<div class="form-group">
        <div class="label">
          <label>收款单位：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="receiveUnit" value="${transfer.receiveUnit }"/>
        </div>
      </div>
      
		<div class="form-group">
        <div class="label">
          <label>账号：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="accountId" value="${transfer.accountId }"/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>开户银行：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="bank" maxlength="50" value="${transfer.bank }"/>
        </div>
      </div>

      <div class="form-group">
        <div class="label">
          <label>金额：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="amount" maxlength="10" value="${transfer.amount }"/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>汇款用途：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="useInfo" maxlength="50" value="${transfer.useInfo }"/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>支出单位：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="payUnit" maxlength="20" value="${transfer.payUnit }"/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>支出项目：</label>
        </div>
        <div class="field">
          <select class="input" name="project.id" style="width: 300px;">
          	<c:forEach var="project" items="${projectList}">
          		<option value="${project.id }" <c:if test="${transfer.project.id == project.id}">selected</c:if>>${project.projectName }</option>
          	</c:forEach>
          </select>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>财务编号：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="number" maxlength="10" value="${transfer.number }"/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>分类明细：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="detail" maxlength="10" value="${transfer.detail }"/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>合同：</label>
        </div>
        <div class="field">
        	<select name="pact" class="input w50"  style="width: 300px;">
			<option value="0" <c:if test="${transfer.pact == 0 }">selected</c:if>>有</option>
			<option value="1" <c:if test="${transfer.pact == 1 }">selected</c:if>>无</option>
		</select>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>发票状态：</label>
        </div>
        <div class="field">
        	<select name="status" class="input w50" style="width: 300px;">
			<option value="0" <c:if test="${transfer.status == 0 }">selected</c:if>>有</option>
			<option value="1" <c:if test="${transfer.status == 1 }">selected</c:if>>无</option>
		</select>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>归还天数：</label>
        </div>
        <div class="field">
        	<input type="text" class="input" name="workDay" maxlength="10" value="${transfer.workDay}"/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>备注：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="remark" maxlength="100" value="${transfer.remark}"/>
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
	    elem: '#transDate',
	    event: 'focus' 
	});
	function userSub(){
		var amount = $("input[name ='amount']").val();
		var workDay = $("input[name ='workDay']").val();
		var status = $("select[name ='status']").val();
		if(status == 0) {
			$("input[name ='workDay']").val("");
		}
		
		if(amount != '') {
			if(isNaN(amount)) {
				alert("金额输入错误！");
				return ;
			}
		}
		
		if(workDay != '') {
			if(isNaN(workDay)) {
				alert("归还天数输入错误！");
				return ;
			}
		}
		
		
		if(confirm("确认提交？")) {
			$("#form-article-add").submit();
		}
	}
	function goList(){
		window.location.href="product/list";
	}
	</script>
</html>