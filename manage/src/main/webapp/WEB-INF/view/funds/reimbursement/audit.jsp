<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<base href="<%=request.getContextPath() %>/">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title>审核报销单</title>  
    <link rel="stylesheet" href="css/pintuer.css">
    <link rel="stylesheet" href="css/admin.css">
    <script src="js/jquery.js"></script>
    <script src="js/pintuer.js"></script>
    <script src="laydate/laydate.js"></script>  
</head>
<body>
<div class="panel admin-panel">
  <div class="panel-head"><strong><span class="icon-pencil-square-o"></span>&nbsp;&nbsp;审核报销单</strong></div>
  <div class="body-content">
    <form action="funds/reimbursement/audit" method="post" class="form-x" id="form-article-add" >
    	<input type="hidden" value="${reimbursement.id}" name="id"/>
      <div class="form-group">
        <div class="label">
          <label>申请时间：</label>
        </div>
        <div class="field cc">
          <fmt:formatDate value="${reimbursement.reDate }" pattern="yyyy-MM-dd"/>
        </div>
      </div>
		
		<div class="form-group">
        <div class="label">
          <label>支出单位：</label>
        </div>
        <div class="field cc">
      		<c:if test="${reimbursement.payUnit == '信息'}">信息</c:if>
      		<c:if test="${reimbursement.payUnit == '装备中心区分'}">装备中心</c:if>
      		<c:if test="${reimbursement.payUnit == '派得'}">派得</c:if>
      		<c:if test="${reimbursement.payUnit == '农芯'}">农芯</c:if>
        </div>
      </div>
      
		<div class="form-group">
        <div class="label">
          <label>支出项目：</label>
        </div>
        <div class="field cc">
          ${reimbursement.project.projectName }
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>财务编号：</label>
        </div>
        <div class="field cc">
          ${reimbursement.number }
        </div>
      </div>

      <div class="form-group">
        <div class="label">
          <label>分类科目：</label>
        </div>
        <div class="field cc">
          ${reimbursement.detail }
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>票据张数：</label>
        </div>
        <div class="field cc">
          ${reimbursement.sum }
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>理由：</label>
        </div>
        <div class="field cc">
          ${reimbursement.reason }
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>申请人：</label>
        </div>
        <div class="field cc">
          ${reimbursement.applyUser }
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>附件明细：</label>
        </div>
        <div class="field cc">
          <table class="table table-hover text-center">
	      	 <tr>
		        <th>明细</th>
		        <th>金额</th>
		     </tr>
		     <tbody id="items">
			     <c:forEach items="${detailList}" var="item" varStatus="status">
					<tr id="item${status.index}">
						<td>${item.detail }</td>
						<td>${item.amount }</td>
					</tr>
				</c:forEach>
			</tbody>
	      </table>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>审核：</label>
        </div>
        <div class="field">
        	<select class="input" name="status" style="width: 200px;">
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