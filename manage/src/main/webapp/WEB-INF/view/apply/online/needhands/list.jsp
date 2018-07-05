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
	<title>中心用人申请表</title>
	<link rel="stylesheet" href="css/pintuer.css">
	<link rel="stylesheet" href="css/admin.css">
	<script src="js/jquery.js"></script>
	<script src="js/pintuer.js"></script>
	<script src="laydate/laydate.js"></script>
</head>
<body>
<form action="apply/online/needhands/list" method="post" id="searchForm">
  <jsp:include page="../include.jsp"/>
  <div class="panel admin-panel">
    <div class="panel-head cl">
    	<strong class="icon-reorder">&nbsp;&nbsp;内容列表</strong>
    </div>
    <div class="padding border-bottom">
      <ul class="search" style="padding-left:10px;">
        <shiro:hasPermission name="apply_needhands_add">
        <li> <a class="button border-main icon-plus-square-o" href="javascript:void(0);" onclick="toadd()">用人登记</a> </li>
        </shiro:hasPermission>
        <li>搜索：</li>
        <li>
          <input type="text" placeholder="请输入拟聘人姓名" name="userName" class="input" style="width:200px; line-height:17px;display:inline-block;margin-left: 5px;"  value="${userName }" />
          <a href="javascript:void(0)" class="button border-main icon-search" onclick="changesearch()" > 搜索</a></li>
      </ul>
    </div>
    <table class="table table-hover text-center">
      <tr>
        <th>序号</th>
		<th>用人部门</th>
		<th>申请日期</th>
		<th>聘用岗位</th>
		<th>聘用方式</th>
		<th>拟聘人姓名</th>
		<th>拟聘人学历</th>
		<th>入职日期</th>
		<th>合同期限</th>
		<th>试用期期限</th>
		<th>操作</th>
      </tr>
      <c:forEach items="${needHandsList}" var="needhands" varStatus="status">
			<tr>
	          <td>${(page.currPage - 1) * page.pageRows + status.index+1}</td>
	          <td>${needhands.dept }</td>
	          <td>${needhands.applyDate }</td>
	          <td>
	          	<c:if test="${needhands.post == 1 }">科研</c:if>
	          	<c:if test="${needhands.post == 2 }">管理</c:if>
	          	<c:if test="${needhands.post == 3 }">技术开发</c:if>
	          	<c:if test="${needhands.post == 4 }">科研辅助</c:if>
	          </td>
	          <td>
	          	<c:if test="${needhands.employType == 1 }">事业</c:if>
	          	<c:if test="${needhands.employType == 2 }">企业(派得/农芯)</c:if>
	          	<c:if test="${needhands.employType == 3 }">合同</c:if>
	          	<c:if test="${needhands.employType == 4 }">博士后</c:if>
	          </td>
	          <td>${needhands.userName }</td>
	          <td>${needhands.education }</td>
	          <td>${needhands.joinDate }</td>
	          <td>${needhands.termAmount }年</td>
	          <td>${needhands.trialAmount }月</td>
	          <td>
	          	<div class="button-group">
		          	<shiro:hasPermission name="apply_needhands_edit">
			          	<a class="button border-main" onclick="toedit('${needhands.id}')" href="javascript:;">
			       			<span class="icon-edit"></span> 编辑
			       		</a>
		          	</shiro:hasPermission>
		          	<shiro:hasPermission name="apply_needhands_print">
			          	<a class="button border-yellow" onclick="toprint('${needhands.id}')" href="javascript:;">
			       			<span class="icon-print"></span> 打印
	       				</a>
		          	</shiro:hasPermission>
		          	<shiro:hasPermission name="apply_needhands_delete">
		          	<a class="button border-red" onclick="todel('${needhands.id}')" href="javascript:;">
	         			<span class="icon-trash-o"></span> 删除
	         		</a>
	         		</shiro:hasPermission>
		          </div>
	          </td>
			</tr>
		</c:forEach>
      	<jsp:include page="../../../include/page.jsp">
      		<jsp:param value="11" name="colspan"/>
      	</jsp:include>
    </table>
  </div>
</form>
	<script type="text/javascript">
		function changesearch(){
			$("#searchForm").submit();
		}
		
		function toadd(){
			window.location.href="apply/online/needhands/toadd";
		}
		
		function toedit(id){
			window.location.href="apply/online/needhands/toedit/"+ id;
		}
		
		$(function(){
	    	var msg = '${msg}';
	    	if(msg != '') {
	    		alert(msg);
	    	}
	    });
		function toprint(id){
			window.location.href="apply/online/needhands/toprint/"+ id;
		}
		function todel(id) {
			if(confirm("确认删除？")){
				$.post("common/del",{"id":id,"entry" :"ApplyNeedHands"},function(data){
					if(data == 0) {
						alert("删除成功！");
					} else {
						alert("删除失败！");
					}
					window.location.reload(); 
				});
			}
		}
	</script>
</body>
</html>