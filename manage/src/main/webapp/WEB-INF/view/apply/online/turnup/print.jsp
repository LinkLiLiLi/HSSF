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
		<h1 class="title">合同制职工转企业编制(派得、农芯)申请表</h1>
		<table border="0" cellspacing="0" cellpadding="8" align="center" class="table1">
		<tr>
          <th>姓名</th>
          <td colspan="2">${turnup.userName }</td>
          <th>性别</th>
          <td>
          	<c:if test="${turnup.gender == 0 }">男</c:if>
          	<c:if test="${turnup.gender == 1 }">女</c:if>
          </td>
          <th>出生年月</th>
          <td colspan="2"><fmt:formatDate value="${turnup.birth }" pattern="yyyy-MM-dd"/></td>
          <td rowspan="6">
          	<c:choose>
          		<c:when test="${turnup.headPath == null || turnup.headPath == ''}">
          			照片
          		</c:when>
          		<c:otherwise>
          			<img alt="照片" src="upload/${turnup.headPath}" width="140" height="190">
          		</c:otherwise>
          	</c:choose>
          </td>
        </tr>
        <tr>
          <th width="70px;">民族</th>
          <td width="30px">${turnup.nation }</td>
          <th width="40px">婚否</th>
          <td width="40px">
          	<c:if test="${turnup.marriage == 0 }">已婚</c:if>
          	<c:if test="${turnup.marriage == 1 }">未婚</c:if>
          </td>
          <th width="80px;">政治面貌</th>
          <td width="80px;">${turnup.outlook }</td>
          <th width="50px;">籍贯</th>
          <td width="60px;">${turnup.place }</td>
        </tr>
        <tr>
          <th>家庭地址</th>
          <td colspan="4">${turnup.homeAddress }</td>
          <th>部门</th>
          <td colspan="2">${turnup.dept }</td>
        </tr>
        <tr>
          <th>手机号码</th>
          <td colspan="3">${turnup.phoneNumber }</td>
          <th>身份证号</th>
          <td colspan="3">${turnup.idCard }</td>
        </tr>
        <tr>
          <th>毕业院校</th>
          <td colspan="4">${turnup.school }</td>
          <th>专业</th>
          <td colspan="2">${turnup.major }</td>
        </tr>
        <tr>
          <th>毕业时间</th>
          <td colspan="4">${turnup.graduationTime }</td>
          <th>学历</th>
          <td colspan="2">${turnup.education }</td>
        </tr>
        <tr>
          <th>学位</th>
          <td colspan="2">${turnup.degree }</td>
          <th colspan="2">参加工作时间</th>
          <td>${turnup.joinWorkTime }</td>
          <th colspan="2">来中心时间</th>
          <td colspan="2"${turnup.centerTime }></td>
        </tr>
        <tr>
          <th>连续工龄</th>
          <td colspan="2">${turnup.workingYears }</td>
          <th colspan="2">现工作岗位</th>
          <td>${turnup.post }</td>
          <th colspan="2">宅电</th>
          <td colspan="2">${turnup.mobile }</td>
        </tr>
        <tr>
          <th colspan="9">
          	<div style="text-align: left;">
          		工作经历:
          	</div>
          	<div style="text-align: left;height: 125px;margin-top: 5px;">
          		<div>
	          		<span style="display: inline-block;width: 200px; text-align: center;line-height: 20px;">起始时间</span>
	          		<span style="display: inline-block;width: 200px; text-align: center;line-height: 20px;">工作单位</span>
	          		<span style="display: inline-block;width: 200px; text-align: center;line-height: 20px;">是否上保险</span>
          		</div>
          		<c:forEach items="${turnup.workExperienceList}" var="work" varStatus="status">
          			<div>
          				<span style="display: inline-block;width: 200px; text-align: center;line-height: 20px;">${work.beginTime }&nbsp;-&nbsp;${work.endTime }</span>
          				<span style="display: inline-block;width: 200px; text-align: center;line-height: 20px;">${work.unit }</span>
          				<span style="display: inline-block;width: 200px; text-align: center;line-height: 20px;">
	          				<c:if test="${work.insurance == 0 }">是</c:if>
	          				<c:if test="${work.insurance == 1 }">否</c:if>
          				</span>
          			</div>
          		</c:forEach>
          	</div>
          </th>
        </tr>
        <tr>
          <th colspan="9">
          	<div style="text-align: left;height: 110px;">
          		现工作表现与业绩:
          	</div>
          	<div style="text-align: right; margin-right: 20px;">
          		<span style="text-align: right; margin-right: 250px;">申请人：</span>
          		<span style="text-align: right; margin-right: 150px;">日期:</span>
          	</div>
          </th>
        </tr>
        <tr>
          <th colspan="9">
          	<div style="text-align: left;height: 110px;">
          		部门推荐意见:
          	</div>
          	<div style="text-align: right; margin-right: 20px;">
          		<span style="text-align: right; margin-right: 250px;">签字:</span>
          		<span style="text-align: right; margin-right: 150px;">日期:</span>
          	</div>
          </th>
        </tr>
        <tr>
          <th colspan="9">
          	<div style="text-align: left;height: 110px;">
          		中心主任意见:
          	</div>
          	<div style="text-align: right; margin-right: 20px;">
          		<span style="text-align: right; margin-right: 250px;">签字:</span>
          		<span style="text-align: right; margin-right: 150px;">日期:</span>
          	</div>
          </th>
        </tr>
      </table>
      <p class="small">办公室留存</p>
     
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