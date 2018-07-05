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
    <title>编辑支票领用登记单</title>  
    <link rel="stylesheet" href="css/pintuer.css">
    <link rel="stylesheet" href="css/admin.css">
    <script src="js/jquery.js"></script>
    <script src="js/pintuer.js"></script>
    <script src="laydate/laydate.js"></script>  
</head>
<body>
<div class="panel admin-panel">
  <div class="panel-head"><strong><span class="icon-pencil-square-o"></span>&nbsp;&nbsp;编辑支票领用登记单</strong></div>
  <div class="body-content">
    <form action="funds/cheque/edit" method="post" class="form-x" id="form-article-add" >
    <input type="hidden" value="${cheque.id}" name="id"/>
      <div class="form-group">
        <div class="label">
          <label>申请时间：</label>
        </div>
        <div class="field">
          <input type="text" class="input" id="applyDate" name="applyDate" value="<fmt:formatDate value="${cheque.applyDate }" pattern="yyyy-MM-dd"/>"/>
        </div>
      </div>
		
		<div class="form-group">
        <div class="label">
          <label>标题：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="title" value="${cheque.title }"/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>备注：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="remark" maxlength="200" value="${cheque.remark }"/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>领用明细：</label>
        </div>
        <div class="field">
          <table class="table table-hover text-center">
	      	 <tr>
		        <th>支出单位</th>
		        <th>支出项目</th>
		        <th>财务编号</th>
		        <th>分类明细</th>
		        <th>支票限额</th>
		        <th>用途</th>
		        <th>备注</th>
		        <th></th>
		     </tr>
		     <tbody id="items">
		     	<c:forEach items="${cheque.detailList}" var="item" varStatus="status">
					<tr id="item${status.index}">
						<td><input type="text" class="input" name="detailList[${status.index}].payUnit" value="${item.payUnit }"></td>
						<td>
							<select class="input" name="detailList[${status.index}].project.id">
								<option value="">请选择项目</option>
								<c:forEach items="${projectList }" var="project">
									<option value="${project.id }" <c:if test="${project.id == item.project.id }">selected</c:if>>${project.projectName }</option>
								</c:forEach>
							</select>
						</td>
						<td><input type="text" class="input" name="detailList[${status.index}].number" value="${item.number }"></td>
						<td><input type="text" class="input" name="detailList[${status.index}].detail" value="${item.detail }"></td>
						<td><input type="text" class="input" name="detailList[${status.index}].amount" value="${item.amount }"></td>
						<td><input type="text" class="input" name="detailList[${status.index}].useInfo" value="${item.useInfo }"></td>
						<td><input type="text" class="input" name="detailList[${status.index}].remark" value="${item.remark }"></td>
						<td><img src="images/minus.png" style="cursor:pointer;" onclick="minusTR(${status.index})"/></td>
					</tr>
				</c:forEach>
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
	    elem: '#applyDate',
	    event: 'focus' 
	});
	
	var num = '${fn:length(cheque.detailList)}';
	function plusTR(){
		$.post("project/json",function(result){
			num ++;
			
			var sel = "<td><select class='input' name='detailList["+num+"].project.id'><option value=''>请选择项目</option>";
			
			$.each(result,function(index,data){
				sel += "<option value='"+data.pid+"'>"+data.pname+"</option>";
			});
			
			sel += "</select></td>"
			
			var tr = "<tr id='item"+num+"'><td><input type='text' class='input' name='detailList[" + num + "].payUnit'></td>"+sel+"<td><input type='text' class='input' name='detailList[" + num + "].number' ></td><td><input type='text' class='input' name='detailList[" + num + "].detail' ></td><td><input type='text' class='input' name='detailList[" + num + "].amount' ></td><td><input type='text' class='input' name='detailList[" + num + "].useInfo' ></td><td><input type='text' class='input' name='detailList[" + num + "].remark' ></td><td><img src='images/minus.png' style='cursor:pointer;' onclick='minusTR("+ num +")'/></td></tr>";
			$("#items").append(tr);
		});
	}
	
	function minusTR(numb){
		$("#item"+ numb).remove(); 
	}
	
	function userSub(){
		var title = $("input[name ='title']").val();
		
		if(title == '') {
			alert("标题不可以为空！");
			return ;
		}
		
		var i = 0;
		
		$("select[name$='.project.id']").each(function(){
		    if($(this).val() == '') {
		    	i++;
		    	return ;
		    }
		});
		
		if(i > 0) {
			alert("请选择项目!");
			return ;
		}
		
		i = 0;
		
		$("input[name$='.amount']").each(function(){
		    if(isNaN($(this).val())) {
		    	i++;
		    	return ;
		    }
		});
		
		if(i > 0) {
			alert("金额输入错误!");
			return ;
		}
		if(confirm("确认提交？")) {
			$("#form-article-add").submit();
		}
	}
	function goList(){
		window.location.href="funds/cheque/list";
	}
	</script>
</html>