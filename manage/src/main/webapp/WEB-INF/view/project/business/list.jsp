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
</head>
<body>
<form action="project/business/list" method="post" id="expertsId">
  <div class="panel admin-panel">
    <div class="panel-head"><strong class="icon-reorder">&nbsp;&nbsp;内容列表</strong></div>
    <div class="padding border-bottom">
      <ul class="search" style="padding-left:10px;">
      	<shiro:hasPermission name="business_add">
        	<li> <a class="button border-main icon-plus-square-o" href="javascript:void(0);" id="member_add" onclick="toAdd()">添加项目商务</a> </li>
        </shiro:hasPermission>
        <li>搜索：</li>
        <li>
          <input type="text" placeholder="输入业务名称" name="busniessName" class="input" style="width:250px; line-height:17px;display:inline-block"  value="${busniessName}" />
          <input type="text" placeholder="输入甲方单位" name="unit" class="input" style="width:250px; line-height:17px;display:inline-block"  value="${unit}" />
          <input type="text" placeholder="输入甲方联系人" name="contact" class="input" style="width:250px; line-height:17px;display:inline-block"  value="${contact}" />
          <a href="javascript:void(0)" class="button border-main icon-search" onclick="searchExperts();"> 搜索</a></li>
      </ul>
    </div>
    <table class="table table-hover text-center">
      <tr>
        <th>序号</th>
		<th>业务名称</th>
		<th>甲方单位</th>
		<th>甲方联系人</th>
		<th>联系电话</th>
		<th>业务内容</th>
		<th>业务员</th>
		<th>接洽时间</th>
		<th>最新进展</th>
		<th>状态</th>
		<th>操作</th>
      </tr>
      <c:forEach items="${businessList}" var="business" varStatus="status">
			<tr>
	          <td>${(page.currPage - 1) * page.pageRows + status.index+1}</td>
	          <td>${business.bussName }</td>
	          <td>${business.unit }</td>
	          <td>${business.contact }</td>
	          <td>${business.phoneNumber }</td>
	          <td>${business.bussContent }</td>
	          <td>${business.salesman }</td>
	          <td><fmt:formatDate value="${business.contactDate }" pattern="yyyy-MM-dd"/></td>
	          <td>
		      	<a href="javascript:void(0)" onclick="showProgress('${business.id}')">${business.lastProgress }</a>
		      </td>
	          <td>
	          	<c:if test="${business.status == 1 }">进行中</c:if>
				<c:if test="${business.status == 2 }">暂停</c:if>
				<c:if test="${business.status == 3 }">终止</c:if>
	          </td>
	          <td>
		          <div  class="button-group">
		          	<shiro:hasPermission name="business_edit">
		          	<a class="button border-main" onclick="toedit('${business.id}')" href="javascript:;">
	          			<span class="icon-edit"></span> 修改
	          		  </a>
	          		</shiro:hasPermission>
	          		<shiro:hasPermission name="business_node">
	          		  <a class="button border-yellow" onclick="toaddnode('${business.id}')" href="javascript:;">
	          			<span class="icon-rocket"></span> 添加节点
	          		  </a>
	          		</shiro:hasPermission>
	          		<shiro:hasPermission name="business_delete">
	          		  <a class="button border-red" onclick="todel('${business.id}')" href="javascript:;">
	          			<span class="icon-trash-o"></span> 删除
	          		  </a>
          		   </shiro:hasPermission> 
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
                            <th>业务细节</th>
                        </tr>
                    </thead>
                    <tbody id="items">
                    	
                    </tbody>
                 </table>
        	</div>
         </div>
	</div>
	<script type="text/javascript">
		function toAdd(){
			window.location.href="project/business/toadd";
		}
		function searchExperts(){
			$("#expertsId").submit();
		}
		
		function toedit(id){
			window.location.href="project/business/toedit/"+id;
		}
		
		function todel(id){
			if(confirm("确认删除？")){
				window.location.href="project/business/del/"+id;
			}
		}
		
		function toaddnode(id){
			window.location.href="project/business/toaddnode/"+id;
		}
		function showProgress(id){
			$.post("project/business/progress/"+id,function(data){
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
					tr += "<td>";
					tr += item.str3
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