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
    <title>出库申请</title>  
    <link rel="stylesheet" href="css/pintuer.css">
    <link rel="stylesheet" href="css/admin.css">
    <script src="js/jquery.js"></script>
    <script src="js/pintuer.js"></script>
    <script src="laydate/laydate.js"></script>  
</head>
<body>
<div class="panel admin-panel">
  <div class="panel-head"><strong><span class="icon-pencil-square-o"></span>&nbsp;&nbsp;编辑出库申请</strong></div>
  <div class="body-content">
    <form action="jxc/out/edit" method="post" class="form-x" id="form-article-add" >
      <input type="hidden" name="id" value="${apply.id }"/>
      <div class="form-group">
        <div class="label">
          <label>产品名称：</label>
        </div>
        <div class="field">
          <select name="productType.id" class="input" onchange="changemodel('type0')" id="type0">
				<option value="">请选择产品</option>
				<c:forEach items="${typeList }" var="type">
					<option value="${type.id}" <c:if test="${apply.productType.id == type.id}">selected</c:if>>${type.typeName }</option>
				</c:forEach>
			</select>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>规格/型号：</label>
        </div>
        <div class="field">
          <select name="productStore.id" class="input" id="type0model">
			 <option value="">请选择型号</option>
			 <c:forEach items="${valueList }" var="value">
					<option value="${value.pid}" <c:if test="${apply.productStore.id == value.pid}">selected</c:if>>${value.pname }</option>
				</c:forEach>
		  </select>
        </div>
      </div>
      
	  <div class="form-group">
        <div class="label">
          <label>数量：</label>
        </div>
        <div class="field">
          <input type="text" class="input" id="amount" name="amount" value="${apply.amount }"/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>出库用途：</label>
        </div>
        <div class="field">
          <input type="text" class="input" id="purpose" name="purpose" value="${apply.purpose }"/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>关联项目：</label>
        </div>
        <div class="field">
          <select name="project.id" class="input">
				<option value="">请选择项目</option>
				<c:forEach items="${projectList }" var="project">
					<option value="${project.id}" <c:if test="${apply.project.id == project.id}">selected</c:if>>${project.projectName }</option>
				</c:forEach>
			</select>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>备注：</label>
        </div>
        <div class="field">
          <input type="text" class="input" id="remark" name="remark" value="${apply.remark }"/>
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
	
	function changemodel(id) {
		var typeid = $("#"+id).val();
		$("#"+id+"model").empty();
		$("#"+id+"model").append("<option value=''>请选择型号</option>");
		if(typeid != '') {
			$.post("jxc/purchase/model/"+typeid,function(result){
				$.each(result, function(index,data){
					$("#"+id+"model").append("<option value='"+data.pid+"'>"+data.pname+"</option>");
				});
			});
		}
	}
	
	function userSub(){
		var typeid = $("select[name='productType.id']").val();
		var storeid = $("select[name='productStore.id']").val();
		var projectid = $("select[name='project.id']").val();
		var amount = $("input[name ='amount']").val();
		var purpose = $("input[name ='purpose']").val();
		var remark = $("input[name ='remark']").val();
		
		
		
		
		if(typeid == '') {
			alert("请选择产品！");
			return ;
		}
		
		if(storeid == '') {
			alert("请选择产品型号！");
			return ;
		}
		
		if(amount == '') {
			alert("请输入数量！");
			return ;
		}
		
		if(isNaN(amount)){
			alert("数量输入错误！");
			return ;
		}
		
		$.post("jxc/out/model/amount/" + storeid,function(result){
			if(amount > result) {
				alert("出库数量不可大于剩余库存数量,库存现有数量：" + result);
			} else {
				if(purpose == '') {
					alert("请输入出库用途！");
					return ;
				}
				
				if(projectid == '' && remark == ''){
					alert("备注不可以为空！");
					return ;
				}
				
				if(confirm("确认提交？")) {
					$("#form-article-add").submit();
				}
			}
		});
	}
	</script>
</html>