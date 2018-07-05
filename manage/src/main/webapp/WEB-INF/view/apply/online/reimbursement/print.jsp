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
		<h1 class="title">支出报销明细单</h1>
		<p class="bold" style="text-align: center;">
			<span style="width: 40px; display: inline-block;text-align: center;" ><fmt:formatDate value="${reimbursement.reDate }" pattern="yyyy"/></span>年
			<span style="width: 30px; display: inline-block;text-align: center;" ><fmt:formatDate value="${reimbursement.reDate }" pattern="MM"/></span>月
			<span style="width: 30px; display: inline-block;text-align: center;" ><fmt:formatDate value="${reimbursement.reDate }" pattern="dd"/></span>日
		</p>
		<table border="0" cellspacing="0" cellpadding="8" align="center" class="table1">
		<tr>
          <th style="width: 70px;">支出单位</th>
          <td colspan="4">${reimbursement.payUnit }</td>
        </tr>
        <tr>
          <th>支出项目</th>
          <td colspan="2">${reimbursement.project.projectName }</td>
          <th  style="width: 70px;">财务编号</th>
          <td style="width: 70px;">${reimbursement.number }</td>
        </tr>
        <tr>
          <th>分类科目</th>
          <td colspan="2">${reimbursement.detail }</td>
          <th>票据张数</th>
          <td>${reimbursement.sum }</td>
        </tr>
        <tr>
          <th rowspan="${fn:length(detailList)}">附件明细</th>
          <td style="width: 30px;">1</td>
          <td>${detailList[0].detail }</td>
          <td colspan="2"><c:if test="${detailList[0].amount != null }">￥:${detailList[0].amount }</c:if></td>
        </tr>
        <c:forEach items="${detailList}" begin="1" var="item" varStatus="status">
			<tr>
				<td>${status.index +1}</td>
				<td>${item.detail }</td>
				<td colspan="2"><c:if test="${item.amount != null }">￥:${item.amount }</c:if></td>
			</tr>
		</c:forEach>
        <tr>
          <th>金额合计</th>
          <td colspan="2">（人民币大写）${CN}</td>
          <td colspan="2"><c:if test="${EN != null }">￥:${EN } </c:if></td>
        </tr>
      </table>
      <p >
      	申领人：<span style="width: 110px; display: inline-block;"></span>
      	审核人：<span style="width: 110px; display: inline-block;"></span>
      	负责人：<span style="width: 110px; display: inline-block;"></span>
      	领款人：<span style="width: 110px; display: inline-block;"></span>
      </p>
     
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
