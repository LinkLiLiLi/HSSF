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
<form action="jxc/production/list" method="post" id="searchForm">
  <div class="panel admin-panel">
    <div class="panel-head cl">
    	<strong class="icon-reorder">&nbsp;&nbsp;生产列表</strong>
    </div>
    <div class="padding border-bottom">
      <ul class="search" style="padding-left:10px;">
        <shiro:hasPermission name="jxc_production_add">
        <li> <a class="button border-main icon-plus-square-o" href="javascript:void(0);" onclick="toAdd()">&nbsp;下生产单</a> </li>
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
          <input type="text" placeholder="输入用途" name="purpose" class="input" style="width:200px; line-height:17px;display:inline-block"  value="${purpose }" />
          <a href="javascript:void(0)" class="button border-main icon-search" onclick="changesearch()" > 搜索</a></li>
      </ul>
    </div>
    <table class="table table-hover text-center">
      <tr>
        <th>序号</th>
		<th>产品名称</th>
		<th>规格/型号</th>
		<th>数量</th>
		<th>用途</th>
		<th>出库状态</th>
		<th>出库时间</th>
		<th>入库状态</th>
		<th>入库时间</th>
		<th>操作</th>
      </tr>
      <c:forEach items="${productionList}" var="production" varStatus="status">
			<tr>
	          <td>${(page.currPage - 1) * page.pageRows + status.index+1}</td>
	          <td>${production.productType.typeName }</td>
	          <td>${production.model}</td>
	          <td>${production.amount }</td>
	          <td>${production.purpose }</td>
	          <td>
	          	<c:if test="${production.outStatus == 0}">未出库</c:if>
	          	<c:if test="${production.outStatus == 1}">已出库</c:if>
	          </td>
	          <td>${production.outTime }</td>
	          <td>
	          	<c:if test="${production.incomeStatus == 0}">未入库</c:if>
	          	<c:if test="${production.incomeStatus == 1}">已入库</c:if>
	          </td>
	          <td>${production.useTime }</td>
	          <td class="td-manage">
	          	<div class="button-group">
			        <c:if test="${production.outStatus == 0 && production.incomeStatus == 0}">
			        	<shiro:hasPermission name="jxc_production_edit">
			        	<a class="button border-main" onclick="toedit('${production.id}')" href="javascript:;">
		          			<span class="icon-edit"></span> 编辑
		          		</a>
		          		</shiro:hasPermission>
		          		<shiro:hasPermission name="jxc_production_delete">
		          		<a class="button border-red" onclick="todel('${production.id}')" href="javascript:;">
		         			<span class="icon-trash-o"></span> 删除
		         		</a>
		         		</shiro:hasPermission>
			        </c:if>
			        <c:if test="${production.outStatus == 0}">
			        	<shiro:hasPermission name="jxc_production_out">
			        	<a class="button border-yellow" onclick="outstore('${production.id}')" href="javascript:;">
		          			<span class="icon-outdent"></span> 出库
		          		</a>
		          		</shiro:hasPermission>
			        </c:if>
			        <c:if test="${production.incomeStatus == 0 && production.outStatus == 1}">
			        	<shiro:hasPermission name="jxc_production_income">
			        	<a class="button border-green" onclick="incomestore('${production.id}')" href="javascript:;">
		          			<span class="icon-indent"></span> 入库
		          		</a>
		          		</shiro:hasPermission>
			        </c:if>
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
		function changesearch(){
			$("#searchForm").submit();
		}
		
		function toAdd(){
			window.location.href="jxc/production/toadd";
		}
		function toedit(id){
			window.location.href="jxc/production/toedit/"+id;
		}
		
		function todel(id) {
			if(confirm("确认删除？")){
				$.post("common/del",{"id":id,"entry" :"Production"},function(data){
					if(data == 0) {
						alert("删除成功！");
					} else {
						alert("删除失败！");
					}
					window.location.reload(); 
				});
			}
		}
		
		function outstore(id){
			if(confirm("确认出库？")) {
				window.location.href="jxc/production/outstore/"+id;
			}
		}
		
		function incomestore(id){
			if(confirm("确认入库？")) {
				window.location.href = "jxc/production/incomestore/"+id;
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