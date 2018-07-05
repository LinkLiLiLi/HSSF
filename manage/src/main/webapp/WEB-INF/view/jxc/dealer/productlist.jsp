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
<form action="jxc/dealer/list" method="post" id="searchForm">
  <div class="panel admin-panel">
    <div class="panel-head cl">
    	<strong class="icon-reorder">&nbsp;&nbsp;渠道商产品列表</strong>
    </div>
    <table class="table table-hover text-center">
      <tr>
        <th>序号</th>
		<th>产品</th>
		<th>品牌</th>
		<th>规格型号</th>
		<th>价格</th>
		<th>图纸</th>
      </tr>
      <c:forEach items="${storeList}" var="store" varStatus="status">
			<tr>
	          <td>${(page.currPage - 1) * page.pageRows + status.index+1}</td>
	          <td>${store.productType.typeName }</td>
	           <td>${store.brand }</td>
	          <td>
	          	<c:forEach items="${store.itemList }" var="item">
	          		${item.propertyName}-${item.propertyValue}&nbsp;&nbsp;&nbsp;
	          	</c:forEach>
	          </td>
	           <td>${store.prize }</td>
	           <td>
	          	<c:if test="${store.image != null}">
	          		<img src="productImage/${store.image }" style="width: 50px;height: 50px;">
	          	</c:if>
	          </td>
			</tr>
		</c:forEach>
    </table>
  </div>
</form>
	<script type="text/javascript">
		function changesearch(){
			$("#searchForm").submit();
		}
		
		function toAdd(){
			window.location.href="jxc/dealer/toadddealer";
		}
		
		function showproduct(id){
			window.location.href = "jxc/dealer/showproduct/"+id;
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