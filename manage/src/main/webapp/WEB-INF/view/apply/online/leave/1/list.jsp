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
	<title>学生请假登记</title>
	<link rel="stylesheet" href="css/pintuer.css">
	<link rel="stylesheet" href="css/admin.css">
	<script src="js/jquery.js"></script>
	<script src="js/pintuer.js"></script>
	<script src="laydate/laydate.js"></script>
</head>
<body>
<form action="apply/online/leave/1/list" method="post" id="searchForm">
  <jsp:include page="../../include.jsp"/>
  <div class="panel admin-panel">
    <div class="panel-head cl">
    	<strong class="icon-reorder">&nbsp;&nbsp;内容列表</strong>
    </div>
    <div class="padding border-bottom">
      <ul class="search" style="padding-left:10px;">
        <shiro:hasPermission name="apply_leave1_add">
        <li> <a class="button border-main icon-plus-square-o" href="javascript:void(0);" onclick="toadd()">学生请假登记</a> </li>
        </shiro:hasPermission>
        <li>搜索：</li>
        <li>
          <input type="text" placeholder="请输入学生姓名" name="userName" class="input" style="width:200px; line-height:17px;display:inline-block;margin-left: 5px;"  value="${userName }" />
          <a href="javascript:void(0)" class="button border-main icon-search" onclick="changesearch()" > 搜索</a></li>
      </ul>
    </div>
    <table class="table table-hover text-center">
      <tr>
        <th>序号</th>
		<th>申请人</th>
		<th>所属小组</th>
		<th>填写时间</th>
		<th>请假类别</th>
		<th>请假事由及去向</th>
		<th>联系电话</th>
		<th>紧急联系人及联系电话</th>
		<th>请假开始时间</th>
		<th>请假结束时间</th>
		<th>操作</th>
      </tr>
      <c:forEach items="${leaveList}" var="leave" varStatus="status">
			<tr>
	          <td>${(page.currPage - 1) * page.pageRows + status.index+1}</td>
	          <td>${leave.user.name }</td>
	          <td>${leave.user.userGroupName }</td>
	          <td>
	          	${leave.applyTime }
	          </td>
	          <td>
	          	<c:if test="${leave.leaveType == 1 }">公差</c:if>
	          	<c:if test="${leave.leaveType == 2 }">病假</c:if>
	          	<c:if test="${leave.leaveType == 3 }">事假</c:if>
	          	<c:if test="${leave.leaveType == 4 }">其他</c:if>
	          </td>
	          <td>${leave.reason}</td>
	          <td>${leave.phoneNumber}</td>
	          <td>${leave.contactUser }/${leave.contactMobile }</td>
	          <td><fmt:formatDate value="${leave.beginTime }" pattern="yyyy-MM-dd HH"/></td>
	          <td><fmt:formatDate value="${leave.endTime }" pattern="yyyy-MM-dd HH"/></td>
	          <td>
	            <div class="button-group">
		          	<shiro:hasPermission name="apply_leave1_edit">
			          	<a class="button border-main" onclick="toedit('${leave.id}')" href="javascript:;">
			       			<span class="icon-edit"></span> 编辑
			       		</a>
		          	</shiro:hasPermission>
		          	<shiro:hasPermission name="apply_leave1_print">
			          	<a class="button border-yellow" onclick="toprint('${leave.id}')" href="javascript:;">
			       			<span class="icon-print"></span> 打印
	       				</a>
		          	</shiro:hasPermission>
		          	<shiro:hasPermission name="apply_leave1_delete">
			          	<a class="button border-red" onclick="todel('${leave.id}')" href="javascript:;">
		         			<span class="icon-trash-o"></span> 删除
		         		</a>
	         		</shiro:hasPermission>
		          </div>
	          </td>
			</tr>
		</c:forEach>
      	<jsp:include page="../../../../include/page.jsp">
      		<jsp:param value="11" name="colspan"/>
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
				$.post("common/del",{"id":id,"entry" :"ApplyLeave"},function(data){
					if(data == 0) {
						alert("删除成功！");
					} else {
						alert("删除失败！");
					}
					window.location.reload(); 
				});
			}
		}
		function toadd(){
			window.location.href="apply/online/leave/1/toadd";
		}
		
		function toedit(id){
			window.location.href="apply/online/leave/1/toedit/"+ id;
		}
		
		$(function(){
	    	var msg = '${msg}';
	    	if(msg != '') {
	    		alert(msg);
	    	}
	    });
		function toprint(id){
			window.location.href="apply/online/leave/1/toprint/"+ id;
		}
		
	</script>
</body>
</html>