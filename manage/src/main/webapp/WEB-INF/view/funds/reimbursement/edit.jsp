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
    <title>编辑报销单</title>  
    <link rel="stylesheet" href="css/pintuer.css">
    <link rel="stylesheet" href="css/admin.css">
    <script src="js/jquery.js"></script>
    <script src="js/pintuer.js"></script>
    <script src="laydate/laydate.js"></script>  
</head>
<body>
<div class="panel admin-panel">
  <div class="panel-head"><strong><span class="icon-pencil-square-o"></span>&nbsp;&nbsp;编辑报销单</strong></div>
  <div class="body-content">
    <form action="funds/reimbursement/edit" method="post" class="form-x" id="form-article-add" >
    	<input type="hidden" value="${reimbursement.id}" name="id"/>
      <div class="form-group">
        <div class="label">
          <label>申请时间：</label>
        </div>
        <div class="field">
          <input type="text" class="input" id="reDate" name="reDate" value="<fmt:formatDate value="${reimbursement.reDate }" pattern="yyyy-MM-dd"/>"/>
        </div>
      </div>
		
		<div class="form-group">
        <div class="label">
          <label>支出单位：</label>
        </div>
        <div class="field">
          <select name="payUnit" class="input w50" style="width: 300px;">
      		<option <c:if test="${reimbursement.payUnit == '信息'}">selected</c:if> value="信息">信息</option>
      		<option <c:if test="${reimbursement.payUnit == '装备中心区分'}">selected</c:if> value="装备中心">装备中心</option>
      		<option <c:if test="${reimbursement.payUnit == '派得'}">selected</c:if> value="派得">派得</option>
      		<option <c:if test="${reimbursement.payUnit == '农芯'}">selected</c:if> value="农芯">农芯</option>
      	  </select>
        </div>
      </div>
      
		<div class="form-group">
        <div class="label">
          <label>支出项目：</label>
        </div>
        <div class="field">
          <select name="project.id" class="input w50" style="width: 300px;" onchange="projectChange()">
          	<option value="">全部</option>
          	<c:forEach items="${projectList }" var="project">
          		<option <c:if test="${reimbursement.project.id == project.id }">selected</c:if> value="${project.id }">${project.projectName }</option>
          	</c:forEach>
          </select>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>财务编号：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="number" maxlength="10" value="${reimbursement.number }"/>
        </div>
      </div>

      <div class="form-group">
        <div class="label">
          <label>分类科目：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="detail" maxlength="30" value="${reimbursement.detail }"/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>票据张数：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="sum" maxlength="2" value="${reimbursement.sum }"/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>理由：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="reason" maxlength="200" value="${reimbursement.reason }"/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>申请人：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="applyUser" maxlength="20" value="${reimbursement.applyUser }"/>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>附件明细：</label>
        </div>
        <div class="field">
          <table class="table table-hover text-center">
	      	 <tr>
		        <th>明细</th>
		        <th>金额</th>
		     </tr>
		     <tbody id="items">
			     <c:forEach items="${detailList}" var="item" varStatus="status">
					<tr id="item${status.index}">
						<td><input type="text" class="input" name="detailList[${status.index}].detail" value="${item.detail }"></td>
						<td><input type="text" class="input" name="detailList[${status.index}].amount" value="${item.amount }"></td>
						<td><img src="images/minus.png" style="cursor:pointer;" onclick="minusTR(${status.index})"/></td>
					</tr>
				</c:forEach>
			</tbody>
	      </table>
	      <div style="text-align:center;">
				<img src="images/plus.png" style="cursor:pointer;" onclick="plusTR()"/>
			</div>
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
	    elem: '#reDate',
	    event: 'focus' 
	});
	
	var num = '${fn:length(detailList)}';
	function plusTR(){
		num ++;
		var tr = "<tr id='item"+num+"'><td><input type='text' class='input' name='detailList[" + num + "].detail'></td><td><input type='text' class='input' name='detailList[" + num + "].amount' ></td><td><img src='images/minus.png' style='cursor:pointer;' onclick='minusTR("+ num +")'/></td></tr>";
		$("#items").append(tr);
	}
	
	function minusTR(numb){
		$("#item"+ numb).remove(); 
	}
	
	function userSub(){
		var sum = $("input[name ='sum']").val();
		
		if(sum != '') {
			if(isNaN(sum)) {
				alert("票据张数输入错误！");
				return ;
			}
		}
		
		var i = 0;
		
		$("input[name$='.amount']").each(function(){
		    if(isNaN($(this).val())) {
		    	i++;
		    	return ;
		    }
		});
		
		if(i > 0) {
			alert("金额输入错误!");
			return ;
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