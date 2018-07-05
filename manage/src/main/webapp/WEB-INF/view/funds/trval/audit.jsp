<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<base href="<%=request.getContextPath() %>/">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title>编辑差旅报销单</title>  
    <link rel="stylesheet" href="css/pintuer.css">
    <link rel="stylesheet" href="css/admin.css">
    <script src="js/jquery.js"></script>
    <script src="js/pintuer.js"></script>
    <script src="laydate/laydate.js"></script>  
</head>
<body>
<div class="panel admin-panel">
  <div class="panel-head"><strong><span class="icon-pencil-square-o"></span>&nbsp;&nbsp;编辑差旅报销单</strong></div>
  <div class="body-content">
    <form action="funds/trval/audit" method="post" class="form-x" id="form-article-add" >
    <input type="hidden" value="${trval.id }" name="id"/>
      <div class="form-group">
        <div class="label">
          <label>申请时间：</label>
        </div>
        <div class="field">
          <fmt:formatDate value="${trval.travelDate }" pattern="yyyy-MM-dd"/>
        </div>
      </div>
		
		<div class="form-group">
        <div class="label">
          <label>出差人：</label>
        </div>
        <div class="field">
          ${trval.name }
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>出差事由：</label>
        </div>
        <div class="field">
          ${trval.reason }
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>公务卡：</label>
        </div>
        <div class="field">
          ${trval.card }
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>支票：</label>
        </div>
        <div class="field">
          ${trval.cheque }
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>现金：</label>
        </div>
        <div class="field">
          ${trval.money }
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>备注：</label>
        </div>
        <div class="field">
          ${trval.remark }
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>明细：</label>
        </div>
        <div class="field">
          <table class="table table-hover text-center">
		        <tr>
		          <th colspan="3">出发</th>
		          <th colspan="3">到达</th>
		          <th></th>
		          <th colspan="2">交通费</th>
		          <th colspan="2">住宿费</th>
		          <th colspan="2">交通补助</th>
		          <th colspan="2">伙食补助</th>
		          <th colspan="2">其他</th>
		        </tr>
		        <tr>
		          <th colspan="2">出发日期</th>
		          <th>地点</th>
		          <th colspan="2">到达日期</th>
		          <th>地点</th>
		          <th>城市间<br/>交通工具</th>
		          <th>单据<br/>张数</th>
		          <th>金额</th>
		          <th>单据<br/>张数</th>
		          <th>金额</th>
		          <th>天数</th>
		          <th>金额</th>
		          <th>天数</th>
		          <th>金额</th>
		          <th>单据<br/>张数</th>
		          <th>金额</th>
		        </tr>
		     <tbody id="items">
		     	<c:forEach items="${trval.detailList}" var="item" varStatus="status">
					<tr id="item${status.index}">
						<td colspan="2"><fmt:formatDate value="${item.outDate }" pattern="yyyy-MM-dd"/></td>
						<td>${item.outAddr }</td>
						<td colspan="2"><fmt:formatDate value="${item.arriveDate }" pattern="yyyy-MM-dd"/></td>
						<td>${item.arriveAddr }</td>
						<td>${item.vehicle }</td>
						
						<td>${item.trafficSum }</td>
						<td>${item.trafficAmount }</td>
						
						<td>${item.liveSum }</td>
						<td>${item.liveAmount }</td>
						
						<td>${item.trafficSubsidyDays }</td>
						<td>${item.trafficSubsidyAmount }</td>
						
						<td>${item.foodSubsidyDays }</td>
						<td>${item.foodSubsidyAmount }</td>
						
						<td>${item.otherSum }</td>
						<td>${item.otherAmount }</td>
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
		window.location.href="funds/trval/list";
	}
	</script>
</html>