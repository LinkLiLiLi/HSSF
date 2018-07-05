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
		<h1 class="title">学生登记表</h1>
		<table border="0" cellspacing="0" cellpadding="8" align="center" class="table1">
		<tr>
          <th width="95">姓名</th>
          <td width="50">${register.userName }</td>
          <th width="45">性别</th>
          <td width="40">
          	<c:if test="${register.gender == 0 }">男</c:if>
            <c:if test="${register.gender == 1 }">女</c:if>
          </td>
          <th width="40">民族</th>
          <td width="40">${register.nation }</td>
          <th width="60">籍贯</th>
          <td>${register.place }</td>
        </tr>
        <tr>
          <th>学历</th>
          <td>${register.education }</td>
          <th colspan="2">是否在读</th>
          <td>
          	<c:if test="${register.readingStudent == 0 }">是</c:if>
          	<c:if test="${register.readingStudent == 1 }">否</c:if>
          </td>
          <th colspan="2">出生日期</th>
          <td><fmt:formatDate value="${register.birth }" pattern="yyyy-MM-dd"/></td>
        </tr>
        <tr>
          <th>E-mail</th>
          <td colspan="4">${register.email }</td>
          <th colspan="2">联系电话（手机）</th>
          <td>${register.phone }</td>
        </tr>
        <tr>
          <th>专业</th>
          <td colspan="4">${register.major }</td>
          <th colspan="2">入学时间</th>
          <td><fmt:formatDate value="${register.entranceTime }" pattern="yyyy-MM-dd"/></td>
        </tr>
        <tr>
          <th>就读学校</th>
          <td colspan="4">${register.school }</td>
          <th colspan="2">毕业时间</th>
          <td><fmt:formatDate value="${register.graduationTime }" pattern="yyyy-MM-dd"/></td>
        </tr>
        <tr>
          <th>第一导师</th>
          <td colspan="4">${register.firstMentor }</td>
          <th colspan="2">到中心时间</th>
          <td><fmt:formatDate value="${register.centerTime }" pattern="yyyy-MM-dd"/></td>
        </tr>
        <tr>
          <th>第二导师</th>
          <td colspan="4">${register.secondMentor }</td>
          <th colspan="2">中心责任导师</th>
          <td>${register.centerMentor }</td>
        </tr>
        <tr>
          <th>所在课题组</th>
          <td colspan="4">${register.projectGroup }</td>
          <th colspan="2">预计离开时间</th>
          <td><fmt:formatDate value="${register.departureTime }" pattern="yyyy-MM-dd"/></td>
        </tr>
        <tr>
          <th>课题组负责人</th>
          <td colspan="4">${register.projectGroupPerson }</td>
          <th colspan="2">兴趣爱好</th>
          <td>${register.hobby }</td>
        </tr>
        <tr>
          <th>身份证号码</th>
          <td colspan="4">${register.idCard }</td>
          <th colspan="2">办公电话（座机）</th>
          <td>${register.mobile }</td>
        </tr>
        <tr>
          <th>紧急情况联系人及联系电话</th>
          <td colspan="4">${register.contacts }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${register.contactsPhone }</td>
          <th colspan="2">与本人关系</th>
          <td>${register.relationship }</td>
        </tr>
        <tr>
          <th>是否担任过学生干部</th>
          <td>
          	<c:if test="${register.cadres == 0 }">是</c:if>
          	<c:if test="${register.cadres == 1 }">否</c:if>
          </td>
          <th>任过何种职务</th>
          <td colspan="2">${register.post }</td>
          <th>培养方式</th>
          <th colspan="2" style="text-align: left;">
          	<span style="line-height: 20px;">联合培养（&nbsp;&nbsp;<c:if test="${register.mode == 1 }">√</c:if>&nbsp;&nbsp;）</span><br />
          	<span style="line-height: 20px;">客座培养（&nbsp;&nbsp;<c:if test="${register.mode == 2 }">√</c:if>&nbsp;&nbsp;）短期实习（&nbsp;&nbsp;<c:if test="${register.mode == 3 }">√</c:if>&nbsp;&nbsp;）</span>
          </th>
        </tr>
        <tr>
          <th><span style="display:-moz-inline-box;display:inline-block;width:10px; ">自我介绍</span></th>
          <th colspan="7">
          	<div style="height: 450px;text-align: left;">
          		${register.selfInfo }
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
