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
<form action="apply/form/list" method="post" id="searchForm">
  <div class="panel admin-panel">
    <div class="panel-head cl">
    	<strong class="icon-reorder">&nbsp;&nbsp;常用表单</strong>
    </div>
    <div class="padding border-bottom">
      <ul class="search" style="padding-left:10px;">
        <shiro:hasPermission name="apply_online_add">
        	<li> <a class="button border-main icon-plus-square-o" href="javascript:void(0);" onclick="toAdd()">添加表单</a> </li>
        </shiro:hasPermission>
        <li>搜索：</li>
        <li>
          <input type="text" placeholder="输入表单名称" name="formName" class="input" style="width:200px; line-height:17px;display:inline-block"  value="${formName}" />
          <input type="text" placeholder="输入附件名称" name="fileName" class="input" style="width:200px; line-height:17px;display:inline-block"  value="${fileName }" />
          <a href="javascript:void(0)" class="button border-main icon-search" onclick="changesearch()" > 搜索</a></li>
      </ul>
    </div>
    <table class="table table-hover text-center">
      <tr>
        <th>序号</th>
		<th>表单名称</th>
		<th>描述</th>
		<th>附件</th>
		<th>添加时间</th>
		<th>发布人</th>
		<th>操作</th>
      </tr>
      <c:forEach items="${formList}" var="form" varStatus="status">
			<tr>
	          <td>${(page.currPage - 1) * page.pageRows + status.index+1}</td>
	          <td>${form.formName}</td>
	          <td>
	          	${form.content}
			  </td>
	          <td>${form.fileName }</td>
	          <td><fmt:formatDate value="${form.addTime }" pattern="yyyy-MM-dd"/></td>
	          <td>${form.user.name }</td>
	          <td class="td-manage">
		          <div class="button-group">
		          	<shiro:hasPermission name="apply_form_edit">
			          	<a class="button border-main" onclick="toedit('${form.id}')" href="javascript:;">
		         			<span class="icon-edit"></span> 编辑
		         		</a>
				      </shiro:hasPermission>
				      <shiro:hasPermission name="apply_form_down">
			      		<a class="button border-gray" onclick="down('${form.filePath}')" href="javascript:;">
		         			<span class="icon-download"></span> 下载
		         		</a>
				      </shiro:hasPermission>
				      <shiro:hasPermission name="apply_form_delete">
				      <a class="button border-red" onclick="todel('${form.id}')" href="javascript:;">
	         			<span class="icon-trash-o"></span> 删除
	         		</a>
	         		</shiro:hasPermission>
		          </div>
	          </td>
			</tr>
		</c:forEach>
      	<jsp:include page="../../include/page.jsp">
      		<jsp:param value="7" name="colspan"/>
      	</jsp:include>
    </table>
  </div>
</form>
	<script type="text/javascript">
		function changesearch(){
			$("#searchForm").submit();
		}
		
		function toAdd(){
			window.location.href="apply/form/toadd";
		}
		
		function toedit(id){
			window.location.href="apply/form/toedit/"+id;
		}
		
		function down(filePath){
			window.location.href = "<%=request.getContextPath() %>/upload/" + filePath;		
		}
		
		function todel(id) {
			if(confirm("确认删除？")){
				$.post("common/del",{"id":id,"entry" :"CommonForms"},function(data){
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