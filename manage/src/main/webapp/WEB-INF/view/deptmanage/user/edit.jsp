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
    <title>修改用户</title>  
    <link rel="stylesheet" href="css/pintuer.css">
    <link rel="stylesheet" href="css/admin.css">
    <script src="js/jquery.js"></script>
    <script src="js/pintuer.js"></script>
    <script src="laydate/laydate.js"></script>  
</head>
<body>
<div class="panel admin-panel">
  <div class="panel-head"><strong><span class="icon-pencil-square-o"></span>&nbsp;&nbsp;修改用户</strong></div>
  <div class="body-content">
    <form action="user/edit" method="post" class="form-x" id="form-article-add" enctype="multipart/form-data">
    	<input name="id" value="${user.id }" type="hidden"/>
      <div class="form-group">
        <div class="label">
          <label>姓名：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="name" value="${user.name }" maxlength="10"/>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>性别：</label>
        </div>
        <div class="field">
          <select name="sex" class="input w50" style="width: 300px;">
          	<option value="0" <c:if test="${user.sex == 0 }">selected </c:if>>男</option>
          	<option value="1" <c:if test="${user.sex == 1 }">selected </c:if>>女</option>
          </select>
        </div>
      </div>
      <div class="form-group" >
        <div class="label">
          <label>登录名：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="userName" value="${user.userName }" maxlength="20"/>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>所属小组：</label>
        </div>
        <div class="field">
          	<select name="userGroup.id" class="input w50" style="width: 300px;">
				<c:forEach items="${userGroupList }" var="group">
					<option value="${group.id }" <c:if test="${user.userGroup.id == group.id }">selected</c:if>>${group.groupName}</option>
				</c:forEach>
			</select>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>岗位：</label>
        </div>
        <div class="field">
          <select name="post" class="input w50" style="width: 300px;">
			<option value="0" <c:if test="${user.post == 0 }">selected</c:if>>主任</option>
			<option value="1" <c:if test="${user.post == 1 }">selected</c:if>>组长</option>
			<option value="2" <c:if test="${user.post == 2 }">selected</c:if>>职工</option>
			<option value="3" <c:if test="${user.post == 3 }">selected</c:if>>学生</option>
		</select>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>权限设置：</label>
        </div>
        <div class="field">
          <select name="role.id" class="input w50"  style="width: 300px;">
			<c:forEach items="${roleList }" var="role">
				<option value="${role.id }" <c:if test="${user.role.id == role.id }">selected</c:if>>${role.roleName}</option>
			</c:forEach>
		</select>
        </div>
      </div>
      <div class="form-group" style="display:none;">
        <div class="label">
          <label>身份证号：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="idCard" value="${user.idCard }" maxlength="30"/>
          
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>电话号：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="phoneNumber" value="${user.phoneNumber }" maxlength="20"/>
          
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>入中心时间：</label>
        </div>
        <div class="field">
          <input type="text" class="input" id="inductionTime" name="inductionTime" value="${user.inductionTime }" />
          
        </div>
      </div>
      <div class="form-group" >
        <div class="label">
          <label>离开中心时间：</label>
        </div>
        <div class="field">
          <input type="text" class="input" id="departureTime" name="departureTime" value="${user.departureTime }" />
          
        </div>
      </div>
     
      <div class="form-group">
        <div class="label">
          <label>职称：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="titles" value="${user.titles }" maxlength="50"/>
          
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>状态：</label>
        </div>
        <div class="field">
          <select name="status" class="input w50"  style="width: 300px;">
			<option value="1" <c:if test="${user.status == 1 }">selected</c:if>>在岗</option>
			<option value="2" <c:if test="${user.status == 2 }">selected</c:if>>离职</option>
			<option value="3" <c:if test="${user.status == 3 }">selected</c:if>>辞退</option>
			<option value="4" <c:if test="${user.status == 4 }">selected</c:if>>换岗</option>
		</select>
        </div>
      </div>  
              
      <div class="form-group">
        <div class="label">
          <label>学校：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="school" value="${user.school }" maxlength="30"/>
          
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>学历：</label>
        </div>
        <div class="field">
          <select name="education" class="input w50"  style="width: 300px;">
			<option value="1" <c:if test="${user.status == 1 }">selected</c:if>>硕士</option>
			<option value="2" <c:if test="${user.status == 2 }">selected</c:if>>博士</option>
			<option value="3" <c:if test="${user.status == 3 }">selected</c:if>>学士</option>
		</select>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>入学时间：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="entranceTime" id="entranceTime" value="${user.entranceTime }" />
          
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>毕业时间：</label>
        </div>
        <div class="field">
        	<input type="text" class="input" id="graduationTime" name="graduationTime" value="${user.graduationTime }" />
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>中心导师：</label>
        </div>
        <div class="field">
          <input name="tutor" class="input" value="${user.tutor }" maxlength="10"></input>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>上传图片：</label>
        </div>
        <div class="field">
          <input type="file" class="input-text" value="" placeholder="" id="" name="file" style="width: 300px;">
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>启用状态：</label>
        </div>
        <div class="field">
        	<select name="useStatus" class="input w50"  style="width: 300px;">
			<option value="0" <c:if test="${user.useStatus == 0 }">selected </c:if>>启用</option>
			<option value="1" <c:if test="${user.useStatus == 1 }">selected </c:if>>禁用</option>
		</select>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label></label>
        </div>
        <div class="field">
          <button class="button bg-main icon-check-square-o" type="button" onClick="userSub();"> 提交</button>
        </div>
      </div>
    </form>
  </div>
</div>
</body>
	<script type="text/javascript">
		laydate.render({
		    elem: '#inductionTime',
		    event: 'focus' 
		});
		laydate.render({
		    elem: '#departureTime',
		    event: 'focus' 
		});
		laydate.render({
		    elem: '#entranceTime',
		    event: 'focus' 
		});
		laydate.render({
		    elem: '#graduationTime',
		    event: 'focus' 
		});
		function userSub(){
			var name = $("input[name='name']").val();
			var userName = $("input[name='userName']").val();
			if(userName ==""){
				alert("请输入姓名！");
				return ;
			}
			
			if(userName ==""){
				alert("请输入用户名！");
				return ;
			}
			
			if(confirm("确认提交吗？")){
				$("#form-article-add").submit();
			}
		}
		function back (){
			window.location.href="user/list";
		}
	</script>
</html>