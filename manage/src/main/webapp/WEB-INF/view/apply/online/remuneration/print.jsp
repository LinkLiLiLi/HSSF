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
		<h1 class="title">个人所得税（劳务报酬）计算单</h1>
		<p class="bold" style="text-align: center;">
			<span style="width: 40px; display: inline-block;text-align: center;" ><fmt:formatDate value="${remuneration.applyDate }" pattern="yyyy"/></span>年
			<span style="width: 30px; display: inline-block;text-align: center;" ><fmt:formatDate value="${remuneration.applyDate }" pattern="MM"/></span>月
			<span style="width: 30px; display: inline-block;text-align: center;" ><fmt:formatDate value="${remuneration.applyDate }" pattern="dd"/></span>日
		</p>
		<table border="0" cellspacing="0" cellpadding="8" align="center" class="table1" style="width: 850px;">
		<tr>
          <th>姓名</th>
          <th>身份证号码</th>
          <th>银行卡号</th>
          <th>开户银行</th>
          <th>劳务金额</th>
          <th>应交税金</th>
          <th>实付金额</th>
          <th>领款人签字</th>
        </tr>
        <c:forEach items="${remuneration.detailList}" var="item" varStatus="status">
			<tr>
				<td>${item.name }</td>
				<td>${item.idCard }</td>
				<td>${item.bankCard }</td>
				<td>${item.bankName }</td>
				<td>${item.allAmount }</td>
				<td>${item.taxAmount }</td>
				<td>${item.payAmount }</td>
				<td></td>
			</tr>
		</c:forEach>
        <tr>
        	<td colspan="5">实付金额(大写）：${CN}</td>
        	<td colspan="3">￥：${EN }</td>
        </tr>
      </table>
      <p >
      	<span style="width: 50px; display: inline-block;"></span>
      	负责人：<span style="width: 500px; display: inline-block;"></span>
      	经手人:<span style="width: 50px; display: inline-block;"></span>
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
