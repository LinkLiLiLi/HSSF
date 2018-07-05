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
    <title>审核转账单</title>  
    <link rel="stylesheet" href="css/pintuer.css">
    <link rel="stylesheet" href="css/admin.css">
    <script src="js/jquery.js"></script>
    <script src="js/pintuer.js"></script>
    <script src="laydate/laydate.js"></script>  
</head>
<body>
<div class="panel admin-panel">
  <div class="panel-head"><strong><span class="icon-pencil-square-o"></span>&nbsp;&nbsp;审核转账单</strong></div>
  <div class="body-content">
    <form action="funds/transfer/audit" method="post" class="form-x" id="form-article-add" >
    	<input type="hidden" name="id" value="${transfer.id }"/>
      <div class="form-group">
        <div class="label">
          <label>申请时间：</label>
        </div>
        <div class="field cc">
          <fmt:formatDate value="${transfer.transDate }" pattern="yyyy-MM-dd"/>
        </div>
      </div>
		
		<div class="form-group">
        <div class="label">
          <label>收款单位：</label>
        </div>
        <div class="field cc">
          ${transfer.receiveUnit }
        </div>
      </div>
      
		<div class="form-group">
        <div class="label">
          <label>账号：</label>
        </div>
        <div class="field cc">
          ${transfer.accountId }
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>开户银行：</label>
        </div>
        <div class="field cc">
          ${transfer.bank }
        </div>
      </div>

      <div class="form-group">
        <div class="label">
          <label>金额：</label>
        </div>
        <div class="field cc">
          ${transfer.amount }
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>汇款用途：</label>
        </div>
        <div class="field cc">
          ${transfer.useInfo }
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>支出单位：</label>
        </div>
        <div class="field cc">
          ${transfer.payUnit }
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>支出项目：</label>
        </div>
        <div class="field cc">
          ${transfer.project.projectName}
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>财务编号：</label>
        </div>
        <div class="field cc">
          ${transfer.number }
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>分类明细：</label>
        </div>
        <div class="field cc">
          ${transfer.detail }
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>合同：</label>
        </div>
        <div class="field cc">
			<c:if test="${transfer.pact == 0 }">有</c:if>
			<c:if test="${transfer.pact == 1 }">无</c:if>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>发票状态：</label>
        </div>
        <div class="field cc">
			<c:if test="${transfer.status == 0 }">有</c:if>
			<c:if test="${transfer.status == 1 }">无</c:if>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>归还天数：</label>
        </div>
        <div class="field cc">
        	${transfer.workDay}
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>备注：</label>
        </div>
        <div class="field cc">
          ${transfer.remark}
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>审核：</label>
        </div>
        <div class="field">
        	<select class="input" name="auditStatus" style="width: 200px;">
				<option value="1">通过</option>
				<option value="2">拒绝</option>
        	</select>
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
		if(confirm("确认提交？")) {
			$("#form-article-add").submit();
		}
	}
	function goList(){
		window.location.href="product/list";
	}
	</script>
</html>