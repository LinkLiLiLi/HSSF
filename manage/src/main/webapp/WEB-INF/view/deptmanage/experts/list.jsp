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
<form action="experts/list" method="post" id="expertsId">
  <div class="panel admin-panel">
    <div class="panel-head"><strong class="icon-reorder">&nbsp;&nbsp;内容列表</strong></div>
    <div class="padding border-bottom">
      <ul class="search" style="padding-left:10px;">
      	<shiro:hasPermission name="experts_add">
        	<li> <a class="button border-main icon-plus-square-o" href="javascript:void(0);" id="member_add" onclick="toAdd()">添加专家</a> </li>
        </shiro:hasPermission>
        <li>搜索：</li>
        <li>
          <input type="text" placeholder="输入专家姓名" name="userName" class="input" style="width:250px; line-height:17px;display:inline-block"  value="${userName}" />
          <a href="javascript:void(0)" class="button border-main icon-search" onclick="searchExperts();"> 搜索</a></li>
      </ul>
    </div>
    <table class="table table-hover text-center">
      <tr>
        <th>序号</th>
		<th>专家名称</th>
		<th>性别</th>
		<th>身份证号</th>
		<th>单位</th>
		<th>职称</th>
		<th>电话</th>
		<th>邮箱</th>
		<th>操作</th>
      </tr>
      <c:forEach items="${expertsList}" var="experts" varStatus="status">
			<tr>
	          <td>${(page.currPage - 1) * page.pageRows + status.index+1}</td>
	          <td><a href="javascript:void(0)" onclick="detail('${experts.id}')">${experts.userName}</a></td>
	          <td>
	          	<c:if test="${experts.gender == 0 }">男</c:if>
				<c:if test="${experts.gender == 1 }">女</c:if>
			  </td>
	          <td>${experts.idCard }</td>
	          <td>${experts.unit }</td>
	          <td>${experts.title }</td>
	          <td>${experts.phoneNumber }</td>
	          <td>${experts.email }</td>
	          <td class="td-manage" style="width:200px">
	          	<div class="button-group">
		          <shiro:hasPermission name="experts_edit">
		          		<a class="button border-main" onclick="edit('${experts.id}')" href="javascript:;">
		          			<span class="icon-edit"></span> 修改
		          		</a>
	          		</shiro:hasPermission>
	          		<shiro:hasPermission name="experts_delete">
	          		<a class="button border-red" onclick="todel('${experts.id}')" href="javascript:;">
	         			<span class="icon-trash-o"></span> 删除
	         		</a>
	         		</shiro:hasPermission>
	         	</div>
	          </td>
			</tr>
		</c:forEach>
      	<jsp:include page="../../include/page.jsp">
      		<jsp:param value="10" name="colspan"/>
      	</jsp:include>
    </table>
  </div>
</form>
	<script type="text/javascript">
		function toAdd(){
			window.location.href="experts/toAdd";
		}
		function searchExperts(){
			$("#expertsId").submit();
		}
		function detail(id){
			window.location.href="experts/detail/"+id;
		}
		function edit(id){
			window.location.href="experts/toedit/"+id;
		}
		function todel(id) {
			if(confirm("确认删除？")){
				$.post("common/del",{"id":id,"entry" :"Experts"},function(data){
					if(data == 0) {
						alert("删除成功！");
					} else {
						alert("删除失败！");
					}
					window.location.reload(); 
				});
			}
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