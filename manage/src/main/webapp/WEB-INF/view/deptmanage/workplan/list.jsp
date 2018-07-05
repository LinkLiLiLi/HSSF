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
	<link rel="stylesheet" href="css/tanchu.css">
	<script src="js/jquery.js"></script>
	<script src="js/pintuer.js"></script>
	<script src="laydate/laydate.js"></script>
	<style type="text/css">
		.cl:after {
			content:".";
            visibility:hidden;
            clear:both;
		}
	</style>
</head>
<body>
<form action="workplan/list" method="post" id="searchForm">
  <div class="panel admin-panel">
    <div class="panel-head cl">
    	<strong class="icon-reorder" style="float: left;">&nbsp;&nbsp;内容列表</strong>
    	<div style="float: right; margin-right: 10px;">
    		<span class="icon-desktop" style="color: green;">&nbsp;进行中</span>
	    	<span class="icon-certificate" style="color: red;">&nbsp;已完成</span>
	    	<span class="icon-bolt" style="color: #f90;">&nbsp;逾期</span>
    	</div>
    </div>
    <div class="padding border-bottom">
      <ul class="search" style="padding-left:10px;">
      
      <shiro:hasPermission name="plan_add">
        <li> <a class="button border-main icon-plus-square-o" href="javascript:void(0);" onclick="toadd()">创建计划</a> </li>
      </shiro:hasPermission>
        <li>搜索：</li>
        <li>
          <input type="text" placeholder="请输入计划内容" name="content" class="input" style="width:200px; line-height:17px;display:inline-block"  value="${content}" />
          <input type="text" placeholder="请输入姓名" name="userName" class="input" style="width:200px; line-height:17px;display:inline-block"  value="${userName}" />
          <input type="text" placeholder="请输入开始时间" id="startTime" name="startTime" class="input" style="width:200px; line-height:17px;display:inline-block"  value="${startTime}" />
          <input type="text" placeholder="请输入结束时间" id="endTime" name="endTime" class="input" style="width:200px; line-height:17px;display:inline-block"  value="${endTime}" />
          <a href="javascript:void(0)" class="button border-main icon-search" onclick="changesearch()" > 搜索</a></li>
      </ul>
    </div>
    <table class="table table-hover text-center">
      <tr>
        <th>序号</th>
		<th>姓名</th>
		<th>组名</th>
		<th>开始时间</th>
		<th>结束时间</th>
		<th>内容</th>
		<th>安排人</th>
		<th>任务状态</th>
		<th>操作</th>
      </tr>
      <c:forEach items="${workPlanList}" var="workPlan" varStatus="status">
			<tr>
	          <td>${(page.currPage - 1) * page.pageRows + status.index+1}</td>
	          <td>${workPlan.user.name}</td>
	          <td>${workPlan.userGroup.groupName}</td>
	          <td><fmt:formatDate value="${workPlan.beginTime }" pattern="yyyy-MM-dd"/></td>
	          <td><fmt:formatDate value="${workPlan.endTime }" pattern="yyyy-MM-dd"/></td>
	          <td style="width:200px">
	          	<div style="width:500px">${workPlan.content }</div>
	          </td>
	          <td>
	          	${workPlan.distUser.name }
	          </td>
	          <td>
	          	<c:if test="${workPlan.evaluate == 0 }">已完成</c:if>
	          	<c:if test="${workPlan.evaluate == 1 }">未完成</c:if>
	          </td>
	          <td>
	          	<div class="button-group">
	          		<c:if test="${workPlan.evaluate == 1 }">
		          		
		          		<shiro:hasPermission name="plan_edit">
		          			<c:if test="${sessionScope.user.id == workPlan.distUser.id }">
				          		<a class="button border-main" onclick="edit('${workPlan.id}')" href="javascript:;">
				          			<span class="icon-edit"></span> 修改
				          		</a>
				          	</c:if>
		          		</shiro:hasPermission>
		          		<shiro:hasPermission name="plan_audi">
				          <c:if test="${sessionScope.user.id == workPlan.distUser.id }">
					          <a class="button border-yellow" onclick="check('${workPlan.id}')" href="javascript:;">
				          		<span class="icon-tag"></span> 审核
				          	  </a> 
				          </c:if>
				      </shiro:hasPermission>
			      </c:if>
	          	</div>
	          </td>
			</tr>
		</c:forEach>
      	<jsp:include page="../../include/page.jsp">
      		<jsp:param value="11" name="colspan"/>
      	</jsp:include>
    </table>
  </div>
</form>
	<div class='alertWindow' id="alertWindow">
        <div class="bg_table bg_table1 hide-box" id="rgxq">
        	<b class= 'closeBtn'  onclick='closeWindow()'>×</b>
        	<h2 style="display:block;width:100%;text-align:center;font-weight:normal;margin-bottom:5px;">进展情况</h2>
        	<div class="content">	                    		
                <table class="table table-hover text-center">
                    <thead>
                        <tr>
                            <th>序号</th>
                            <th>进展时间</th>
                            <th>进展内容</th>
                        </tr>
                    </thead>
                    <tbody id="items">
                    	
                    </tbody>
                 </table>
        	</div>
         </div>
	</div>
	<script type="text/javascript">
		laydate.render({
		    elem: '#startTime',
		    event: 'focus' 
		});
		laydate.render({
		    elem: '#endTime',
		    event: 'focus' 
		});
		function changesearch(){
			$("#searchForm").submit();
		}
		
		function toadd(){
			window.location.href="workplan/toadd";
		}
		
		function progress(id){
			window.location.href = "workplan/tolog/"+id;
		}
		
		function edit(id){
			window.location.href = "workplan/toedit/"+id;
		}
		function check(id){
			window.location.href = "workplan/tocheck/"+id;
		}
		
		$(function(){
	    	var msg = '${msg}';
	    	
	    	if(msg != '') {
	    		alert(msg);
	    	}
	    });
		
		function showProgress(id){
			$.post("workplan/progress/"+id,function(data){
				$.each(data,function(index, item){
					var tr = "<tr>";
					tr += "<td>";
					tr += index+1
					tr += "</td>";
					tr += "<td>";
					tr += item.str1
					tr += "</td>";
					tr += "<td>";
					tr += item.str2
					tr += "</td>";
					tr += "</tr>";
					
					$("#items").append(tr);
				});
			});			
			
			$("#alertWindow").show();
			$("#rgxq").show();
		}
		function closeWindow(){
			$("#alertWindow").hide();
			$("#rgxq").hide();
			$("#items").empty();
		}
	</script>
</body>
</html>