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
		<h1 class="title">差 旅 费 报 销 单</h1>
		<p class="bold" style="text-align: center;">
			<span style="width: 40px; display: inline-block;text-align: center;" ><fmt:formatDate value="${trval.travelDate }" pattern="yyyy"/></span>年
			<span style="width: 30px; display: inline-block;text-align: center;" ><fmt:formatDate value="${trval.travelDate }" pattern="MM"/></span>月
			<span style="width: 30px; display: inline-block;text-align: center;" ><fmt:formatDate value="${trval.travelDate }" pattern="dd"/></span>日
		</p>
		<table border="0" cellspacing="0" cellpadding="8" align="center" class="table1" style="width: 850px;">
		<table border="0" cellspacing="0" cellpadding="8" align="center" class="table1" style="width: 850px">
		<tr>
          <th colspan="3">出差人</th>
          <td colspan="5">${trval.name }</td>
          <th colspan="2">出差事由</th>
          <td colspan="7">${trval.reason }</td>
        </tr>
        <tr>
          <th colspan="3">出发</th>
          <th colspan="3">到达</th>
          <th rowspan="2">城市间<br/>交通工具</th>
          <th colspan="2">交通费</th>
          <th colspan="2">住宿费</th>
          <th colspan="2">交通补助</th>
          <th colspan="2">伙食补助</th>
          <th colspan="2">其他</th>
        </tr>
        <tr>
          <th>月</th>
          <th>日</th>
          <th>地点</th>
          <th>月</th>
          <th>日</th>
          <th>地点</th>
          <th>单据<br/>张数</th>
          <th>金额</th>
          <th>单据<br/>张数</th>
          <th>金额</th>
          <th>天数</th>
          <th>金额</th>
          <th>天数</th>
          <th>金额</th>
          <th>单据<br/>张数</th>
          <th>金额</th>
        </tr>
        <c:forEach items="${trval.detailList}" var="item" varStatus="status">
			<tr>
				<td><fmt:formatDate value="${item.outDate }" pattern="MM"/></td>
				<td><fmt:formatDate value="${item.outDate }" pattern="dd"/></td>
				<td>${item.outAddr }</td>
				<td><fmt:formatDate value="${item.arriveDate }" pattern="MM"/></td>
				<td><fmt:formatDate value="${item.arriveDate }" pattern="dd"/></td>
				<td>${item.arriveAddr }</td>
				<td>${item.vehicle }</td>
				
				<td>${item.trafficSum }</td>
				<td>${item.trafficAmount }</td>
				<td>${item.liveSum }</td>
				<td>${item.liveAmount }</td>
				<td>${item.trafficSubsidyDays }</td>
				<td>${item.trafficSubsidyAmount }</td>
				<td>${item.foodSubsidyDays }</td>
				<td>${item.foodSubsidyAmount }</td>
				<td>${item.otherSum }</td>
				<td>${item.otherAmount }</td>
			</tr>
		</c:forEach>
        <tr>
          <th colspan="3">合计金额</th>
          <td colspan="4">${EN }</td>
          <td></td>
          <td>${trafficAmount }</td>
          <td></td>
          <td>${liveAmount }</td>
          <td></td>
          <td>${trafficSubsidyAmount }</td>
          <td></td>
          <td>${foodSubsidyAmount }</td>
          <td></td>
          <td>${otherAmount }</td>
        </tr>
        <tr>
          <th colspan="7" rowspan="2">报销金额</th>
          <td colspan="10">（大写）${CN }</td>
        </tr>
        <tr>
          <td colspan="10">
          	公务卡：<span style="width: 70px; display: inline-block;">${trval.card }</span>
          	支票：<span style="width: 70px; display: inline-block;">${trval.cheque }</span>
          	现金：<span style="width: 70px; display: inline-block;">${trval.money }</span>
          </td>
        </tr>
      </table>
      <p >
      	主管：<span style="width: 150px; display: inline-block;"></span>
      	审核：<span style="width: 150px; display: inline-block;"></span>
      	出纳：<span style="width: 150px; display: inline-block;"></span>
      	领款人：<span style="width: 150px; display: inline-block;"></span>
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
