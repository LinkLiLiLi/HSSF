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
	<script src="laydate/laydate.js"></script>
</head>
<body>
<form action="jxc/manage/list" method="post" id="searchForm">
  <div class="panel admin-panel">
    <div class="panel-head cl">
    	<strong class="icon-reorder">&nbsp;&nbsp;产品关系列表</strong>
    </div>
    <div class="padding border-bottom">
      <ul class="search" style="padding-left:10px;">
        <shiro:hasPermission name="jxc_manage_add">
        <li> <a class="button border-main icon-plus-square-o" href="javascript:void(0);" onclick="toAdd()">添加关系</a> </li>
        </shiro:hasPermission>
        <li>搜索：</li>
        <li>
          <select name="typeid" class="input">
          	<option value="">请选择产品</option>
          	<c:forEach items="${typeList }" var="type">
          		<option value="${type.id }" <c:if test="${type.id ==typeid}">selected</c:if>>${type.typeName }</option>
          	</c:forEach>
          </select>
          </li>
          <li>
          	<a href="javascript:void(0)" class="button border-main icon-search" onclick="changesearch()" > 搜索</a>
          </li>
      </ul>
    </div>
    <table class="table table-hover text-center">
      <tr>
        <th>序号</th>
		<th>产品</th>
		<th>操作</th>
      </tr>
      <c:forEach items="${manageList}" var="manage" varStatus="status">
			<tr>
	          <td>${(page.currPage - 1) * page.pageRows + status.index+1}</td>
	          <td>${manage.productType.typeName }</td>
	          <td class="td-manage">
	          	<div class="button-group">
	          		<shiro:hasPermission name="jxc_manage_gx">
		          		<a class="button border-yellow" onclick="showproduct('${manage.id}')" href="javascript:;">
		          			<span class="icon-reorder"></span> 关系结构
		          		</a>
	          		</shiro:hasPermission>
	          	</div>
	          </td>
			</tr>
		</c:forEach>
      	<jsp:include page="../../include/page.jsp">
      		<jsp:param value="3" name="colspan"/>
      	</jsp:include>
    </table>
  </div>
</form>
	<script type="text/javascript">
		function changesearch(){
			$("#searchForm").submit();
		}
		
		function toAdd(){
			window.location.href="jxc/manage/toaddparent";
		}
		
		function showproduct(id){
			window.location.href = "jxc/manage/show/"+id;
		}
		
		$(function(){
	    	var msg = '${msg}';
	    	if(msg != '') {
	    		alert(msg);
	    	}
	    });
	</script>
</body>
</html>