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
  <div class="panel admin-panel">
    <div class="panel-head"><strong class="icon-reorder"> 内容列表</strong></div>
    <div class="padding border-bottom">
      <ul class="search" style="padding-left:10px;">
      	<shiro:hasPermission name="role_add">  
        	<li> <a class="button border-main icon-plus-square-o" href="javascript:void(0);" onclick="toAdd()">添加权限</a> </li>
      	</shiro:hasPermission>
      </ul>
    </div>
    <table class="table table-hover text-center">
      <tr>
        <th>序号</th>
		<th>角色名称</th>
		<th>角色描述</th>
		<th>用户名称</th>
		<th>人数</th>
		<th>状态</th>
		<th>操作</th>
      </tr>
      <c:forEach items="${roleList}" var="role" varStatus="status">
			<tr>
	          <td>${(page.currPage - 1) * page.pageRows + status.index+1}</td>
	          <td>${role.roleName}</td>
	          <td>${role.roleDesc}</td>
	          <td>
	          <div style="width:500px">
	          ${role.userNames }
	          </div>
	          </td>
	          <td>${role.userAmount }</td>
	          <td>
	          	<c:if test="${role.status == 0 }"><span class="label label-success radius">已启用</span></c:if>
	          	<c:if test="${role.status == 1 }"><span class="label label-defaunt radius">已停用</span></c:if>
	          </td>
	          <td class="button-group">
	           <shiro:hasPermission name="role_edit">
	           	<a class="button border-main" onclick="edit('${role.id}')" href="javascript:;">
          			<span class="icon-edit"></span> 修改
          		</a>
          		</shiro:hasPermission>
          		<shiro:hasPermission name="role_sq">
          		<a class="button border-yellow" href="javascript:void(0)" onclick="auth ('${role.id}')">
          			<span class="icon-users"></span> 授权
          		</a>
		       </shiro:hasPermission> 
	          </td>
			</tr>
		</c:forEach>
    </table>
  </div>
	<script type="text/javascript">
	function toAdd(){
		window.location.href="role/toAdd";
	}
	function edit(id){
		window.location.href="role/toedit/"+id;
	}
	function auth(id){
		window.location.href="role/toauth/"+id;
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