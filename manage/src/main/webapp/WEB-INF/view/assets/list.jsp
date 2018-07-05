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
<form action="assets/list" method="post" id="searchForm">
  <div class="panel admin-panel">
    <div class="panel-head cl">
    	<strong class="icon-reorder">&nbsp;&nbsp;资产列表</strong>
    </div>
    <div class="padding border-bottom">
      <ul class="search" style="padding-left:10px;">
        <shiro:hasPermission name="assets_add">
        	<li> <a class="button border-main icon-plus-square-o" href="javascript:void(0);" onclick="toAdd()">添加资产</a> </li>
        </shiro:hasPermission>
        <li>搜索：</li>
        <li>
          <input type="text" placeholder="输入资产名称" name="assetsName" class="input" style="width:200px; line-height:17px;display:inline-block"  value="${assetsName }" />
          <input type="text" placeholder="输入资产编号" name="assetsNumber" class="input" style="width:200px; line-height:17px;display:inline-block"  value="${assetsNumber }" />
          <a href="javascript:void(0)" class="button border-main icon-search" onclick="changesearch()" > 搜索</a></li>
      </ul>
    </div>
    <table class="table table-hover text-center">
      <tr>
        <th>序号</th>
		<th>名称</th>
		<th>固定资产编号</th>
		<th>价值</th>
		<th>购置时间</th>
		<th>类别</th>
		<th>所在地</th>
		<th>负责人</th>
		<th>状态</th>
		<th>是否固定资产</th>
		<th>操作</th>
      </tr>
      <c:forEach items="${assetsList}" var="assets" varStatus="status">
			<tr>
	          <td>${(page.currPage - 1) * page.pageRows + status.index+1}</td>
	          <td><a onclick="detail('${assets.id}')" href="javascript:void(0);">${assets.assetsName}</a></td>
	          <td>
	          	${assets.assetsNumber}
			  </td>
	          <td>${assets.prize }</td>
	          <td><fmt:formatDate value="${assets.buyDate }" pattern="yyyy-MM-dd"/></td>
	          <td>${assets.type }</td>
	          <td>${assets.location }</td>
	          <td>${assets.charge }</td>
	          <td>
				<c:if test="${assets.status == 1 }">正常</c:if>
				<c:if test="${assets.status == 2 }">报废</c:if>
			  </td>
			  <td>
				<c:if test="${assets.fixedAssets == 0 }">是</c:if>
				<c:if test="${assets.fixedAssets == 1 }">否</c:if>
			  </td>
	          <td class="td-manage">
	          <div class="button-group">
		          <shiro:hasPermission name="assets_edit">
			          <a class="button border-main" onclick="toedit('${assets.id}')" href="javascript:;">
	          			<span class="icon-edit"></span> 编辑
	          		</a>
			      </shiro:hasPermission>
			      <shiro:hasPermission name="assets_delete">
				      <a class="button border-red" onclick="todel('${assets.id}')" href="javascript:;">
	         			<span class="icon-trash-o"></span> 删除
	         		  </a>
         		</shiro:hasPermission>
	          </div>
	          </td>
			</tr>
		</c:forEach>
      	<jsp:include page="../include/page.jsp">
      		<jsp:param value="11" name="colspan"/>
      	</jsp:include>
    </table>
  </div>
</form>
	<script type="text/javascript">
		function changesearch(){
			$("#searchForm").submit();
		}
		
		function toAdd(){
			window.location.href="assets/toadd";
		}
		
		function toedit(id){
			window.location.href = "assets/toedit/"+id;
		}
		
		function detail(id){
			window.location.href="assets/detail/"+id;
		}
		function todel(id) {
			if(confirm("确认删除？")){
				$.post("common/del",{"id":id,"entry" :"Assets"},function(data){
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