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
    <title>编辑劳务计算单</title>  
    <link rel="stylesheet" href="css/pintuer.css">
    <link rel="stylesheet" href="css/admin.css">
    <script src="js/jquery.js"></script>
    <script src="js/pintuer.js"></script>
    <script src="laydate/laydate.js"></script>  
</head>
<body>
<div class="panel admin-panel">
  <div class="panel-head"><strong><span class="icon-pencil-square-o"></span>&nbsp;&nbsp;劳务计算单</strong></div>
  <div class="body-content">
    <form action="funds/remuneration/audit" method="post" class="form-x" id="form-article-add" >
      <input type="hidden" value="${remuneration.id }" name="id"/>
      <div class="form-group">
        <div class="label">
          <label>申请时间：</label>
        </div>
        <div class="field cc">
          <fmt:formatDate value="${remuneration.applyDate }" pattern="yyyy-MM-dd"/>
        </div>
      </div>
		
		<div class="form-group">
        <div class="label">
          <label>标题：</label>
        </div>
        <div class="field cc">
          ${remuneration.title }
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>备注：</label>
        </div>
        <div class="field cc">
          ${remuneration.remark }
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>计算明细：</label>
        </div>
        <div class="field">
          <table class="table table-hover text-center">
	      	 <tr>
		        <th>姓名</th>
		        <th>身份证号码</th>
		        <th>银行卡号</th>
		        <th>开户银行</th>
		        <th>劳务金额</th>
		        <th>应交税金</th>
		        <th>实付金额</th>
		     </tr>							
		     <tbody id="items">
				<c:forEach items="${remuneration.detailList}" var="item" varStatus="status">
					<tr id="item${status.index}">
						<td>${item.name }</td>
						<td>${item.idCard }</td>
						<td>${item.bankCard }</td>
						<td>${item.bankName }</td>
						<td>${item.allAmount }</td>
						<td>${item.taxAmount }</td>
						<td>${item.payAmount }</td>
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
		window.location.href="funds/remuneration/list";
	}
	</script>
</html>