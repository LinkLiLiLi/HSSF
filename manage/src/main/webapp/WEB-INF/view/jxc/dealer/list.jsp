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
    	<strong class="icon-reorder">&nbsp;&nbsp;渠道商列表</strong>
    </div>
    <div class="padding border-bottom">
      <ul class="search" style="padding-left:10px;">
        <shiro:hasPermission name="jxc_dealer_add">
        <li> <a class="button border-main icon-plus-square-o" href="javascript:void(0);" onclick="toAdd()">添加渠道商</a> </li>
        </shiro:hasPermission>
        <li>搜索：</li>
        <li>
          <input type="text" placeholder="输入渠道商名称" name="dealerName" class="input" style="width:200px; line-height:17px;display:inline-block"  value="${dealerName }" />
          <a href="javascript:void(0)" class="button border-main icon-search" onclick="changesearch()" > 搜索</a></li>
      </ul>
    </div>
    <table class="table table-hover text-center">
      <tr>
        <th>序号</th>
		<th>经销商</th>
		<th>银行户头</th>
		<th>联系人</th>
		<th>联系电话</th>
		<th>联系地址</th>
		<th>操作</th>
      </tr>
      <c:forEach items="${dealerList}" var="dealer" varStatus="status">
			<tr>
	          <td>${(page.currPage - 1) * page.pageRows + status.index+1}</td>
	          <td>${dealer.dealerName }</td>
	          <td>${dealer.bankInfo}</td>
	          <td>${dealer.linkName }</td>
	          <td>${dealer.phoneNumber }</td>
	          <td>${dealer.linkAddr }</td>
	          <td class="td-manage">
	          	<div class="button-group">
			        <shiro:hasPermission name="jxc_dealer_edit">
			        <a class="button border-main" onclick="toeditdealer('${dealer.id}')" href="javascript:;">
	          			<span class="icon-edit"></span> 编辑
	          		</a>
	          		</shiro:hasPermission>
	          		<shiro:hasPermission name="jxc_dealer_show">
	          		<a class="button border-yellow" onclick="showproduct('${dealer.id}')" href="javascript:;">
	          			<span class="icon-reorder"></span> 查看产品
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