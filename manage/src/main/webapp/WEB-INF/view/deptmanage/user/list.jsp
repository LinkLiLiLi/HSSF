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
<form action="user/list" method="post" id="searchForm">
  <div class="panel admin-panel">
    <div class="panel-head"><strong class="icon-reorder">&nbsp;&nbsp;内容列表</strong></div>
    <div class="padding border-bottom">
      <ul class="search" style="padding-left:10px;">
        <shiro:hasPermission name="user_add">
        	<li> <a class="button border-main icon-plus-square-o" href="javascript:void(0);" onclick="toadd()">添加用户</a> </li>
        </shiro:hasPermission>
        <li>搜索：</li>
        <li>
          <input type="text" placeholder="请输入搜索关键字" name="name" class="input" style="width:250px; line-height:17px;display:inline-block"  value="${name}" />
          <select name="userGroupId" class="input" style="width:250px; line-height:15px;display:inline-block" >
				<c:forEach items="${userGroupList}" var="usergroup">
					<option value="${usergroup.id}">${usergroup.groupName}</option>
				</c:forEach>       	   		
       	   </select>
          <a href="javascript:void(0)" class="button border-main icon-search" onclick="changesearch()" > 搜索</a></li>
      </ul>
      
    </div>
    <table class="table table-hover text-center"  >
      <tr>
        <th>序号</th>
		<th>姓名</th>
		<th>组名</th>
		<th>电话</th>
		<th>职称</th>
		<th>岗位</th>
		<th>状态</th>
		<th>操作</th>
      </tr>
       <c:forEach items="${userList}" var="user" varStatus="status">
			<tr>
	          <td>${(page.currPage - 1) * page.pageRows + status.index+1}</td>
	          <td><u style="cursor:pointer" class="text-primary" onclick="detail('${user.id}')">${user.name}</u></td>
	          <td>
	          ${user.userGroup.groupName}
	        
	          </td>
	          <td>${user.phoneNumber }</td>
	          <td>${user.titles }</td>
	          <td>
	          	<c:if test="${user.post == 0 }">主任</c:if>
				<c:if test="${user.post == 1 }">组长</c:if>
				<c:if test="${user.post == 2 }">职工</c:if>
				<c:if test="${user.post == 3 }">学生</c:if>
	          </td>
	          <td>
	          	<c:if test="${user.status == 1 }">在岗</c:if>
				<c:if test="${user.status == 2 }">离职</c:if>
				<c:if test="${user.status == 3 }">辞退</c:if>
				<c:if test="${user.status == 4 }">换岗</c:if>
	          </td>
	          <td>
	          	<div class="button-group">
	          		<shiro:hasPermission name="user_edit">
		          		<a class="button border-main" onclick="edit('${user.id}')" href="javascript:;">
		          			<span class="icon-edit"></span> 修改
		          		</a>
	          		</shiro:hasPermission>
	          	</div>
	          </td>
			</tr>
		</c:forEach>
      	<jsp:include page="../../include/page.jsp">
      		<jsp:param value="9" name="colspan"/>
      	</jsp:include>
    </table>
  </div>
</form>
	<script type="text/javascript">
		function changesearch(){
			$("#searchForm").submit();
		}
		function toadd(){
			window.location.href="user/toadd";
		}
		function edit(id){
			window.location.href = "user/toedit/"+id;
		}
		function detail(id){
			window.location.href = "user/detail/"+id;
		}
		$(function(){
	    	var msg = '${msg}';
	    	
	    	if(msg != '') {
	    		alert(msg);
	    	}
	    	    });
		$(function(){
		
				
			
		});
	</script>
</body>
</html>