<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<base href="<%=request.getContextPath() %>/">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
	<meta name="renderer" content="webkit">
	<title></title>
	<link rel="stylesheet" href="css/pintuer.css">
	<link rel="stylesheet" href="css/admin.css">
	<script src="js/jquery.js"></script>
	<script src="js/pintuer.js"></script>
</head>
<body>
<form action="project/fundlist" method="post" id="expertsId">
  <div class="panel admin-panel">
    <div class="panel-head"><strong class="icon-reorder">&nbsp;&nbsp;内容列表</strong></div>
    <div class="padding border-bottom">
      <ul class="search" style="padding-left:10px;">
      	<shiro:hasPermission name="experts_add">
        	<li> <a class="button border-main icon-plus-square-o" href="javascript:void(0);" id="member_add" onclick="toAdd()">经费变动</a> </li>
        </shiro:hasPermission>
      </ul>
    </div>
    <table class="table table-hover text-center">
      <tr>
        <th>序号</th>
		<th>预算科目名称</th>
		<th>原预算额度</th>
		<th>调整后预算额度</th>
		<th>调整额度</th>
      </tr>
      <c:forEach items="${changeList}" var="change" varStatus="status">
			<tr>
	          <td>${(page.currPage - 1) * page.pageRows + status.index+1}</td>
	          <td>${change.fundsDetail.name }</td>
	          <td>${change.originalBudget }</td>
	          <td>${change.newBudget }</td>
	          <td>${change.originalBudget - change.newBudget}</td>
			</tr>
		</c:forEach>
    </table>
  </div>
</form>
	<script type="text/javascript">
		function toAdd(){
			window.location.href="project/tofundadd/${project.id}";
		}
	</script>
</body>
</html>