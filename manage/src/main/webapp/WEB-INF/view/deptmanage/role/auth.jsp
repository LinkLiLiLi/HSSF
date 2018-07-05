<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	<style type="text/css">
		.permission-list{ border:solid 1px #eee; margin:10px}
		.permission-list > dt{ background-color: #59BD1E;padding:10px 10px; color:#FFF}
		.permission-list > dd,
		.cover_style .top_style .info_style{ padding:10px;}
		.permission-list .permission-list2 > dt{ color:#ffffff; background-color: #FCA31D; margin-right:10px;}
		.permission-list > dd > dl{ padding:10px 0}
		.permission-list > dd > dl > dt{ display:inline-block;float:left;white-space:nowrap; width:150px; padding:10px}
		.permission-list > dd > dl > dd{ margin-left:100px;}
		.permission-list > dd > dl > dd > label{ padding-right:10px}
		.permission-list .permission-list2 > dt input[type=checkbox].ace+.lbl::before,.permission-list .permission-list2 > dt input[type=radio].ace+.lbl::before{ border:0px}
		
	</style>
</head>
<body>
<div class="panel admin-panel">
  <div class="panel-head"><strong><span class="icon-users"></span>&nbsp;&nbsp;权限分配</strong></div>
  <div class="body-content">
    <form method="post" class="form-x" action="role/auth" id="roleForm">      
		<input type="hidden" value="${role.id }" name="id"/>
		<div class="Select_Competence">
	  <c:forEach items="${functionList}" var="function" varStatus="status">
	  	<dl class="permission-list">
		<dt><label class="middle"><input name="functionIds" class="ace" type="checkbox" id="id-disable-check" value="${function.id }" <c:if test="${function.flag == 1 }">checked="checked"</c:if>/><span class="lbl">${function.functionName}</span></label></dt>
		<dd>
		 <c:forEach  items="${function.functionList}" var="functionFun" varStatus="statusFun">
			 <dl class="cl permission-list2">
			 	<dt><label class="middle"><input type="checkbox" value="${functionFun.id }" class="ace"  name="functionFunIds" id="id-disable-check" <c:if test="${functionFun.flag == 1 }">checked="checked"</c:if>/><span class="lbl">${functionFun.functionName }</span></label></dt>
		         <dd>
		         	<c:forEach items="${functionFun.functionList}" var="functionBtn" varStatus="statusBtn">
					   <label class="middle"><input type="checkbox" value="${functionBtn.id }" class="ace" name="functionBtnIds" id="user-Character-0-0-0"  <c:if test="${functionBtn.flag == 1 }">checked="checked"</c:if>/><span class="lbl">${functionBtn.functionName }</span></label>
		         	</c:forEach>
				</dd>
			</dl>
		 </c:forEach>
		</dd>
	    </dl>
	  </c:forEach>
      </div> 
      <div class="form-group">
        <div class="field" style="text-align: center;margin-top: 20px;">
          <button class="button bg-main icon-check-square-o" type="button" onclick="roleSubmit()"> 提交</button>
        </div>
      </div>
    </form>
  </div>
</div>
</body>
<script type="text/javascript">
/*按钮选择*/
	$(function(){
		$(".permission-list dt input:checkbox").click(function(){
			$(this).closest("dl").find("dd input:checkbox").prop("checked",$(this).prop("checked"));
		});
		$(".permission-list2 dd input:checkbox").click(function(){
			var l =$(this).parent().parent().find("input:checked").length;
			var l2=$(this).parents(".permission-list").find(".permission-list2 dd").find("input:checked").length;
			if($(this).prop("checked")){
				$(this).closest("dl").find("dt input:checkbox").prop("checked",true);
				$(this).parents(".permission-list").find("dt").first().find("input:checkbox").prop("checked",true);
			}
			else{
				if(l==0){
					$(this).closest("dl").find("dt input:checkbox").prop("checked",false);
				}
				if(l2==0){
					$(this).parents(".permission-list").find("dt").first().find("input:checkbox").prop("checked",false);
				}
			}
			
		});
	});
	function roleSubmit(){
		if(confirm("确认赋权？")){
			$("#roleForm").submit();
		}
	}

</script>
</html>