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
<form action="apply/online/salary/list" method="post" id="searchForm">
  <jsp:include page="../include.jsp"/>
  <div class="panel admin-panel">
    <div class="panel-head cl">
    	<strong class="icon-reorder">&nbsp;&nbsp;内容列表</strong>
    </div>
    <div class="padding border-bottom">
      <ul class="search" style="padding-left:10px;">
        <shiro:hasPermission name="apply_salary_add">
        <li> <a class="button border-main icon-plus-square-o" href="javascript:void(0);" onclick="toadd()">调薪登记</a> </li>
        </shiro:hasPermission>
        <li>搜索：</li>
        <li>
          <input type="text" placeholder="请输入姓名" name="userName" class="input" style="width:200px; line-height:17px;display:inline-block"  value="${userName }" />
          <a href="javascript:void(0)" class="button border-main icon-search" onclick="changesearch()" > 搜索</a></li>
      </ul>
    </div>
    <table class="table table-hover text-center">
      <tr>
        <th>序号</th>
		<th>所属部门</th>
		<th>姓名</th>
		<th>学历/位</th>
		<th>入中心时间</th>
		<th>编制</th>
		<th>职称</th>
		<th>现岗位津贴</th>
		<th>月工资</th>
		<th>调整后岗贴</th>
		<th>调整后月工资</th>
		<th>变动日期</th>
		<th>申请日期</th>
		<th>操作</th>
      </tr>
      <c:forEach items="${salaryList}" var="salary" varStatus="status">
			<tr>
	          <td>${(page.currPage - 1) * page.pageRows + status.index+1}</td>
	          <td>${salary.dept }</td>
	          <td>${salary.userName }</td>
	          <td>
	          	${salary.education}
	          </td>
	          <td>
	          	${salary.centerTime}
	          </td>
	          <td>${salary.organization }</td>
	          <td>${salary.titleName }</td>
	          <td>${salary.beforeAmount }</td>
	          <td>${salary.beforeWages }</td>
	          <td>${salary.afterAmount }</td>
	          <td>${salary.afterWages }</td>
	          <td>${salary.changeTime }</td>
	          <td>${salary.applyTime }</td>
	          <td>
	            <div class="button-group">
		          	<shiro:hasPermission name="apply_salary_edit">
			          	<a class="button border-main" onclick="toedit('${salary.id}')" href="javascript:;">
				       			<span class="icon-edit"></span> 编辑
				       		</a>
		          	</shiro:hasPermission>
		          	<shiro:hasPermission name="apply_salary_print">
			          	<a class="button border-yellow" onclick="toprint('${salary.id}')" href="javascript:;">
				       			<span class="icon-print"></span> 打印
				       		</a>
		          	</shiro:hasPermission>
		          	<shiro:hasPermission name="apply_salary_delete">
		          	<a class="button border-red" onclick="todel('${salary.id}')" href="javascript:;">
	         			<span class="icon-trash-o"></span> 删除
	         		</a>
	         		</shiro:hasPermission>
		          </div>
	          </td>
			</tr>
		</c:forEach>
      	<jsp:include page="../../../include/page.jsp">
      		<jsp:param value="14" name="colspan"/>
      	</jsp:include>
    </table>
  </div>
</form>
	<script type="text/javascript">
		function changesearch(){
			$("#searchForm").submit();
		}
		
		function toadd(){
			window.location.href="apply/online/salary/toadd";
		}
		function todel(id) {
			if(confirm("确认删除？")){
				$.post("common/del",{"id":id,"entry" :"ApplySalary"},function(data){
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
			window.location.href="apply/online/salary/toedit/"+ id;
		}
		
		$(function(){
	    	var msg = '${msg}';
	    	if(msg != '') {
	    		alert(msg);
	    	}
	    });
		function toprint(id){
			window.location.href="apply/online/salary/toprint/"+ id;
		}
	</script>
</body>
</html>