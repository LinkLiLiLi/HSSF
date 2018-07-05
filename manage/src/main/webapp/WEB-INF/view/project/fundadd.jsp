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
    <title>创建纵向课题</title>  
    <link rel="stylesheet" href="css/pintuer.css">
    <link rel="stylesheet" href="css/admin.css">
    <script src="js/jquery.js"></script>
    <script src="js/pintuer.js"></script>
    <script src="laydate/laydate.js"></script>  
</head>
<body>
<div class="panel admin-panel">
  <div class="panel-head"><strong><span class="icon-pencil-square-o"></span>&nbsp;&nbsp;项目经费变动</strong></div>
  <div class="body-content">
    <form action="project/fundadd" method="post" class="form-x" id="form-article-add" enctype="multipart/form-data">
      <div class="form-group">
        <div class="label">
          <label>项目名称：</label>
        </div>
        <div class="field cc">
          ${project.projectName }
          <input name="project.id" type="hidden" value="${project.id }"/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>经费变动：</label>
        </div>
        <div class="field">
          <select name="fundsDetail.id" class="input w50" style="width: 300px;" onchange="changefunds()">
          	<option value="">请选择</option>
          	<c:forEach items="${detailList }" var="detail">
          		<option value="${detail.id }">${detail.name }</option>
          	</c:forEach>
          </select>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>原预算：</label>
        </div>
        <input type="hidden" name="originalBudget" value=""/>
        <div class="field cc" id="oamount">
          
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>新预算：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="newBudget" value=""/>
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
	function changefunds(){
		var id = $("select[name='fundsDetail.id']").val();
		if(id != '') {
			$.post("project/fund/"+id,function(data){
				$("#oamount").html(data);
				$("input[name='originalBudget']").val(data);
			});
		}
	}
	
	
	
	function userSub(){
		var id = $("select[name='fundsDetail.id']").val();
		var newBudget = $("input[name='newBudget']").val();
		if(id == '') {
			alert("请选择预算科目名称！");
			return ;
		}
		
		if(newBudget == '') {
			alert("请输入新预算！");
			return;
		}
		
		if(isNaN(newBudget)) {
			alert("新预算输入错误！");
			return ;
		}
		
		if(confirm("确认提交？")) {
			$("#form-article-add").submit();
		}
	}
	</script>
</html>