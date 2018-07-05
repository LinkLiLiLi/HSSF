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
		<h1 class="title">中心用人申请表</h1>
		<table border="0" cellspacing="0" cellpadding="8" align="center" class="table1">
		<tr>
          <th width="90">用人部门</th>
          <td colspan="4">${needhands.dept }</td>
          <th width="110">申请日期</th>
          <td>${needhands.applyDate }</td>
        </tr>
        <tr>
          <th>聘用岗位</th>
          <td colspan="6">
          	<span style="display:block; width: 110px; float:left;text-align: left;margin-left: 15px;">科研(<span style="display: inline-block;width: 20px;text-align: center;"><c:if test="${needhands.post == 1}">√</c:if></span>) </span>
          	<span style="display:block; width: 130px; float:left;text-align: left;margin-left: 15px;">管理(<span style="display: inline-block;width: 20px;text-align: center;"><c:if test="${needhands.post == 2}">√</c:if></span>) </span>
          	<span style="display:block; width: 110px; float:left;text-align: left;margin-left: 15px;">技术开发(<span style="display: inline-block;width: 20px;text-align: center;"><c:if test="${needhands.post == 3}">√</c:if></span>) </span>
          	<span style="display:block; width: 110px; float:left;text-align: left;margin-left: 15px;">科研辅助(<span style="display: inline-block;width: 20px;text-align: center;"><c:if test="${needhands.post == 4}">√</c:if></span>) </span>
          </td>
        </tr>
        <tr>
          <th>聘用方式</th>
          <td colspan="6">
          	<span style="display:block; width: 110px; float:left;text-align: left;margin-left: 15px;">事业(<span style="display: inline-block;width: 20px;text-align: center;"><c:if test="${needhands.post == 1}">√</c:if></span>) </span>
          	<span style="display:block; width: 130px; float:left;text-align: left;margin-left: 15px;">企业(<span style="display: inline-block;width: 20px;text-align: center;"><c:if test="${needhands.post == 2}">√</c:if></span>)(派得/农芯)</span>
          	<span style="display:block; width: 110px; float:left;text-align: left;margin-left: 15px;">合同(<span style="display: inline-block;width: 20px;text-align: center;"><c:if test="${needhands.post == 3}">√</c:if></span>) </span>
          	<span style="display:block; width: 110px; float:left;text-align: left;margin-left: 15px;">博士后(<span style="display: inline-block;width: 20px;text-align: center;"><c:if test="${needhands.post == 4}">√</c:if></span>) </span>
          </td>
        </tr>
        <tr>
          <th>拟聘人姓名</th>
          <td colspan="2">${needhands.userName }</td>
          <th width="45">性别</th>
          <td width="45">
          	<c:if test="${needhands.gender == 0}">男</c:if>
          	<c:if test="${needhands.gender == 1}">女</c:if>
          </td>
          <th>年龄</th>
          <td>${needhands.age}</td>
        </tr>
        <tr>
          <th>拟聘人学历</th>
          <td width="90">${needhands.education}</td>
          <th width="90">入职日期</th>
          <td colspan="2">${needhands.joinDate}</td>
          <th>合同期限</th>
          <td>${needhands.termAmount }</td>
        </tr>
        <tr>
          <th>岗位津贴</th>
          <td>${needhands.amount }</td>
          <th>试用期期限</th>
          <td colspan="2">${needhands.trialAmount }</td>
          <th>试用期岗位津贴</th>
          <td>${needhands.trialAmountSubsidy }</td>
        </tr>
        <tr>
          <th><span style="display:-moz-inline-box;display:inline-block;width:10px; ">聘用原因</span></th>
          <td colspan="6">
          	<div style="height: 270px;"> </div>
          	<div style="text-align: right; margin-right: 20px;">
          		<span style="text-align: right; margin-right: 225px;">部门主任签字:</span>
          		<span style="text-align: right;">&nbsp;年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;日</span>
          	</div>
          </td>
        </tr>
        <tr>
          <th><span style="display:-moz-inline-box;display:inline-block;width:10px; ">中心领导审批意见</span></th>
          <td colspan="6">
          	<div style="height: 170px;"> </div>
          	<div style="text-align: right; margin-right: 20px;">
          		<span style="text-align: right; margin-right: 225px;">中心主任签字:</span>
          		<span style="text-align: right;">&nbsp;年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;日</span>
          	</div>
          </td>
        </tr>
        <tr>
          <th><span style="display:-moz-inline-box;display:inline-block;width:10px; ">落实情况</span></th>
          <td colspan="6">
          	<div style="height: 150px;"> </div>
          	<div style="text-align: right; margin-right: 20px;">
          		<span style="text-align: right; margin-right: 225px;">办公室主任签字:</span>
          		<span style="text-align: right;">&nbsp;年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;日</span>
          	</div>
          </td>
        </tr>
      </table>
      <p class="small">①请用碳素墨水笔填写；②此文件及相关附件一并交办公室存档  北京农业信息技术研究中心办公室</p>
     
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
