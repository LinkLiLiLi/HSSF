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
<form action="repair/list" method="post" id="searchForm">
  <div class="panel admin-panel">
    <div class="panel-head cl">
    	<strong class="icon-reorder">&nbsp;&nbsp;内容列表</strong>
    </div>
    <div class="padding border-bottom">
      <ul class="search" style="padding-left:10px;">
        <shiro:hasPermission name="repair_add">  
        <li> <a class="button border-main icon-plus-square-o" href="javascript:void(0);" onclick="toadd()">创建记录</a> </li>
        </shiro:hasPermission>
        <li>搜索：</li>
        <li>
          <input type="text" placeholder="请输入产品名称" name="productName" class="input" style="width:200px; line-height:17px;display:inline-block"  value="${productName }" />
          <a href="javascript:void(0)" class="button border-main icon-search" onclick="changesearch()" > 搜索</a></li>
      </ul>
    </div>
    <table class="table table-hover text-center">
      <tr>
        <th>序号</th>
		<th>产品名称</th>
		<th>数量</th>
		<th>返修单位</th>
        <th>产品出厂日期</th>				
		<th>维修过程记录</th>
		<th>备注</th>                
		<th>操作</th>
      </tr>
      <c:forEach items="${repairList}" var="record" varStatus="status">
     <tr>
      <td>${(page.currPage - 1) * page.pageRows + status.index+1}</td>
      <td>${record.productName}</td>
      <td>${record.amount }</td>
      <td>${record.unit }</td>
      <td><fmt:formatDate value="${record.productionDate }" pattern="yyyy-MM-dd"/></td>
      <td>${record.processLog}</td>
      <td>${record.remark }</td>
      
      <td class="td-manage">
	      <div class="button-group">
		        <shiro:hasPermission name="repair_edit">  
			        <a class="button border-main" onclick="toedit('${record.id}')" href="javascript:;">
			   			<span class="icon-edit"></span> 修改
			   		</a>
		        </shiro:hasPermission>
		        <shiro:hasPermission name="repair_delete">  
	        	<a class="button border-red" onclick="todel('${record.id}')" href="javascript:;">
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
		function changesearch(){
			$("#searchForm").submit();
		}
		
		function toadd(){
			window.location.href="repair/toadd";
		}
		
		function toedit(id){
			window.location.href = "repair/toedit/"+id;
		}
		function todel(id) {
			if(confirm("确认删除？")){
				$.post("common/del",{"id":id,"entry" :"RepairRecord"},function(data){
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