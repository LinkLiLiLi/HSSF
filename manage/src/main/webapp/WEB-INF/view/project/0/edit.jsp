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
    <title>编辑纵向项目</title>  
    <link rel="stylesheet" href="css/pintuer.css">
    <link rel="stylesheet" href="css/admin.css">
    <script src="js/jquery.js"></script>
    <script src="js/pintuer.js"></script>
    <script src="laydate/laydate.js"></script>  
</head>
<body>
<div class="panel admin-panel">
  <div class="panel-head"><strong><span class="icon-pencil-square-o"></span>&nbsp;&nbsp;编辑纵向项目</strong></div>
  <div class="body-content">
    <form action="project/0/edit" method="post" class="form-x" id="form-article-add" enctype="multipart/form-data">
      <input name="id" type="hidden" value="${project.id }"/>
      <div class="form-group">
        <div class="label">
          <label>财务编号：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="financialNumber" value="${project.financialNumber }"/>
        </div>
      </div>
		
	  <div class="form-group">
        <div class="label">
          <label>项目来源：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="resource" value="${project.resource }"/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>项目名称：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="projectName" value="${project.projectName }"/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>项目负责人：</label>
        </div>
        <div class="field">
          <select name="user.id" class="input w50" style="width: 300px;">
          	<c:forEach items="${userList }" var="user">
          		<option <c:if test="${user.id == project.user.id}">selected</c:if> value="${user.id }">${user.name }</option>
          	</c:forEach>
          </select>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>项目类别：</label>
        </div>
        <div class="field">
          <select name="projectType" class="input w50" style="width: 300px;">
          	<option <c:if test="${1 == project.projectType}">selected</c:if> value="1">技术开发</option>
          	<option <c:if test="${2 == project.projectType}">selected</c:if> value="2">技术服务</option>
          	<option <c:if test="${3 == project.projectType}">selected</c:if> value="3">技术咨询</option>
          	<option <c:if test="${4 == project.projectType}">selected</c:if> value="4">横向工程</option>
          	<option <c:if test="${5 == project.projectType}">selected</c:if> value="5">横向产品</option>
          </select>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>所在小组：</label>
        </div>
        <div class="field">
          <select name="userGroup.id" class="input w50" style="width: 300px;">
          	<c:forEach items="${groupList }" var="group">
          		<option <c:if test="${group.id == project.userGroup.id}">selected</c:if> value="${group.id }">${group.groupName }</option>
          	</c:forEach>
          </select>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>承担单位：</label>
        </div>
        <div class="field">
          <select name="unit" class="input w50" style="width: 300px;">
          	<option <c:if test="${1 == project.unit}">selected</c:if> value="1">信息中心</option>
          	<option <c:if test="${2 == project.unit}">selected</c:if> value="2">装备中心</option>
          	<option <c:if test="${3 == project.unit}">selected</c:if> value="3">派得</option>
          	<option <c:if test="${4 == project.unit}">selected</c:if> value="4">农芯</option>
          </select>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>开始时间：</label>
        </div>
        <div class="field">
          <input type="text" class="input" id="beginTime" name="beginTime" value="<fmt:formatDate value="${project.beginTime }" pattern="yyyy-MM-dd"/>"/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>结束时间：</label>
        </div>
        <div class="field">
          <input type="text" class="input" id="endTime" name="endTime" value="<fmt:formatDate value="${project.endTime }" pattern="yyyy-MM-dd"/>"/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>经费总额：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="totalMoney" value="${project.totalMoney }"/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>档案编号：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="fileNumber" value="${project.fileNumber }"/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>预算说明：</label>
        </div>
        <div class="field">
          <input type="file" class="input" name="file" value=""/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>经费明细：</label>
        </div>
        <div class="field">
          <table class="table table-hover text-center">
	      	 <tr>
	      	 	<th>预算科目名称</th>
		        <th>原预算</th>
		        <th>新预算</th>
		        <th>实际支出</th>
		        <th>原结余</th>
		        <th>新结余</th>
		        <th></th>
		     </tr>							
		     <tbody id="items">
				<c:forEach items="${project.fundList}" var="item" varStatus="status">
					<tr id="item${status.index}">
						<td><input type="text" class="input" name="fundList[${status.index}].name" value="${item.name }"></td>
						<td><input type="text" class="input" name="fundList[${status.index}].originalBudget" value="${item.originalBudget }"></td>
						<td><input type="text" class="input" name="fundList[${status.index}].newBudget" value="${item.newBudget }"></td>
						<td><input type="text" class="input" name="fundList[${status.index}].pay" value="${item.pay }"></td>
						<td><input type="text" class="input" name="fundList[${status.index}].originalBalance" value="${item.originalBalance }"></td>
						<td><input type="text" class="input" name="fundList[${status.index}].newBalance" value="${item.newBalance }"></td>
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
          <label>外拨经费：</label>
        </div>
        <div class="field">
          <table class="table table-hover text-center">
	      	 <tr>
		        <th>单位</th>
		        <th>金额</th>
		        <th></th>
		     </tr>							
		     <tbody id="outItems">
				<c:forEach items="${project.outList}" var="item" varStatus="status">
					<tr id="outItem${status.index}">
						<td><input type="text" class="input" name="outList[${status.index}].unit" value="${item.unit }"></td>
						<td><input type="text" class="input" name="outList[${status.index}].amount" value="${item.amount }"></td>
						<td><img src="images/minus.png" style="cursor:pointer;" onclick="outMinusTR(${status.index})"/></td>
					</tr>
				</c:forEach>
			</tbody>
	      </table>
	      <div style="text-align:center;">
				<img src="images/plus.png" style="cursor:pointer;" onclick="outPlusTR()"/>
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
	    elem: '#beginTime',
	    event: 'focus' 
	});
	
	laydate.render({
	    elem: '#endTime',
	    event: 'focus' 
	});
	
	var num = '${fn:length(project.fundList)}';
	function plusTR(){
		num ++;
		var tr = "<tr id='item"+num+"'><td><input type='text' class='input' name='fundList[" + num + "].name'></td><td><input type='text' class='input' name='fundList[" + num + "].originalBudget'></td><td><input type='text' class='input' name='fundList[" + num + "].newBudget' ></td><td><input type='text' class='input' name='fundList[" + num + "].pay' ></td><td><input type='text' class='input' name='fundList[" + num + "].originalBalance' ></td><td><input type='text' class='input' name='fundList[" + num + "].newBalance' ></td><td><img src='images/minus.png' style='cursor:pointer;' onclick='minusTR("+ num +")'/></td></tr>";
		$("#items").append(tr);
	}
	
	function minusTR(numb){
		$("#item"+ numb).remove(); 
	}
	
	var outNum = '${fn:length(project.outList)}';
	function outPlusTR(){
		num ++;
		var tr = "<tr id='outItem"+outNum+"'><td><input type='text' class='input' name='outList[" + outNum + "].unit'></td><td><input type='text' class='input' name='fundList[" + outNum + "].amount' ></td><td><img src='images/minus.png' style='cursor:pointer;' onclick='outMinusTR("+ outNum +")'/></td></tr>";
		$("#outItems").append(tr);
	}
	
	function outMinusTR(outNum){
		$("#outItem"+ outNum).remove(); 
	}
	
	function userSub(){
		var projectName = $("input[name ='projectName']").val();
		
		if(projectName == '') {
			alert("项目名称不可以为空！");
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