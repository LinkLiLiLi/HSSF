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
		<h1 class="title">人事变动表</h1>
		<p class="text-r bold">
		 填报日期：<span style="display: inline-block; width: 40px;text-align: center;"><fmt:formatDate value="${changeDept.applyTime }" pattern="yyyy"/></span>年
			<span style="display: inline-block; width: 20px;text-align: center;"><fmt:formatDate value="${changeDept.applyTime }" pattern="MM"/></span>月
			<span style="display: inline-block; width: 20px;text-align: center;"><fmt:formatDate value="${changeDept.applyTime }" pattern="dd"/></span>日
		</p>
		<table border="0" cellspacing="0" cellpadding="8" align="center" class="table1">
		<tr>
          <th width="50%" style="text-align: left;">姓名：${changeDept.userName }</th>
          <th width="50%" style="text-align: left;">入中心日期：${changeDept.centerTime }</th>
        </tr>
        <tr>
          <th style="text-align: left;">变动前部门：${changeDept.beforeDept }</th>
          <th style="text-align: left;">变动后部门：${changeDept.afterDept }</th>
        </tr>
        <tr>
          <th colspan="2" >
          	<div style="text-align: left;">类别：</div>
          	<div style="text-align: left;margin-top: 5px;">
          			<c:choose>
		         		<c:when test="${changeDept.changeType == 1}"><img src="images/dui.png"/></c:when>
		         		<c:otherwise><img src="images/kong.png"/></c:otherwise>
		         	</c:choose>
          		<span style="line-height: 30px;">调岗</span>
          		<span style="margin-left: 25px;">
          			<c:choose>
		         		<c:when test="${changeDept.changeType == 2}"><img src="images/dui.png"/></c:when>
		         		<c:otherwise><img src="images/kong.png"/></c:otherwise>
		         	</c:choose>
          		借调
          		<c:choose>
		         	<c:when test="${changeDept.changeType == 2}">（截止期限：
		         		<span style="display: inline-block;width: 35px;">
		         			<fmt:formatDate value="${changeDept.applyTime }" pattern="yyyy"/>
		         		</span>年
		         		<span style="display: inline-block;width: 20px;">
		         			<fmt:formatDate value="${changeDept.applyTime }" pattern="MM"/>
		         		</span>月
		         		<span style="display: inline-block;width: 20px;">
		         			<fmt:formatDate value="${changeDept.applyTime }" pattern="dd"/>
		         		</span>日）
		         	</c:when>
		         	<c:otherwise>（截止期限：　年　月　日）</c:otherwise>
		         </c:choose>
          		</span>
          		<span style="margin-left: 25px;">
          		<c:choose>
		         		<c:when test="${changeDept.changeType == 3}"><img src="images/dui.png"/></c:when>
		         		<c:otherwise><img src="images/kong.png"/></c:otherwise>
		         	</c:choose>
          		调薪</span>
          		<span style="margin-left: 25px;">
          		<c:choose>
	         		<c:when test="${changeDept.changeType == 4}">
	         			<img src="images/dui.png"/>其他<span style="display: inline-block;width: 100px;text-align: center;border-bottom: 1px solid black;">${changeDept.otherInfo}</span>
	         		</c:when>
	         		<c:otherwise>
	         			<img src="images/kong.png"/>
	         			其他<span style="display: inline-block;width: 100px;text-align: center;border-bottom: 1px solid black;"></span>
	         		</c:otherwise>
	         	</c:choose>
          		</span>
          	</div>
          </th>
        </tr>
        <tr>
			<th colspan="2">简述理由</th>
        </tr>
        <tr>
          <th colspan="2">
          	<div style="height: 110px;"></div>
          	<div style="text-align: right; margin-right: 20px;">
          		<span style="text-align: right; margin-right: 140px;">申请部门(人)  签字：</span>
          		<span style="text-align: right;margin-right: 50px;">日期：</span>
          	</div>
          </th>
        </tr>
        <tr>
          <th>调出意见栏</th>
          <th>调入意见栏</th>
        </tr>
        <tr>
          <th>
          	<div style="height: 60px;"></div>
          	<div style="text-align: right; margin-right: 20px;">
          		<span style="text-align: right; margin-right: 105px;">部门主任签字：</span>
          		<span style="text-align: right;margin-right: 50px;">日期：</span>
          	</div>
          </th>
          <th>
          	<div style="height: 60px;"></div>
          	<div style="text-align: right; margin-right: 20px;">
          		<span style="text-align: right; margin-right: 105px;">部门主任签字：</span>
          		<span style="text-align: right;margin-right: 50px;">日期：</span>
          	</div>
          </th>
        </tr>
        <tr>
			<th colspan="2">岗位津贴</th>
        </tr>
        <tr>
          <th>
          	<div style="height: 80px;text-align: left;">
          		<span style="text-align: left; margin-left: 10px;">变动前：</span><br />
          		<span style="line-height:20px;text-align: left; margin-left: 90px; width: 20px;border-bottom: 1px solid black;display: inline-block;width: 70px;text-align: center;">${changeDept.beforeAmount }</span>元
          	</div>
          	<div style="text-align: right; margin-right: 20px;">
          		<span style="text-align: right; margin-right: 190px;">办公室主任签字：</span><br />
          		<span style="text-align: right;margin-right: 50px;">日期：</span>
          	</div>
          </th>
          <th>
          	<div style="height: 80px;text-align: left;">
          		<span style="text-align: left; margin-left: 10px;">变动后：</span><br />
          		<span style="line-height:20px;text-align: left; margin-left: 90px; width: 20px;border-bottom: 1px solid black;display: inline-block;width: 70px;text-align: center;">${changeDept.beforeAmount }</span>元
          		<br/><span style="line-height:20px;text-align: left; margin-left: 75px;">自</span><span style="text-align: left; border-bottom: 1px solid black;display: inline-block;text-align: center;width: 50px;"><fmt:formatDate value="${changeDept.changeTime }" pattern="yyyy"/></span>年
          		<span style="text-align: left; border-bottom: 1px solid black;display: inline-block;width: 30px;text-align: center;"><fmt:formatDate value="${changeDept.changeTime }" pattern="MM"/></span>月起执行
          	</div>
          	<div style="text-align: right; margin-right: 20px;">
          		<span style="text-align: right; margin-right: 175px;">调入部门主任签字：</span><br />
          		<span style="text-align: right;margin-right: 50px;">日期：</span>
          	</div>
          </th>
        </tr>
        <tr>
			<th colspan="2">领导审批栏</th>
        </tr>
        <tr>
          <th colspan="2">
          	<div style="height:80px;"></div>
          	<div style="text-align: right; margin-right: 20px;">
          		<span style="text-align: right; margin-right: 140px;">主任签字：</span>
          		<span style="text-align: right;margin-right: 50px;">日期：</span>
          	</div>
          </th>
        </tr>
        <tr>
          <th>
          	<div style="height: 70px;text-align: left;">
          		<span style="text-align: left; margin-left: 10px;">办公室承办情况：</span>
          	</div>
          	<div style="text-align: right; margin-right: 20px;">
          		<span style="text-align: right; margin-right: 120px;">承办人签字：</span>
          		<span style="text-align: right;margin-right: 50px;">日期：</span>
          	</div>
          </th>
          <th>
          	<div style="height: 70px;text-align: left;">
          		<span style="text-align: left; margin-left: 10px;">财务部承办情况：</span>
          	</div>
          	<div style="text-align: right; margin-right: 20px;">
          		<span style="text-align: right; margin-right: 120px;">承办人签字：</span>
          		<span style="text-align: right;margin-right: 50px;">日期：</span>
          	</div>
          </th>
        </tr>
      </table>
      <p class="small">注：此表用于中心内部人员调整岗位（部门）时使用，由办公室存入职工档案。</p>
     
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
