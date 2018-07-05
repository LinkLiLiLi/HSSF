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
<form action="jxc/purchase/list" method="post" id="searchForm">
  <div class="panel admin-panel">
    <div class="panel-head cl">
    	<strong class="icon-reorder">&nbsp;&nbsp;采购申请列表</strong>
    </div>
    <div class="padding border-bottom">
      <ul class="search" style="padding-left:10px;">
        <shiro:hasPermission name="jxc_purchase_add">
        	<li> <a class="button border-main icon-plus-square-o" href="javascript:void(0);" onclick="toAdd()">添加采购单</a> </li>
        </shiro:hasPermission>
        <li>搜索：</li>
        <li>
          <input type="text" placeholder="输入产品名称" name="productName" class="input" style="width:200px; line-height:17px;display:inline-block"  value="${productName }" />
          <input type="text" placeholder="输入用途" name="purpose" class="input" style="width:200px; line-height:17px;display:inline-block"  value="${purpose }" />
          <a href="javascript:void(0)" class="button border-main icon-search" onclick="changesearch()" > 搜索</a></li>
      </ul>
    </div>
    <table class="table table-hover text-center">
      <tr>
        <th>序号</th>
		<th>产品名称</th>
		<th>用途</th>
		<th>申请时间</th>
		<th>截止时间</th>
		<th>最近一次审核意见</th>
		<th>操作</th>
      </tr>
      <c:forEach items="${applyList}" var="apply" varStatus="status">
			<tr>
	          <td>${(page.currPage - 1) * page.pageRows + status.index+1}</td>
	          <td>${apply.productName }</td>
	          <td>${apply.purpose}</td>
	          <td><fmt:formatDate value="${apply.applyTime }" pattern="yyyy-MM-dd"/></td>
	          <td><fmt:formatDate value="${apply.endTime }" pattern="yyyy-MM-dd"/></td>
	          <td>${apply.auditMsg }</td>
	          <td class="td-manage">
	          	<div class="button-group">
			        <c:if test="${apply.status == 0}">
			        	<shiro:hasPermission name="jxc_purchase_edit">
			        	<a class="button border-main" onclick="toedit('${apply.id}')" href="javascript:;">
		          			<span class="icon-edit"></span> 编辑
		          		</a>
		          		</shiro:hasPermission>
		          		<shiro:hasPermission name="jxc_purchase_delete">
		          		<a class="button border-red" onclick="todel('${apply.id}')" href="javascript:;">
		         			<span class="icon-trash-o"></span> 删除
		         		</a>
		         		</shiro:hasPermission>
		          		<shiro:hasPermission name="jxc_purchase_sub">
			        	<a class="button border-main" onclick="subaudit('${apply.id}')" href="javascript:;">
		          			<span class="icon-edit"></span> 提交审核
		          		</a>
		          		</shiro:hasPermission>
			        </c:if>
			        <c:if test="${apply.status == 1}">
		          		<shiro:hasPermission name="jxc_purchase_audit">
			        	<a class="button border-yellow" onclick="audit('${apply.id}')" href="javascript:;">
				           <span class="icon-tag"></span> 审核
				        </a> 
				        </shiro:hasPermission>
			        </c:if>
			          
			        <c:if test="${sessionScope.user.post == 0 && apply.status == 2}"><!-- 主任 -->
		          		<shiro:hasPermission name="jxc_purchase_post_audit">
					      <a class="button border-yellow" onclick="audit('${apply.id}')" href="javascript:;">
				          	<span class="icon-tag"></span> 审核
				          </a> 
			          </shiro:hasPermission>
			        </c:if>
			        
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
		function todel(id) {
			if(confirm("确认删除？")){
				$.post("common/del",{"id":id,"entry" :"PurchaseApply"},function(data){
					if(data == 0) {
						alert("删除成功！");
					} else {
						alert("删除失败！");
					}
					window.location.reload(); 
				});
			}
		}
		function toAdd(){
			window.location.href="jxc/purchase/toaddapply";
		}
		function toedit(id){
			window.location.href="jxc/purchase/toeditapply/"+id;
		}
		
		function audit(id){
			window.location.href="jxc/purchase/toaudit/"+id;
		}
		
		function subaudit(id){
			window.location.href = "jxc/purchase/subaudit/"+id;
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