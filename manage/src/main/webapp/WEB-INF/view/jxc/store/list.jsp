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
<form action="jxc/store/list" method="post" id="searchForm">
  <div class="panel admin-panel">
    <div class="panel-head cl">
    	<strong class="icon-reorder">&nbsp;&nbsp;库存列表</strong>
    </div>
    <div class="padding border-bottom">
      <ul class="search" style="padding-left:10px;">
        <shiro:hasPermission name="jxc_store_add">
        <li> <a class="button border-main icon-plus-square-o" href="javascript:void(0);" onclick="toAdd()">添加库存</a> </li>
        </shiro:hasPermission>
        <shiro:hasPermission name="jxc_store_type_add">
        <li> <a class="button border-main icon-plus-square-o" href="javascript:void(0);" onclick="toAddStore()">添加商品</a> </li>
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
          <select name="dealerid" class="input">
          	<option value="">请选择渠道商</option>
          	<c:forEach items="${dealerList }" var="dealer">
          		<option value="${dealer.id }" <c:if test="${dealer.id ==dealerid}">selected</c:if>>${dealer.dealerName }</option>
          	</c:forEach>
          </select>
          </li>
          <li>
          <a href="javascript:void(0)" class="button border-main icon-search" onclick="changesearch()" > 搜索</a></li>
      </ul>
    </div>
    <table class="table table-hover text-center">
      <tr>
        <th>序号</th>
		<th>名称</th>
		<th>规格/型号</th>
		<th>数量</th>
		<th>存放地点</th>
		<th>品牌</th>
		<th>经销商</th>
		<th>价格</th>
		<th>图片</th>
		<th>操作</th>
      </tr>
      <c:forEach items="${storeList}" var="store" varStatus="status">
			<tr>
	          <td>${(page.currPage - 1) * page.pageRows + status.index+1}</td>
	          <td>${store.productType.typeName }</td>
	          <td>
	          	<c:forEach items="${store.itemList }" var="item">
	          		${item.propertyName}-${item.propertyValue}&nbsp;&nbsp;&nbsp;
	          	</c:forEach>
	          </td>
	          <td>${store.amount }</td>
	          <td>${store.storeAddr }</td>
	          <td>${store.brand }</td>
	          <td>${store.productDealer.dealerName }</td>
	          <td>${store.prize }</td>
	          <td>
	          	<c:if test="${store.image != null}">
	          		<img src="productImage/${store.image }" style="width: 50px;height: 50px;">
	          	</c:if>
	          </td>
	          <td class="td-manage">
	          	<div class="button-group">
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
			window.location.href="jxc/store/toaddstore";
		}
		function toAddStore(){
			window.location.href="jxc/store/toaddtype";
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