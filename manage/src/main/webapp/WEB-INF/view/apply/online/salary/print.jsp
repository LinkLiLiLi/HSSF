<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<base href="<%=request.getContextPath() %>/">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title>打印</title>  
    <link rel="stylesheet" href="css/apply.css" />
    <script src="js/jquery.js"></script>
</head>
<body>
  	<h1 class="title">调薪申请表</h1>
		<p class="text-r bold">
			<span style="display: inline-block; width: 40px;text-align: center;"><fmt:formatDate value="${salary.applyTime }" pattern="yyyy"/></span>年
			<span style="display: inline-block; width: 20px;text-align: center;"><fmt:formatDate value="${salary.applyTime }" pattern="MM"/></span>月
			<span style="display: inline-block; width: 20px;text-align: center;"><fmt:formatDate value="${salary.applyTime }" pattern="dd"/></span>日
		</p>
		<table border="0" cellspacing="0" cellpadding="8" align="center" class="table1">
		<tr>
          <th width="120">所属部门</th>
          <td width="130">${salary.dept }</td>
          <th width="90">姓名</th>
          <td width="130">${salary.userName }</td>
          <th width="90">学历/位</th>
          <td width="130">${salary.education }</td>
        </tr>
        <tr>
          <th>入中心时间</th>
          <td>${salary.centerTime }</td>
          <th>编制</th>
          <td>${salary.organization }</td>
          <th>职称</th>
          <td>${salary.titleName }</td>
        </tr>
        <tr>
          <th>现岗位津贴</th>
          <td>${salary.beforeAmount }</td>
          <th>月工资</th>
          <td>${salary.beforeWages }</td>
          <th>调整后岗贴</th>
          <td>${salary.afterAmount }</td>
        </tr>
        <tr>
          <th>调整后月工资</th>
          <td>${salary.afterWages }</td>
          <th>年度月工资</th>
          <td>/</td>
          <th>变动日期</th>
          <td>${salary.changeTime }</td>
        </tr>
        <tr>
          <th colspan="6" height="190px;">
          	<div style="height: 170px;">
          		申请调薪理由
          	</div>
          	<div style="text-align: right; margin-right: 20px;">
          		<span style="text-align: right; margin-right: 200px;">部门主任：</span>
          		<span style="text-align: right;">&nbsp;年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;日</span>
          	</div>
          </th>
        </tr>
        <tr>
          <th>
          	行政办公室审核
          </th>
          <th colspan="5" height="120px;">
          	<div style="height: 100px;"> </div>
          	<div style="text-align: right; margin-right: 20px;">
          		<span style="text-align: right; margin-right: 225px;">审核人:</span>
          		<span style="text-align: right;">&nbsp;年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;日</span>
          	</div>
          </th>
        </tr>
        <tr>
          <th>
          	中心领导审批意见
          </th>
          <th colspan="5" height="140px;">
          	<div style="height: 120px;"> </div>
          	<div style="text-align: right; margin-right: 20px;">
          		<span style="text-align: right; margin-right: 215px;">审批人：</span>
          		<span style="text-align: right;">&nbsp;年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;日</span>
          	</div>
          </th>
        </tr>
        <tr>
          <th>
          	行政办公室<br />落实并存档
          </th>
          <th colspan="5" height="120px;">
          	<div style="height: 100px;"> </div>
          	<div style="text-align: right; margin-right: 20px;">
          		<span style="text-align: right; margin-right: 215px;">存档人：</span>
          		<span style="text-align: right;">&nbsp;年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;月&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;日</span>
          	</div>
          </th>
        </tr>
      </table>
      <p class="small">注：岗位津贴</p>
     
     <div id="printDiv" style="text-align: center;margin-top: 10px;">
     	<button class="button" type="button" onClick="printData();" >&nbsp;&nbsp;&nbsp;打印&nbsp;&nbsp;&nbsp;</button>
     </div>
</body>
	<script type="text/javascript">
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
</html>