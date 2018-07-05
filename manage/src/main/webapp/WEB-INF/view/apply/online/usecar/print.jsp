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
		<h1 class="title">公务用车使用申请表</h1>
		<table border="0" cellspacing="0" cellpadding="8" align="center" class="table1">
		<tr style="height: 40px;">
          <th width="150">申请部门</th>
          <td width="150">${usecar.applyDept }</td>
          <th width="150">申请人</th>
          <td>${usecar.user.name }</td>
        </tr>
        <tr>
          <th>申请日期</th>
          <td><fmt:formatDate value="${usecar.applyTime }" pattern="yyyy-MM-dd"/></td>
          <th rowspan="2">特殊使用申请</th>
          <th rowspan="2" style="text-align: left;">
          	<span style="line-height: 30px;">
         	<c:choose>
         		<c:when test="${fn:contains(usecar.specialInfo,1)}"><img src="images/dui.png"/></c:when>
         		<c:otherwise><img src="images/kong.png"/></c:otherwise>
         	</c:choose>
          	车辆在外过夜</span><br />
          	<span style="line-height: 30px;">
          	<c:choose>
         		<c:when test="${fn:contains(usecar.specialInfo,2)}"><img src="images/dui.png"/></c:when>
         		<c:otherwise><img src="images/kong.png"/></c:otherwise>
         	</c:choose>
          	特殊时期</span><br />
          	<span style="line-height: 30px;">
          	<c:choose>
         		<c:when test="${fn:contains(usecar.specialInfo,3)}"><img src="images/dui.png"/></c:when>
         		<c:otherwise><img src="images/kong.png"/></c:otherwise>
         	</c:choose>
			恶劣天气</span><br />
          	<span style="line-height: 30px;">
          	<c:choose>
         		<c:when test="${fn:contains(usecar.specialInfo,4)}"><img src="images/dui.png"/></c:when>
         		<c:otherwise><img src="images/kong.png"/></c:otherwise>
         	</c:choose>
			节假日期间</span><br />
          	<span style="line-height: 30px;">
          	<c:choose>
         		<c:when test="${fn:contains(usecar.specialInfo,5)}"><img src="images/dui.png"/></c:when>
         		<c:otherwise><img src="images/kong.png"/></c:otherwise>
         	</c:choose>
          	出京</span><br />
          	<div style="height: 50px;"></div>
          </th>
        </tr>
        <tr>
          <th>使用时间</th>
          <td><fmt:formatDate value="${usecar.useTime }" pattern="yyyy-MM-dd"/></td>
        </tr>
        <tr style="height: 40px;">
          <th>事由（人数）</th>
          <td colspan="3">${usecar.reason }</td>
        </tr>
        <tr style="height: 40px;">
          <th>目的地</th>
          <td colspan="3">${usecar.destination }</td>
        </tr>
        <tr style="height: 40px;">
          <th>车牌号码</th>
          <td colspan="3">${usecar.carNumber }</td>
        </tr>
        <tr>
          <th>部门负责人意见</th>
          <th colspan="3">
          	<div style="height: 40px;"></div>
          	<div style="text-align: right;">
          		<span style="text-align: right; margin-right: 180px;">签字：</span><br />
          		<span style="text-align: right;">年&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;日</span>
          	</div>
          </th>
        </tr>
        <tr>
          <th>所（处）长/书记意见</th>
          <th colspan="3">
          	<div style="height: 40px;"></div>
          	<div style="text-align: right;">
          		<span style="text-align: right; margin-right: 180px;">签字：</span><br />
          		<span style="text-align: right;">年&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;日</span>
          	</div>
          </th>
        </tr>
        <tr>
          <th style="height: 40px;">异常情况记录</th>
          <td align="left" colspan="3">${usecar.exceptionRecord }</td>
        </tr>
        <tr style="height: 40px;">
          <th>驶出时间</th>
          <td align="left" colspan="3"><fmt:formatDate value="${usecar.beginTime }" pattern="yyyy-MM-dd"/></td>
        </tr>
        <tr style="height: 40px;">
          <th>交回时间</th>
          <td align="left" colspan="3"><fmt:formatDate value="${usecar.endTime }" pattern="yyyy-MM-dd"/></td>
        </tr>
        <tr style="height: 40px;">
          <th>停车费用（元）</th>
          <td align="left" colspan="3">${usecar.stopCarPrice }</td>
        </tr>
        <tr style="height: 40px;">
          <th>出车驾驶员</th>
          <td align="left" colspan="3">${usecar.driver }</td>
        </tr>
        <tr>
          <th>车辆调度员确认</th>
          <th colspan="3">
          	<div style="height: 20px;"></div>
          	<div style="text-align: right;">
          		<span style="text-align: right;">年&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;日</span>
          	</div>
          </th>
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