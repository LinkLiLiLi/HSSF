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
</head>
<body>
<form action="product/list" method="post" id="searchForm">
  <div class="panel admin-panel">
    <div class="panel-head cl">
    	<strong class="icon-reorder">&nbsp;&nbsp;内容列表</strong>
    </div>
    <div class="padding border-bottom">
      <ul class="search" style="padding-left:10px;">
        <shiro:hasPermission name="products_add">
        	<li> <a class="button border-main icon-plus-square-o" href="javascript:void(0);" onclick="toadd()">创建记录</a> </li>
        </shiro:hasPermission>
        <li>搜索：</li>
        <li>
          <input type="text" placeholder="请输入任务单号" name="taskNumber" class="input" style="width:200px; line-height:17px;display:inline-block"  value="${taskNumber }" />
          <input type="text" placeholder="请输入任务名称" name="taskName" class="input" style="width:200px; line-height:17px;display:inline-block"  value="${taskName }" />
          <a href="javascript:void(0)" class="button border-main icon-search" onclick="changesearch()" > 搜索</a></li>
      </ul>
    </div>
    <table class="table table-hover text-center">
      <tr>
        <th>序号</th>
		<th>任务名称</th>
		<th>任务单号</th>
		<th>下单日期</th>
        <th>截止日期</th>				
		<th>问题</th>
		<th>最新进展</th>                
		<th>操作</th>
      </tr>
      <c:forEach items="${productList}" var="record" varStatus="status">
     <tr>
      <td>${(page.currPage - 1) * page.pageRows + status.index+1}</td>
      <td>${record.taskName}</td>
      <td>${record.taskNumber }</td>
      <td><fmt:formatDate value="${record.taskDate }" pattern="yyyy-MM-dd"/></td>
      <td><fmt:formatDate value="${record.endDate }" pattern="yyyy-MM-dd"/></td>
      <td>${record.problem}</td>
      <td>
      	<a href="javascript:void(0)" onclick="showProgress('${record.id}')">${record.lastProgress }</a>
      </td>
      <td class="td-manage">
      	<div class="button-group">
	      	<shiro:hasPermission name="product_add_node">
         		<a class="button border-green" onclick="addnode('${record.id}')" href="javascript:;">
         			<span class="icon-plus"></span> 节点
         		</a>
        	</shiro:hasPermission>
        	
       		<shiro:hasPermission name="product_edit">
         		<a class="button border-main" onclick="toedit('${record.id}')" href="javascript:;">
         			<span class="icon-edit"></span> 编辑
         		</a>
       		</shiro:hasPermission>
       		<shiro:hasPermission name="product_delete">
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
		function changesearch(){
			$("#searchForm").submit();
		}
		
		function toadd(){
			window.location.href="product/toadd";
		}
		
		function addnode(id){
			window.location.href = "product/toaddnode/"+id;
		}
		
		function toedit(id){
			window.location.href = "product/toedit/"+id;
		}
		
		function todel(id) {
			if(confirm("确认删除？")){
				$.post("common/del",{"id":id,"entry" :"ProductionRecord"},function(data){
					if(data == 0) {
						alert("删除成功！");
					} else {
						alert("删除失败！");
					}
					window.location.reload(); 
				});
			}
		}
		function showProgress(id){
			$.post("product/progress/"+id,function(data){
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
		$(function(){
	    	var msg = '${msg}';
	    	if(msg != '') {
	    		alert(msg);
	    	}
	    });
	</script>
</body>
</html>