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
		<h1 class="title">农业自动化员工加班申请</h1>
		<p class="bold" style="margin-left: 10px;">填写时间：
			<span style="width: 70px; border-bottom: 1px solid black;display: inline-block;text-align: center;" ><fmt:formatDate value="${overtime.applyTime }" pattern="yyyy"/></span>年
			<span style="width: 70px; border-bottom: 1px solid black;display: inline-block;text-align: center;" ><fmt:formatDate value="${overtime.applyTime }" pattern="MM"/></span>月
			<span style="width: 70px; border-bottom: 1px solid black;display: inline-block;text-align: center;" ><fmt:formatDate value="${overtime.applyTime }" pattern="dd"/></span>日
		</p>
		<table border="0" cellspacing="0" cellpadding="8" align="center" class="table1">
		<tr height="50">
          <th width="17%">申请人</th>
          <td width="33%">${overtime.user.name }</td>
          <th width="17%">所属小组</th>
          <td width="33%">${overtime.user.userGroupName }</td>
        </tr>
        <tr height="50">
          <th>加班事由</th>
          <td colspan="3">${overtime.reason }</td>
        </tr>
        <tr height="50">
          <th>联系电话</th>
          <td>${overtime.phoneNumber }</td>
          <th>紧急联系人及<br />联系电话</th>
          <td>${overtime.concatUser }/${overtime.concatMobile }</td>
        </tr>
        <tr>
          <th>加班时间</th>
          <th colspan="3">
          	<div style="height: 20px;"> </div>
          	<div style="text-align: left; margin-left: 10px;">
          		<span style="text-align: left;">
	          		自<span style="width: 70px; border-bottom: 1px solid black;display: inline-block;text-align: center;" ><fmt:formatDate value="${overtime.beginTime }" pattern="yyyy"/></span>年
	          		<span style="width: 40px; border-bottom: 1px solid black;display: inline-block;text-align: center;" ><fmt:formatDate value="${overtime.beginTime }" pattern="MM"/></span>月
	          		<span style="width: 40px; border-bottom: 1px solid black;display: inline-block;text-align: center;" ><fmt:formatDate value="${overtime.beginTime }" pattern="dd"/></span>日
	          		<span style="width: 40px; border-bottom: 1px solid black;display: inline-block;text-align: center;" ><fmt:formatDate value="${overtime.beginTime }" pattern="HH"/></span>时
	          		至<span style="width: 70px; border-bottom: 1px solid black;display: inline-block;text-align: center;" ><fmt:formatDate value="${overtime.endTime }" pattern="yyyy"/></span>年
	          		<span style="width: 40px; border-bottom: 1px solid black;display: inline-block;text-align: center;" ><fmt:formatDate value="${overtime.endTime }" pattern="MM"/></span>月
	          		<span style="width: 40px; border-bottom: 1px solid black;display: inline-block;text-align: center;" ><fmt:formatDate value="${overtime.endTime }" pattern="dd"/></span>日
	          		<span style="width: 40px; border-bottom: 1px solid black;display: inline-block;text-align: center;" ><fmt:formatDate value="${overtime.endTime }" pattern="HH"/></span>时
          		</span>
          	</div>
          </th>
        </tr>
        <tr>
          <th>
          	小组组长<br />意见
          </th>
          <th colspan="3">
          	<div style="height: 20px;"> </div>
          	<div style="text-align: right; margin-right: 3px;">
          		<span style="text-align: right; margin-right: 120px;">签字：</span>
          		<span style="text-align: right;">
	          		<span style="width: 50px; border-bottom: 1px solid black;display: inline-block;text-align: center;" >&nbsp;</span>年
	          		<span style="width: 40px; border-bottom: 1px solid black;display: inline-block;text-align: center;" >&nbsp;</span>月
	          		<span style="width: 40px; border-bottom: 1px solid black;display: inline-block;text-align: center;" >&nbsp;</span>日
          		</span>
          	</div>
          </th>
        </tr>
        <tr>
          <th>
          	部门主任<br />意见
          </th>
          <th colspan="3">
          	<div style="height: 20px;"> </div>
          	<div style="text-align: right; margin-right: 3px;">
          		<span style="text-align: right; margin-right: 120px;">签字：</span>
          		<span style="text-align: right;">
	          		<span style="width: 50px; border-bottom: 1px solid black;display: inline-block;text-align: center;" >&nbsp;</span>年
	          		<span style="width: 40px; border-bottom: 1px solid black;display: inline-block;text-align: center;" >&nbsp;</span>月
	          		<span style="width: 40px; border-bottom: 1px solid black;display: inline-block;text-align: center;" >&nbsp;</span>日
          		</span>
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
