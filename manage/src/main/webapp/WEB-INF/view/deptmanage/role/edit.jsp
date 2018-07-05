<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<base href="<%=request.getContextPath() %>/" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
	<meta name="renderer" content="webkit">
	<title>添加角色</title>
	<link rel="stylesheet" href="css/pintuer.css">
	<link rel="stylesheet" href="css/admin.css">
	<script src="js/jquery.js"></script>
	<script src="js/pintuer.js"></script>
</head>
<body>
<div class="panel admin-panel">
  <div class="panel-head"><strong><span class="icon-pencil-square-o"></span>&nbsp;&nbsp;添加角色</strong></div>
  <div class="body-content">
    <form method="post" class="form-x" action="role/edit" id="roleForm">
      <input name="id" type="hidden" value="${role.id }"/>   
      <div class="form-group">
        <div class="label">
          <label>角色名称：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="roleName" value="${role.roleName }" maxlength="20"/>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>角色描述：</label>
        </div>
        <div class="field">
          <textarea name="content" maxlength="200">${role.roleDesc }</textarea>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label></label>
        </div>
        <div class="field">
          <button class="button bg-main icon-check-square-o" type="button" onclick="roleSubmit()"> 提交</button>
        </div>
      </div>
    </form>
  </div>
</div>
</body>
<script type="text/javascript">
function roleSubmit(){
	var roleName = $("input[name='roleName']").val();
	if(roleName == ""){
		alert("请输入角色名称！");
	} else {
		$("#roleForm").submit();
	}
}
</script>
</html>