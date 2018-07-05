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
<form action="apply/online/turnup/list" method="post" id="searchForm">
  <jsp:include page="../include.jsp"/>
  <div class="panel admin-panel">
    <div class="panel-head cl">
    	<strong class="icon-reorder">&nbsp;&nbsp;内容列表</strong>
    </div>
    <div class="padding border-bottom">
      <ul class="search" style="padding-left:10px;">
        <shiro:hasPermission name="apply_turnup_add">
        <li> <a class="button border-main icon-plus-square-o" href="javascript:void(0);" onclick="toadd()">转编登记</a> </li>
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
		<th>姓名</th>
		<th>出生年月</th>
		<th>民族</th>
		<th>婚否</th>
		<th>部门</th>
		<th>手机号码</th>
		<th>毕业院校</th>
		<th>专业</th>
		<th>毕业时间</th>
		<th>学历</th>
		<th>学位</th>
		<th>连续工龄</th>
		<th>操作</th>
      </tr>
      <c:forEach items="${turnUpList}" var="turnup" varStatus="status">
			<tr>
	          <td>${(page.currPage - 1) * page.pageRows + status.index+1}</td>
	          <td>${turnup.userName }</td>
	          <td>${turnup.birth }</td>
	          <td>
	          	${turnup.nation }
	          </td>
	          <td>
	          	<c:if test="${turnup.marriage == 0 }">已婚</c:if>
	          	<c:if test="${turnup.marriage == 1 }">未婚</c:if>
	          </td>
	          <td>${turnup.dept}</td>
	          <td>${turnup.phoneNumber }</td>
	          <td>${turnup.school }</td>
	          <td>${turnup.major }</td>
	          <td>${turnup.graduationTime }</td>
	          <td>${turnup.education }</td>
	          <td>${turnup.degree }</td>
	          <td>${turnup.workingYears}</td>
	          <td>
	          	<div class="button-group">
		          	<shiro:hasPermission name="apply_turnup_edit">
		          		<a class="button border-main" onclick="edit('${turnup.id}')" href="javascript:;">
			       			<span class="icon-edit"></span> 编辑
			       		</a>
		          	</shiro:hasPermission>
		          	<shiro:hasPermission name="apply_turnup_print">
		          		<a class="button border-yellow" onclick="toprint('${turnup.id}')" href="javascript:;">
			       			<span class="icon-print"></span> 打印
			       		</a>
		          	</shiro:hasPermission>
		          	<shiro:hasPermission name="apply_turnup_delete">
		          	<a class="button border-red" onclick="todel('${turnup.id}')" href="javascript:;">
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
		function todel(id) {
			if(confirm("确认删除？")){
				$.post("common/del",{"id":id,"entry" :"ApplyTurnUp"},function(data){
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
			window.location.href="apply/online/turnup/toadd";
		}
		
		
		function edit(id){
			window.location.href="apply/online/turnup/toedit/"+ id;
		}
		
		$(function(){
	    	var msg = '${msg}';
	    	if(msg != '') {
	    		alert(msg);
	    	}
	    });
		function toprint(id){
			window.location.href="apply/online/turnup/toprint/"+ id;
		}
	</script>
</body>
</html>