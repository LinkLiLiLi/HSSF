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
		<h1 class="title">专家费报销单</h1>
		<p class="bold" style="text-align: center;">
			<span style="width: 40px; display: inline-block;text-align: center;" ><fmt:formatDate value="${expertFee.applyDate }" pattern="yyyy"/></span>年
			<span style="width: 30px; display: inline-block;text-align: center;" ><fmt:formatDate value="${expertFee.applyDate }" pattern="MM"/></span>月
			<span style="width: 30px; display: inline-block;text-align: center;" ><fmt:formatDate value="${expertFee.applyDate }" pattern="dd"/></span>日
		</p>
		<table border="0" cellspacing="0" cellpadding="8" align="center" class="table1" style="width: 850px;">
		<tr>
          <th width="60px;">姓名</th>
          <th>身份证号码</th>
          <th width="75px;">工作单位</th>
          <th width="60px;">职称</th>
          <th width="50px;">咨询天数/次数</th>
          <th width="50px;">银行卡号</th>
          <th width="50px;">开户银行</th>
          <th width="50px;">实付金额</th>
          <th width="50px;">领款人签字</th>
        </tr>
        <c:forEach items="${expertFee.detailList}" var="item" varStatus="status">
			<tr>
				<td>${item.name }</td>
				<td>${item.idCard }</td>
				<td>${item.unit }</td>
				<td>${item.title }</td>
				<td>${item.days }</td>
				<td>${item.bankCard }</td>
				<td>${item.baneName }</td>
				<td>${item.amount }</td>
				<td></td>
			</tr>
		</c:forEach>
        <tr>
        	<th colspan="9" style="text-align: left;">合计（大写）：${CN }</th>
        </tr>
      </table>
      <p >
      	<span style="width: 100px; display: inline-block;"></span>
      	负责人：<span style="width: 300px; display: inline-block;"></span>
      	经办人：<span style="width: 60px; display: inline-block;"></span>
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
