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
		<style type="text/css">
			.table1 td {
				text-align: left;
			}			
		</style>
	</head>
	<body>
		<h1 class="title">支票领用登记单</h1>
		<p class="bold" style="text-align: center;">
			<span style="width: 40px; display: inline-block;text-align: center;" ><fmt:formatDate value="${cheque.applyDate }" pattern="yyyy"/></span>年
			<span style="width: 30px; display: inline-block;text-align: center;" ><fmt:formatDate value="${cheque.applyDate }" pattern="MM"/></span>月
			<span style="width: 30px; display: inline-block;text-align: center;" ><fmt:formatDate value="${cheque.applyDate }" pattern="dd"/></span>日
		</p>
		<table border="0" cellspacing="0" cellpadding="8" align="center" class="table1" style="width: 850px;">
		<tr>
          <th width="30px;">编号</th>
          <th width="65px;">支出单位</th>
          <th>支出项目</th>
          <th width="65px;">财务编号</th>
          <th>分类明细</th>
          <th width="65px;">支票限额</th>
          <th>用途</th>
          <th width="30px;">备注</th>
        </tr>
        <c:forEach items="${cheque.detailList}" var="item" varStatus="status">
			<tr>
				<td>${status.index +1}</td>
				<td>${item.payUnit }</td>
				<td>${item.payProject }</td>
				<td>${item.number }</td>
				<td>${item.detail }</td>
				<td>${item.amount }</td>
				<td>${item.useInfo }</td>
				<td>${item.remark }</td>
			</tr>
		</c:forEach>
        <tr>
        	<td colspan="3">申请人：</td>
        	<td colspan="3">经办人：</td>
        	<td colspan="2">领导批示：</td>
        </tr>
      </table>
     
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
