<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<base href="<%=request.getContextPath() %>/">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title>用户详情</title>  
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
  <div class="panel-head"><strong>用户详情</strong></div>
  <div class="body-content">
    <form action="user/edit" method="post" class="form-x" id="form-article-add" enctype="multipart/form-data">
      <div class="form-group">
        <div class="label">
          <label>姓名：</label>
        </div>
        <div class="field cc">
          ${user.name }
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>性别：</label>
        </div>
        <div class="field cc">
          	<c:if test="${user.sex == 0 }">男</c:if>
			<c:if test="${user.sex == 1 }">女</c:if>
        </div>
      </div>
      <div class="form-group" >
        <div class="label">
          <label>登录名：</label>
        </div>
        <div class="field cc">
         ${user.userName }
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>所属小组：</label>
        </div>
        <div class="field cc">
          	${user.userGroup.groupName }
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>岗位：</label>
        </div>
        <div class="field cc">
          <c:if test="${user.post == 0 }">主任</c:if>
			<c:if test="${user.post == 1 }">组长</c:if>
			<c:if test="${user.post == 2 }">职工</c:if>
			<c:if test="${user.post == 3 }">学生</c:if>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>权限设置：</label>
        </div>
        <div class="field cc">
          ${user.role.roleName }
        </div>
      </div>
      <div class="form-group" style="display:none;">
        <div class="label">
          <label>身份证号：</label>
        </div>
        <div class="field cc">
          ${user.idCard }
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>电话号：</label>
        </div>
        <div class="field cc">
          ${user.phoneNumber }
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>入中心时间：</label>
        </div>
        <div class="field cc">
          ${user.inductionTime }
        </div>
      </div>
      <div class="form-group" >
        <div class="label">
          <label>离开中心时间：</label>
        </div>
        <div class="field cc">
          ${user.departureTime }
        </div>
      </div>
     
      <div class="form-group">
        <div class="label">
          <label>职称：</label>
        </div>
        <div class="field cc">
          ${user.titles }
          
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>状态：</label>
        </div>
        <div class="field cc">
            <c:if test="${user.status == 1 }">在岗</c:if>
			<c:if test="${user.status == 2 }">离职</c:if>
			<c:if test="${user.status == 3 }">辞退</c:if>
			<c:if test="${user.status == 4 }">换岗</c:if>
        </div>
      </div>  
              
      <div class="form-group">
        <div class="label">
          <label>学校：</label>
        </div>
        <div class="field cc">
          ${user.school }
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>学历：</label>
        </div>
        <div class="field cc">
			<c:if test="${user.status == 1 }">硕士</c:if>
			<c:if test="${user.status == 2 }">博士</c:if>
			<c:if test="${user.status == 3 }">学士</c:if>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>入学时间：</label>
        </div>
        <div class="field cc">
          ${user.entranceTime }
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>毕业时间：</label>
        </div>
        <div class="field cc">
        	${user.graduationTime }
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>中心导师：</label>
        </div>
        <div class="field cc">
          ${user.tutor }
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>上传图片：</label>
        </div>
        <div class="field cc">
          <c:if test="${user.imageUrl != null && user.imageUrl != ''}"><img style="width:130px;height: 130px;" src="upload/${user.imageUrl }"></c:if>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>启用状态：</label>
        </div>
        <div class="field cc">
        	<c:if test="${user.useStatus == 0 }">启用</c:if>
            <c:if test="${user.useStatus == 1 }">禁用</c:if>
        </div>
      </div>
    </form>
  </div>
</div>
</body>
	<script type="text/javascript">
		function back (){
			window.location.href="user/list";
		}
	</script>
</html>