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
    <title>创建项目实施</title>  
    <link rel="stylesheet" href="css/pintuer.css">
    <link rel="stylesheet" href="css/admin.css">
    <script src="js/jquery.js"></script>
    <script src="js/pintuer.js"></script>
    <script src="laydate/laydate.js"></script>  
</head>
<body>
<div class="panel admin-panel">
  <div class="panel-head"><strong><span class="icon-pencil-square-o"></span>&nbsp;&nbsp;项目实施</strong></div>
  <div class="body-content">
    <form action="project/startup/add" method="post" class="form-x" id="form-article-add" enctype="multipart/form-data">
      <div class="form-group">
        <div class="label">
          <label>业务名称：</label>
        </div>
        <div class="field">
          <select name="project.id" class="input">
          	<option value="">请选择项目</option>
          	<c:forEach var="project" items="${projectList}">
          		<option value="${project.id }">${project.projectName }</option>
          	</c:forEach>
          </select>
        </div>
      </div>
	  
	  <div class="form-group">
        <div class="label">
          <label>截止日期：</label>
        </div>
        <div class="field">
          <input type="text" class="input" id="endDate" name="endDate" value=""/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>状态：</label>
        </div>
        <div class="field">
          <select name="status" class="input w50" style="width: 300px;">
          	<option value="1">正在进行</option>
          	<option value="2">暂停</option>
          	<option value="3">终止</option>
          </select>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>上传附件：</label>
        </div>
        <div class="field">
          <table class="table table-hover text-center">
	      	 <tr>
		        <th>附件类型</th>
		        <th>附件</th>
		        <th></th>
		     </tr>							
		     <tbody id="items">
					<tr id="item0">
						<td><input type="text" class="input" name="fileList[0].fileType"></td>
						<td><input type="file" class="input" name="file"></td>
						<td><img src="images/minus.png" style="cursor:pointer;" onclick="minusTR(0)"/></td>
					</tr>
				</tbody>
	      </table>
	      <div style="text-align:center;">
				<img src="images/plus.png" style="cursor:pointer;" onclick="plusTR()"/>
			</div>
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
	    elem: '#endDate',
	    event: 'focus' 
	});
	
	var num = 0;
	function plusTR(){
		num ++;
		var tr = "<tr id='item"+num+"'><td><input type='text' class='input' name='fileList[" + num + "].fileType'></td><td><input type='file' class='input' name='file' ></td><td><img src='images/minus.png' style='cursor:pointer;' onclick='minusTR("+ num +")'/></td></tr>";
		$("#items").append(tr);
	}
	
	function minusTR(numb){
		$("#item"+ numb).remove(); 
	}
	
	function userSub(){
		var projectid = $("select[name ='project.id']").val();
		var endDate = $("input[name='endDate']").val();
		
		if(projectid == '') {
			alert("请选择项目！");
			return ;
		}
		
		if(endDate == '') {
			alert("请选择截止时间！");
			return ;
		}
		
		if(confirm("确认提交？")) {
			$("#form-article-add").submit();
		}
	}
	function goList(){
		window.location.href="project/business/list";
	}
	</script>
</html>