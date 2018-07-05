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
		<h1 class="title">信息中心学生返校申请表</h1>
		<table border="0" cellspacing="0" cellpadding="8" align="center" class="table1">
		<tr>
          <th width="80">所在部门</th>
          <td colspan="4">${backToSchool.deptName }</td>
          <th width="80">申请日期</th>
          <td>${backToSchool.applyTime }</td>
        </tr>
        <tr>
          <th>学生姓名</th>
          <td width="90">${backToSchool.userName }</td>
          <th width="80">性别</th>
          <td width="40">
          	<c:if test="${backToSchool.gender == 0}">男 </c:if>
          	<c:if test="${backToSchool.gender == 1}">女 </c:if>
          </td>
          <th width="80">就读学校</th>
          <td colspan="2">${backToSchool.school }</td>
        </tr>
        <tr>
          <th>入学时间</th>
          <td>${backToSchool.entranceTime }</td>
          <th>入中心时间</th>
          <td colspan="2">${backToSchool.centerTime }</td>
          <th>培养方式</th>
          <td>${backToSchool.cultivationMode }</td>
        </tr>
        <tr>
          <th>导师姓名</th>
          <td colspan="2">${backToSchool.tutor }</td>
          <th colspan="2">拟离开中心时间</th>
          <td colspan="2">${backToSchool.leaveTime }</td>
        </tr>
        <tr>
          <th><span style="display:-moz-inline-box;display:inline-block;width:10px; ">离开中心原由及承诺</span></th>
          <th colspan="6">
          	<div style="height: 150px;text-align: left;">
          		<p style="line-height: 20px;">1、本人因<span style="border-bottom: 1px solid black;display: inline-block;width:350px;text-align: center;">${backToSchool.reason }&nbsp;</span>原由返校。</p>
          		<p style="line-height: 20px;">2、严格遵守本人与中心签订的知识产权协议，不向第三者透露、提供中心的知识产权秘密、科学实验数据及中心未公开的科研成果。不做有损中心声誉和利益的事情。</p>
          		<p style="line-height: 20px;">3、如违反以上承诺，同意对由此引起的一切后果承担相应责任。</p>
          	</div>
          	<div style="text-align: right; margin-right: 20px;">
          		<span style="text-align: right; margin-right: 80px;">学生本人签字：</span>
          	</div>
          </th>
        </tr>
        <tr>
          <th>
          	<span style="display:-moz-inline-box;display:inline-block;width:10px; ">导师确认或学校主管部门确认</span>
          </th>
          <th colspan="6">
          	<div style="height: 100px;text-align: left;"></div>
          	<div style="text-align: right; margin-right: 20px;">
          		<span style="text-align: right; margin-right: 180px;display: block;margin-top: 10px;">原学校导师签字：</span>
          		<span style="text-align: right; margin-right: 80px;display: block;margin-top: 10px;">或学校主管部门盖章：</span>
          		<span style="text-align: right; margin-right: 30px;display: block;margin-top: 10px;">&nbsp;年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;日</span>
          	</div>
          </th>
        </tr>
        <tr>
          <th>
          	<span style="display:-moz-inline-box;display:inline-block;width:10px; ">部门主任意见</span>
          </th>
          <th colspan="6">
          	<div style="height: 100px;text-align: left;"></div>
          	<div style="text-align: right; margin-right: 20px;">
          		<span style="text-align: right; margin-right: 130px;display: block;margin-top: 10px;">部门主任签字:</span>
          		<div style="margin-top: 10px;">
          			<span style="text-align: right; margin-right: 230px;margin-top: 10px;">（说明与原学校导师确认情况）</span>
          			<span style="text-align: right; margin-right: 30px;margin-top: 10px;">&nbsp;年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;日</span>
          		</div>
          	</div>
          </th>
        </tr>
        <tr>
          <th>
          	<span style="display:-moz-inline-box;display:inline-block;width:10px; ">中心主管主任意见</span>
          </th>
          <th colspan="6">
          	<div style="height: 100px;text-align: left;"></div>
          	<div style="text-align: right; margin-right: 20px;">
          		<span style="text-align: right; margin-right: 150px;display: block;margin-top: 10px;">领导签字: </span>
      			<span style="text-align: right; margin-right: 30px;margin-top: 10px;">&nbsp;年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;日</span>
          	</div>
          </th>
        </tr>
      </table>
      <p class="small">注：此表填写完成后，交回办公室，再领取学生移交清单。</p>
     
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