<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
<form action="funds/remuneration/list" method="post" id="searchForm">
  <div class="panel admin-panel">
    <div class="panel-head cl">
    	<strong class="icon-reorder">&nbsp;&nbsp;内容列表</strong>
    </div>
    <div class="padding border-bottom">
      <ul class="search" style="padding-left:10px;">
        <shiro:hasPermission name="funds_remuneration_add">
        	<li> <a class="button border-main icon-plus-square-o" href="javascript:void(0);" onclick="toadd()">劳务计算</a> </li>
        </shiro:hasPermission>
        <li>搜索：</li>
        <li>
          <input type="text" placeholder="请输入标题" name="title" class="input" style="width:200px; line-height:17px;display:inline-block"  value="${title }" />
          <input type="text" placeholder="请输入关键字" name="keyWords" class="input" style="width:200px; line-height:17px;display:inline-block"  value="${keyWords }" />
          <a href="javascript:void(0)" class="button border-main icon-search" onclick="changesearch()" > 搜索</a></li>
      </ul>
    </div>
    <table class="table table-hover text-center">
      <tr>
        <th>序号</th>
        <th>标题</th>				
		<th>申请时间</th>
		<th>数据条数</th>
		<th>状态</th>
		<th>操作</th>
      </tr>
      <c:forEach items="${remunerationList}" var="record" varStatus="status">
     <tr>
      <td>${(page.currPage - 1) * page.pageRows + status.index+1}</td>
      <td>${record.title}</td>
      <td><fmt:formatDate value="${record.applyDate }" pattern="yyyy-MM-dd"/></td>
      <td>${fn:length(record.detailList)}</td>
      <td>
      	<c:if test="${record.status == null }">未提交审核</c:if>
      	<c:if test="${record.status == 0 }">已提交审核</c:if>
      	<c:if test="${record.status == 1 }">审核通过</c:if>
      	<c:if test="${record.status == 2 }">审核不通过</c:if>
      </td>
      <td class="td-manage">
      	<div class="button-group">
       		<c:if test="${record.status == null || record.status == 2}">
       			<shiro:hasPermission name="funds_remuneration_edit">
	       		<a class="button border-main" onclick="toedit('${record.id}')" href="javascript:;">
	       			<span class="icon-edit"></span> 编辑
	       		</a>
	       		</shiro:hasPermission>
	       		<shiro:hasPermission name="funds_remuneration_sub">
       			<a class="button border-green" onclick="subaudit('${record.id}')" href="javascript:;">
	       			<span class="icon-rocket"></span> 提交审核
	       		</a>
	       		</shiro:hasPermission>
	       		<shiro:hasPermission name="funds_remuneration_delete">
	       		<a class="button border-red" onclick="todel('${record.id}')" href="javascript:;">
	       			<span class="icon-trash-o"></span> 删除
	       		</a>
	       		</shiro:hasPermission>
       		</c:if>
       		
       		<c:if test="${record.status == 0 }">
	       		<shiro:hasPermission name="funds_remuneration_audit">
       			<a class="button border-dot" onclick="toaudit('${record.id}')" href="javascript:;">
	       			<span class="icon-rocket"></span> 审核
	       		</a>
	       		</shiro:hasPermission>
       		</c:if>
       		</div>
       </td>
     </tr>
     </c:forEach>
      	<jsp:include page="../../include/page.jsp">
      		<jsp:param value="6" name="colspan"/>
      	</jsp:include>
    </table>
  </div>
</form>
	<script type="text/javascript">
		function changesearch(){
			$("#searchForm").submit();
		}
		
		function toadd(){
			window.location.href="funds/remuneration/toadd";
		}
		
		function todel(id) {
			if(confirm("确认删除？")){
				$.post("common/del",{"id":id,"entry" :"ApplyRemuneration"},function(data){
					if(data == 0) {
						alert("删除成功！");
					} else {
						alert("删除失败！");
					}
					window.location.reload(); 
				});
			}
		}
		function toedit(id){
			window.location.href = "funds/remuneration/toedit/"+id;
		}
		
		$(function(){
	    	var msg = '${msg}';
	    	if(msg != '') {
	    		alert(msg);
	    	}
	    });
		function toprint(id){
			window.location.href = "funds/remuneration/toprint/"+id;
		}
		function toaudit(id){
			window.location.href = "funds/remuneration/toaudit/"+id;
		}
		function subaudit(id){
			if(confirm("确认提交审核？")){
				window.location.href = "funds/remuneration/sub/"+id;
			}
		}
	</script>
</body>
</html>