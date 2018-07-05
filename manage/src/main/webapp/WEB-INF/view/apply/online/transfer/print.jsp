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
  	<h1 class="title">转账单《汇款单：本市、外埠》</h1>
		<p class="bold" style="text-align: center;">
			<span style="width: 40px; display: inline-block;text-align: center;" ><fmt:formatDate value="${transfer.transDate }" pattern="yyyy"/></span>年
			<span style="width: 30px; display: inline-block;text-align: center;" ><fmt:formatDate value="${transfer.transDate }" pattern="MM"/></span>月
			<span style="width: 30px; display: inline-block;text-align: center;" ><fmt:formatDate value="${transfer.transDate }" pattern="dd"/></span>日
		</p>
		<table border="0" cellspacing="0" cellpadding="8" align="center" class="table1">
		<tr>
          <th style="width: 70px;">收款单位</th>
          <td colspan="3">${transfer.receiveUnit }</td>
        </tr>
        <tr>
          <th>账&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号</th>
          <td colspan="3">${transfer.accountId }</td>
        </tr>
        <tr>
          <th>开户银行</th>
          <td colspan="3">${transfer.bank }</td>
        </tr>
        <tr>
          <th>金&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;额</th>
          <td colspan="1">（人民币大写）${CN}</td>
          <td colspan="2">￥：${transfer.amount }</td>
        </tr>
        
        <tr>
          <th>汇款用途</th>
          <td colspan="1">${transfer.useInfo }</td>
          <th colspan="1" style="width: 70px;">支出单位</th>
          <td colspan="1" style="width: 180px;">${transfer.payUnit }</td>
        </tr>
        
        <tr>
          <th>支出项目</th>
          <td colspan="1">${transfer.project.projectName }</td>
          <th colspan="1">财务编号</th>
          <td colspan="1">${transfer.number }</td>
        </tr>
        
        <tr>
          <th>分类明细</th>
          <td colspan="1">${transfer.detail }</td>
          <th colspan="1">合&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;同</th>
          <td colspan="1">
          	<c:if test="${transfer.pact == 0 }"><img src="images/dui.png"/>&nbsp;有&nbsp;&nbsp;&nbsp;&nbsp;<img src="images/kong.png"/>&nbsp;无</c:if>
          	<c:if test="${transfer.pact == 1 }"><img src="images/kong.png"/>&nbsp;有&nbsp;&nbsp;&nbsp;&nbsp;<img src="images/dui.png"/>&nbsp;无</c:if>
          </td>
        </tr>
        <tr>
          <th>发票状态</th>
          <td colspan="3">
          	<c:if test="${transfer.status == 0 }"><img src="images/dui.png"/>&nbsp;有发票&nbsp;&nbsp;&nbsp;&nbsp;<img src="images/kong.png"/>&nbsp;无发票：约（）个工作日后归还发票</c:if>
          	<c:if test="${transfer.status == 1 }"><img src="images/kong.png"/>&nbsp;有发票&nbsp;&nbsp;&nbsp;&nbsp;<img src="images/dui.png"/>&nbsp;无发票：约（${transfer.workDay }）个工作日后归还发票</c:if>
          </td>
        </tr>
        <tr>
          <th>备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注</th>
          <td colspan="3">${transfer.remark }</td>
        </tr>
      </table>
      <p >
      	申办人：<span style="width: 60px; display: inline-block;"></span>
      	经办人：<span style="width: 60px; display: inline-block;"></span>
      	审核人：<span style="width: 60px; display: inline-block;"></span>
      	部门负责人：<span style="width: 60px; display: inline-block;"></span>
      	单位负责人：<span style="width: 60px; display: inline-block;"></span>
      </p>
     
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