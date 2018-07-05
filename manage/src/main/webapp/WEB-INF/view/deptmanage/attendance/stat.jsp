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
    <title>考勤统计</title>  
    <link rel="stylesheet" href="css/pintuer.css">
    <link rel="stylesheet" href="css/admin.css">
    <script src="js/jquery.js"></script>
    <script src="js/pintuer.js"></script>
    <script src="laydate/laydate.js"></script>  
    <script src="js/highcharts.js"></script>
	<script src="js/highcharts-3d.js"></script>
	<script src="js/exporting.js"></script>
</head>
<body>
<div class="panel admin-panel">
	<div class="panel-head"><strong class="icon-reorder">&nbsp;&nbsp;考勤统计</strong></div>
  <div class="body-content">
	<div id="container" style = "float: left;width: 48%"></div>
	<div style = "float: left;width: 48%; border: solid 1px #EEE">
		<table class="table table-hover text-center">
      <tr>
        <th>序号</th>
		<th>用户姓名</th>
		<th>异常原因</th>
      </tr>
      <c:forEach items="${yestoday}" var="today" varStatus="status">
      	<tr>
          <td>${status.index+1}</td>
          <td>${today.username}</td>
          <td>${today.reason }</td>
        </tr>
      </c:forEach>
      </table>
	</div>
  </div>
</div>
<div class="panel admin-panel">
	<div class="panel-head"><strong class="icon-reorder">&nbsp;&nbsp;${dataTime}考勤明细</strong></div>
    <form action="attendance/stat" method="post" id="searchForm">
    	<div class="padding border-bottom">
	      <ul class="search" style="padding-left:10px;">
	       	<shiro:hasPermission name="attendance_set">
	       		<li> <a class="button border-main icon-plus-square-o" href="javascript:void(0);" id="member_add" onclick="toSet()">考勤组设置</a> </li>
	        </shiro:hasPermission>
	        <shiro:hasPermission name="attendance_add">
	       		<li> <a class="button border-main icon-plus-square-o" href="javascript:void(0);" id="member_add" onclick="toAdd()">考勤填报</a> </li>
	        </shiro:hasPermission>
	        <li>搜索：</li>
	        <li>
	          <input type="text" placeholder="考勤日期" id="startTime" name="startTime" class="input" style="width:200px; line-height:17px;display:inline-block"  value="${dataTime}" />
	          <a href="javascript:void(0)" class="button border-main icon-search" onclick="searchExperts();"> 搜索</a></li>
	      </ul>
	    </div>
    </form>
	<table class="table table-hover text-center">
      <tr>
        <th>序号</th>
		<th>用户姓名</th>
		<th>早打卡</th>
		<th>晚打卡</th>
		<th>请假</th>
		<th>出差</th>
		<th>外出</th>
		<th>旷工</th>
		<th>加班</th>
      </tr>
      <c:forEach items="${statList}" var="stat" varStatus="status">
      	<tr>
          <td>${status.index+1}</td>
          <td>${stat.user.name}</td>
          <td>
          	<c:if test="${stat.zaodaka == 0}">正常</c:if>
          	<c:if test="${stat.zaodaka == 1}">异常</c:if>
          </td>
          <td>
          	<c:if test="${stat.wandaka == 0}">正常</c:if>
          	<c:if test="${stat.wandaka == 1}">异常</c:if>
          </td>
          <td>
          	<c:if test="${stat.qingjia == 1}">请假</c:if>
          </td>
          <td>
          	<c:if test="${stat.chuchai == 1}">出差</c:if>
          </td>
          <td>
          	<c:if test="${stat.waichu == 1}">外出</c:if>
          </td>
          <td>
          	<c:if test="${stat.kuanggong == 1}">旷工</c:if>
          </td>
          <td>
          	<c:if test="${stat.jiaban == 1}">加班</c:if>
          </td>
        </tr>
      </c:forEach>
      </table>
</div>
</body>
	<script type="text/javascript">
		function searchExperts(){
			$("#searchForm").submit();
		}
		function toAdd(){
			window.location.href = "attendance/toadd";
		}
		function toSet(){
			window.location.href = "attendance/toset";
		}
		
		laydate.render({
		    elem: '#startTime',
		    event: 'focus' 
		});
		Highcharts.chart('container', {
		    chart: {
		        type: 'pie',
		        options3d: {
		            enabled: true,
		            alpha: 45,
		            beta: 0
		        }
		    },
		    title: {
		        text: '今日出勤情况'
		    },
		    tooltip: {
		        pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
		    },
		    credits: {  
		        enabled: false
		    },
		    exporting:{  
		    	enabled: false
		    },
		    plotOptions: {
		        pie: {
		            allowPointSelect: true,
		            cursor: 'pointer',
		            depth: 35,
		            dataLabels: {
		                enabled: true,
		                format: '{point.name}'
		            },
			    events: {
			        click: function(e) {
			        }
			       }
		        }
		    },
		    series: [{
		        type: 'pie',
		        name: '今日出勤情况',
		        data: [
					<c:forEach items="${curr }" var="vo">
						['${vo.name } : ${vo.count}', ${vo.count}],
					</c:forEach>
		        ]
		    }]
		});
	</script>
</html>