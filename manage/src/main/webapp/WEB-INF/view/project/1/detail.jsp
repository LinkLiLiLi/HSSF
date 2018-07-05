<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<base href="<%=request.getContextPath() %>/">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title>查看横向项目</title>  
    <link rel="stylesheet" href="css/pintuer.css">
    <link rel="stylesheet" href="css/admin.css">
    <script src="js/jquery.js"></script>
    <script src="js/pintuer.js"></script>
    <script src="laydate/laydate.js"></script>  
    <style type="text/css">
    	.cc{line-height: 34px;}
    </style>
</head>
<body>
<div class="panel admin-panel">
  <div class="panel-head"><strong><span class="icon-pencil-square-o"></span>&nbsp;&nbsp;查看横向项目</strong></div>
  <div class="body-content">
    <form action="project/0/edit" method="post" class="form-x" id="form-article-add" enctype="multipart/form-data">
      <div class="form-group">
        <div class="label">
          <label>财务编号：</label>
        </div>
        <div class="field cc">
          ${project.financialNumber }
        </div>
      </div>
		
      <div class="form-group">
        <div class="label">
          <label>项目名称：</label>
        </div>
        <div class="field cc">
          ${project.projectName }
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>项目负责人：</label>
        </div>
        <div class="field cc">
          ${project.user.name }
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>项目类别：</label>
        </div>
        <div class="field cc">
          	<c:if test="${1 == project.projectType}">技术开发</c:if> 
          	<c:if test="${2 == project.projectType}">技术服务</c:if>
          	<c:if test="${3 == project.projectType}">技术咨询</c:if> 
          	<c:if test="${4 == project.projectType}">横向工程</c:if> 
          	<c:if test="${5 == project.projectType}">横向产品</c:if> 
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>所在小组：</label>
        </div>
        <div class="field cc">
          ${project.userGroup.groupName }
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>承担单位：</label>
        </div>
        <div class="field cc">
          	<c:if test="${1 == project.unit}">信息中心</c:if> 
          	<c:if test="${2 == project.unit}">装备中心</c:if> 
          	<c:if test="${3 == project.unit}">派得</c:if> 
          	<c:if test="${4 == project.unit}">农芯</c:if> 
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>委托单位：</label>
        </div>
        <div class="field cc">
          	${project.deputeUnit }
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>开始时间：</label>
        </div>
        <div class="field cc">
          <fmt:formatDate value="${project.beginTime }" pattern="yyyy-MM-dd"/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>结束时间：</label>
        </div>
        <div class="field cc">
          <fmt:formatDate value="${project.endTime }" pattern="yyyy-MM-dd"/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>经费总额：</label>
        </div>
        <div class="field cc">
          ${project.totalMoney }
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>档案编号：</label>
        </div>
        <div class="field cc">
          ${project.fileNumber }
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>备注：</label>
        </div>
        <div class="field cc">
          ${project.remark }
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>入账情况：</label>
        </div>
        <div class="field cc">
          <table class="table table-hover text-center">
	      	 <tr>
		        <th>时间</th>
		        <th>金额</th>
		        <th>支付情况</th>
		        <th>发票开具</th>
		        <th>免税认证</th>
		     </tr>							
		     <tbody id="items">
				<c:forEach items="${project.enterList}" var="item" varStatus="status">
					<tr>
						<td>${item.enterTime }</td>
						<td>${item.amount }</td>
						<td>
							<c:if test="${item.payInfo == 0}">已到账</c:if>
							<c:if test="${item.payInfo == 1}">未到账</c:if>
						</td>
						<td>
							<c:if test="${item.billInfo == null}">未开</c:if>
							<c:if test="${item.billInfo == 1}">已开</c:if>
						</td>
						<td>
							<c:if test="${item.dfutyFree == 0}">有</c:if>
							<c:if test="${item.dfutyFree == 1}">无</c:if>
						</td>
					</tr>
				</c:forEach>
				</tbody>
	      </table>
        </div>
      </div>
    </form>
  </div>
</div>
</body>
	<script type="text/javascript">
	function downFile(path){
		window.location.href="upload/" + path;
	}
	function goList(){
		window.location.href="apply/online/remuneration/list";
	}
	</script>
</html>