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
	<title>外拨经费</title>
	<link rel="stylesheet" href="css/pintuer.css">
	<link rel="stylesheet" href="css/admin.css">
	<script src="js/jquery.js"></script>
	<script src="js/pintuer.js"></script>
</head>
<body>
<form action="funds/out/list" method="post" id="expertsId">
  <div class="panel admin-panel">
    <div class="panel-head"><strong class="icon-reorder">&nbsp;&nbsp;内容列表</strong></div>
    <div class="padding border-bottom">
      <ul class="search" style="padding-left:10px;">
      	<shiro:hasPermission name="funds_out_add">
        	<li> <a class="button border-main icon-plus-square-o" href="javascript:void(0);" id="member_add" onclick="toAdd()">外拨经费</a> </li>
        </shiro:hasPermission>
        <li>搜索：</li>
        <li>
          <select name="projectId" class="input w50" style="width: 250px;">
          	<option value="">全部</option>
          	<c:forEach items="${projectList }" var="project">
          		<option <c:if test="${project.id == projectId}">selected</c:if> value="${project.id }">${project.projectName }</option>
          	</c:forEach>
          </select>
          
          <a href="javascript:void(0)" class="button border-main icon-search" onclick="searchExperts();"> 搜索</a></li>
      </ul>
    </div>
    <table class="table table-hover text-center">
      <tr>
        <th>序号</th>
		<th>时间</th>
		<th>支出项目</th>
		<th>收款单位 </th>
		<th>金额</th>
		<th>经办人</th>
		<th>备注</th>
		<th>操作</th>
      </tr>
      <c:forEach items="${outList}" var="out" varStatus="status">
			<tr>
	          <td>${(page.currPage - 1) * page.pageRows + status.index+1}</td>
	          <td><fmt:formatDate value="${out.outTime }" pattern="yyyy-MM-dd"/></td>
	          <td>${out.project.projectName }</td>
	          <td>${out.unit }</td>
	          <td>${out.amount }</td>
	          <td>${out.dealMan }</td>
	          <td>${out.remark }</td>
	          <td>
		          <div  class="button-group">
		          	<shiro:hasPermission name="funds_out_edit">
		          		<a class="button border-main" onclick="edit('${out.id}')" href="javascript:;">
	          				<span class="icon-edit"></span> 修改
	          		 	</a>
	          		 </shiro:hasPermission>
	          		 <shiro:hasPermission name="funds_out_delete">
	          		    <a class="button border-red" onclick="todel('${out.id}')" href="javascript:;">
		         			<span class="icon-trash-o"></span> 删除
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
		function toAdd(){
			window.location.href="funds/out/toadd";
		}
		function searchExperts(){
			$("#expertsId").submit();
		}
		function todel(id) {
			if(confirm("确认删除？")){
				$.post("common/del",{"id":id,"entry" :"DialOutFund"},function(data){
					if(data == 0) {
						alert("删除成功！");
					} else {
						alert("删除失败！");
					}
					window.location.reload(); 
				});
			}
		}
		function edit(id){
			window.location.href="funds/out/toedit/"+id;
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