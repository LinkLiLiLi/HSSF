<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<%
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.setDateHeader("Expires", 0);
%>

<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Expires" content="0">
<base href="<%=request.getContextPath()%>/">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">
<title></title>
<link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css">
<link rel="stylesheet" href="css/tanchu.css">
<script src="js/jquery.js"></script>
<script src="js/pintuer.js"></script>
<script src="laydate/laydate.js"></script>
</head>
<body>
	<form action="workjoutanl/detail" method="post" id="searchForm">
		<div class="panel admin-panel">
			<div class="panel-head">
				<strong class="icon-reorder">&nbsp;&nbsp;工作日志</strong>
			</div>
			<div class="padding border-bottom">
				<ul class="search" style="padding-left: 10px;">

					<li><a class="button border-main icon-plus-square-o"
						href="javascript:void(0);" onclick="toAdd()">添加日志</a></li>

					<li>搜索：</li>
					<li><select name="userId" class="input w50"
						style="width: 200px; line-height: 17px;">
							<c:forEach items="${userList }" var="user">
								<option value="${user.id }"
									<c:if test="${user.id == userId}">selected</c:if>>${user.name }</option>
							</c:forEach>
					</select> <input type="text" placeholder="请输入开始时间" id="startTime"
						name="startTime" class="input"
						style="width: 200px; line-height: 17px; display: inline-block; margin-left: 4px;"
						value="${startTime}" /> <input type="text" placeholder="请输入结束时间"
						id="endTime" name="endTime" class="input"
						style="width: 200px; line-height: 17px; display: inline-block"
						value="${endTime}" /> <a href="javascript:void(0)"
						class="button border-main icon-search" onclick="changesearch()">
							搜索</a></li>
				
			
			<c:if test="${user.post==0 }">
			
				
					 <a href="javascript:void(0)"
						class="button border-main icon-search" onclick="changesearchtoday()">
							今日日志</a>
		
			
			</c:if>
			</ul>
			</div>
			<table class="table table-hover text-center">
				<tr>
					<th>序号</th>
					<th>姓名</th>
					<th>时间</th>
					<th>工作内容</th>
					<th>操作</th>
				</tr>
				<c:forEach items="${workJoutanlList}" var="workJoutanl"
					varStatus="status">
					<tr>
						<td style="width: 100px">${(page.currPage - 1) * page.pageRows + status.index+1}</td>
						<td style="width: 100px">${workJoutanl.user.name}</td>
						<td style="width: 100px"><fmt:formatDate
								value="${workJoutanl.joutanlDate }" pattern="yyyy-MM-dd" /></td>
						<td style="width: 200px">
							<div style="width: 500px">${workJoutanl.workContent }</div>
						</td>
						<td style="width: 100px">
							<div class="button-group">
								<c:if test="${sessionScope.user.id == workJoutanl.user.id }">
									<c:if
										test="${workJoutanl.joutanlDate>=monday&&workJoutanl.joutanlDate<=sunday }">
										<a class="button border-main"
											onclick="edit('${workJoutanl.id}')" href="javascript:;">
											<span class="icon-edit"></span>修改
										</a>
									</c:if>
								</c:if>
							</div>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div style="height: 30px;"></div>
		<div class="panel admin-panel">
			<div class="panel-head">
				<strong class="icon-reorder">&nbsp;&nbsp;工作计划</strong>
			</div>
			<table class="table table-hover text-center">
				<tr>
					<th>姓名</th>
					<th>组名</th>
					<th>开始时间</th>
					<th>结束时间</th>
					<th>内容</th>
					<th>安排人</th>
					<th>任务状态</th>
				</tr>
				<c:forEach items="${workPlanList}" var="workPlan" varStatus="status">
					<tr>
						<td>${workPlan.user.name}</td>
						<td>${workPlan.userGroup.groupName}</td>
						<td><fmt:formatDate value="${workPlan.beginTime }"
								pattern="yyyy-MM-dd" /></td>
						<td><fmt:formatDate value="${workPlan.endTime }"
								pattern="yyyy-MM-dd" /></td>
						<td>
						<div style="width:500px">${workPlan.content }</div>
						</td>
						<td>${workPlan.distUser.name }</td>
						<td><c:if test="${workPlan.evaluate == 0 }">已完成</c:if> <c:if
								test="${workPlan.evaluate == 1 }">未完成</c:if></td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</form>
	<div class='alertWindow' id="alertWindow">
		<div class="bg_table bg_table1 hide-box" id="rgxq">
			<b class='closeBtn' onclick='closeWindow()'>×</b>
			<h2
				style="display: block; width: 100%; text-align: center; font-weight: normal; margin-bottom: 5px;">进展情况</h2>
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
			elem : '#startTime',
			event : 'focus'
		});
		laydate.render({
			elem : '#endTime',
			event : 'focus'
		});
		laydate.render({
			elem : '#todayTime',
			event : 'focus'
		});
		function changesearch() {
			var startTime = $("#startTime").val();
			var endTime = $("#endTime").val();

			if (startTime == '') {
				alert("请输入开始时间");
				return;
			}

			if (endTime == '') {
				alert("请输入结束时间");
				return;
			}
		
			$("#searchForm").submit();
		}
		
		function changesearchtoday(){
			var date=new Date();
		     var year=date.getFullYear(); //获取当前年份
		     var mon=date.getMonth()+1; //获取当前月份
		     var da=date.getDate(); //获取当前日
		     if (mon >= 1 && mon <= 9) {
		         mon = "0" + mon;
		     }
		     if (da >= 0 && da <= 9) {
		         da = "0" + da;
		     }
		     var nowtime=year+"-"+mon+"-"+da;			
		     document.getElementById("startTime").value=nowtime;
			document.getElementById("endTime").value=nowtime;
		
			
            $("#searchForm").submit();
		}

		function toAdd() {
			window.location.href = "workjoutanl/toadd";
		}

		function edit(id) {
			window.location.href = "workjoutanl/toedit/" + id;
		}

		$(function() {
			var msg = '${msg}';

			if (msg != '') {
				alert(msg);
			}
		});
		function showProgress(id) {
			$.post("workplan/progress/" + id, function(data) {
				$.each(data, function(index, item) {
					var tr = "<tr>";
					tr += "<td>";
					tr += index + 1
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
		function closeWindow() {
			$("#alertWindow").hide();
			$("#rgxq").hide();
			$("#items").empty();
		}
	</script>
</body>
</html>