<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
	<head>
		<base href="<%=request.getContextPath() %>/">
		<meta charset="utf-8" />
		<title></title>
		<link rel="stylesheet" href="css/apply.css" />
		<script src="js/jquery-1.9.1.min.js"></script>   
	</head>
	<body>
	 <c:forEach items="${titleList }" var="title">
			<div style="height: 470px;">
				<h2 class="title"><span style="border-bottom: 1px solid black;display: inline-block;width: 120px;">${storage.titleName }</span>材料及易耗品、低值品入库单（${title}）</h2>
				<p class="text-r bold" style="text-align: center;line-height: 1px;"><fmt:formatDate value="${storage.changeTime }" pattern="yyyy 年 MM 月 dd 日"/></p>
				<div style="text-align: left; margin-left: 5px;">
		      		<span class="bold" style="text-align: left;">送货部门：${storage.dept }</span>
		      		<span class="bold" style="text-align: left; margin-left: 400px;">库单编号：${storage.kdNumber }</span>
		      	</div>
				<table border="0" cellspacing="0" cellpadding="8" align="center" class="table1">
				<tr>
		          <th width="50">编号</th>
		          <th width="150">名称</th>
		          <th width="50">规格</th>
		          <th width="120">供货单位</th>
		          <th width="40">数量</th>
		          <th width="40">单价</th>
		          <th width="50">金额</th>
		          <th>备注</th>
		        </tr>
		        <c:forEach items="${storage.itemList}" var="item" varStatus="status">
			        <tr>
			        	<td>${item.goodsNumber }</td>
			        	<td>${item.goodsName }</td>
			        	<td>${item.specification }</td>
			        	<td>${item.unit }</td>
			        	<td>${item.amount }</td>
			        	<td>${item.signPrice }</td>
			        	<td>${item.price }</td>
			        	<td>${item.remark }</td>
			        </tr>
		        </c:forEach>
		      </table>
			  <div style="text-align: left;">
				<span class="bold" style="text-align: left;">会计：</span>
				<span class="bold" style="text-align: left; margin-left: 255px;">保管：</span>
				<span class="bold" style="text-align: left; margin-left: 150px;">经手：</span>
			  </div>
			</div>
		</c:forEach>
		
		<c:forEach items="${titleList }" var="title">
			<div style="height: 470px;">
				<h2 class="title"><span style="border-bottom: 1px solid black;display: inline-block;width: 120px;">${storage.titleName }</span>材料及易耗品、低值品出库单（${title}）</h2>
				<p class="text-r bold" style="text-align: center;line-height: 1px;"><fmt:formatDate value="${storage.changeTime }" pattern="yyyy 年 MM 月 dd 日"/></p>
				<div style="text-align: left; margin-left: 5px;">
		      		<span class="bold" style="text-align: left;">领用部门：${storage.dept }</span>
		      		<span class="bold" style="text-align: left; margin-left: 400px;">库单编号：${storage.kdNumber }</span>
		      	</div>
				<table border="0" cellspacing="0" cellpadding="8" align="center" class="table1">
				<tr>
		          <th width="150">名称</th>
		          <th width="40">数量</th>
		          <th width="50">规格</th>
		          <th width="40">单价</th>
		          <th width="50">金额</th>
		          <th>备注</th>
		        </tr>
		        <c:forEach items="${storage.itemList}" var="item" varStatus="status">
			        <tr>
			        	<td>${item.goodsName }</td>
			        	<td>${item.amount }</td>
			        	<td>${item.specification }</td>
			        	<td>${item.signPrice }</td>
			        	<td>${item.price }</td>
			        	<td>${item.remark }</td>
			        </tr>
		        </c:forEach>
		      </table>
			  <div style="text-align: left;">
				<span class="bold" style="text-align: left;">领用人：</span>
				<span class="bold" style="text-align: left; margin-left: 255px;">保管：</span>
				<span class="bold" style="text-align: left; margin-left: 150px;">经手：</span>
			  </div>
			</div>
		</c:forEach>     
     <div id="printDiv" style="text-align: center;margin-top: 10px;">
     	<button class="button" type="button" onClick="printData();" >&nbsp;&nbsp;&nbsp;打印&nbsp;&nbsp;&nbsp;</button>
     </div>
     <script>
     function pagesetup_null(){
         var hkey_root = "HKEY_CURRENT_USER",
             hkey_path = "\\Software\\Microsoft\\Internet Explorer\\PageSetup\\",
             hkey_key;
          try{
              var RegWsh = new ActiveXObject("WScript.Shell")
              hkey_key="header"
              RegWsh.RegWrite(hkey_root+hkey_path+hkey_key,"")
              hkey_key="footer"
              RegWsh.RegWrite(hkey_root+hkey_path+hkey_key,"")
          }catch(e){}
      }
      pagesetup_null();
      function  printData(){//打印
			$("#printDiv").hide();
			window.print();//打印
			$("#printDiv").show();
      }
      function back(){
   	   window.history.go(-1);
      }
    </script>
	</body>
</html>