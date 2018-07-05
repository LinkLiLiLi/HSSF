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
	<title>其他支出</title>
	<link rel="stylesheet" href="css/pintuer.css">
	<link rel="stylesheet" href="css/admin.css">
	<script src="js/jquery.js"></script>
	<script src="js/pintuer.js"></script>
</head>
<body>
<form action="funds/other/list" method="post" id="expertsId">
  <div class="panel admin-panel">
    <div class="panel-head"><strong class="icon-reorder">&nbsp;&nbsp;内容列表</strong></div>
    <div class="padding border-bottom">
      <ul class="search" style="padding-left:10px;">
      	<shiro:hasPermission name="funds_other_add">
        	<li> <a class="button border-main icon-plus-square-o" href="javascript:void(0);" id="member_add" onclick="toAdd()">其他支出</a> </li>
        </shiro:hasPermission>
        <li>搜索：</li>
        <li>
		  <input type="text" placeholder="请输入支出单位" name="unit" class="input" style="width:200px; line-height:17px;display:inline-block"  value="${unit }" />          
          <a href="javascript:void(0)" class="button border-main icon-search" onclick="searchExperts();"> 搜索</a></li>
      </ul>
    </div>
    <table class="table table-hover text-center">
      <tr>
        <th>序号</th>
		<th>时间</th>
		<th>收款单位 </th>
		<th>内容</th>
		<th>金额</th>
		<th>经办人</th>
		<th>备注</th>
		<th>操作</th>
      </tr>
      <c:forEach items="${otherList}" var="other" varStatus="status">
			<tr>
	          <td>${(page.currPage - 1) * page.pageRows + status.index+1}</td>
	          <td><fmt:formatDate value="${other.changeTime }" pattern="yyyy-MM-dd"/></td>
	          <td>${other.unit }</td>
	          <td>${other.content }</td>
	          <td>${other.amount }</td>
	          <td>${other.dealMan }</td>
	          <td>${other.remark }</td>
	          <td>
		          <div  class="button-group">
		          	<shiro:hasPermission name="funds_other_edit">
			          	<a class="button border-main" onclick="edit('${other.id}')" href="javascript:;">
		          			<span class="icon-edit"></span> 修改
		          		</a>
	          		</shiro:hasPermission>
	          		<shiro:hasPermission name="funds_other_delete">
		          		<a class="button border-red" onclick="todel('${other.id}')" href="javascript:;">
		         			<span class="icon-trash-o"></span> 删除
		         		</a>
	         		</shiro:hasPermission>
		          </div>
	          </td>
			</tr>
		</c:forEach>
      	<jsp:include page="../../include/page.jsp">
      		<jsp:param value="8" name="colspan"/>
      	</jsp:include>
    </table>
  </div>
</form>
	<script type="text/javascript">
		function todel(id) {
			if(confirm("确认删除？")){
				$.post("common/del",{"id":id,"entry" :"OtherFund"},function(data){
					if(data == 0) {
						alert("删除成功！");
					} else {
						alert("删除失败！");
					}
					window.location.reload(); 
				});
			}
		}
		function toAdd(){
			window.location.href="funds/other/toadd";
		}
		function searchExperts(){
			$("#expertsId").submit();
		}
		
		function edit(id){
			window.location.href="funds/other/toedit/"+id;
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