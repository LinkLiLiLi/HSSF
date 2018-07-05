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
    <title>创建报销单</title>  
    <link rel="stylesheet" href="css/pintuer.css">
    <link rel="stylesheet" href="css/admin.css">
    <script src="js/jquery.js"></script>
    <script src="js/pintuer.js"></script>
    <script src="laydate/laydate.js"></script>  
</head>
<body>
<div class="panel admin-panel">
  <div class="panel-head"><strong><span class="icon-pencil-square-o"></span>&nbsp;&nbsp;创建报销单</strong></div>
  <div class="body-content">
    <form action="funds/reimbursement/add" method="post" class="form-x" id="form-article-add" >
      <div class="form-group">
        <div class="label">
          <label>申请时间：</label>
        </div>
        <div class="field">
          <input type="text" class="input" id="reDate" name="reDate" value=""/>
        </div>
      </div>
		
		<div class="form-group">
        <div class="label">
          <label>支出单位：</label>
        </div>
        <div class="field">
          <select name="payUnit" class="input w50" style="width: 300px;">
      		<option value="信息">信息</option>
      		<option value="装备中心">装备中心</option>
      		<option value="派得">派得</option>
      		<option value="农芯">农芯</option>
      	  </select>
        </div>
      </div>
		<div class="form-group">
        <div class="label">
          <label>支出项目：</label>
        </div>
        <div class="field">
          <select name="project.id" class="input w50" style="width: 300px;">
          	<option value="">全部</option>
          	<c:forEach items="${projectList }" var="project">
          		<option value="${project.id }">${project.projectName }</option>
          	</c:forEach>
          </select>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>财务编号：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="number" maxlength="10"/>
        </div>
      </div>

      <div class="form-group">
        <div class="label">
          <label>分类科目：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="detail" maxlength="30"/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>票据张数：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="sum" maxlength="2"/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>理由：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="reason" maxlength="200"/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>申请人：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="applyUser" maxlength="20"/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>附件明细：</label>
        </div>
        <div class="field">
          <table class="table table-hover text-center">
	      	 <tr>
		        <th>明细</th>
		        <th>金额</th>
		     </tr>
		     <tbody id="items">
					<tr id="item0">
						<td><input type="text" class="input" name="detailList[0].detail"></td>
						<td><input type="text" class="input" name="detailList[0].amount"></td>
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
	    elem: '#reDate',
	    event: 'focus' 
	});
	
	var num = 0;
	function plusTR(){
		num ++;
		var tr = "<tr id='item"+num+"'><td><input type='text' class='input' name='detailList[" + num + "].detail'></td><td><input type='text' class='input' name='detailList[" + num + "].amount' ></td><td><img src='images/minus.png' style='cursor:pointer;' onclick='minusTR("+ num +")'/></td></tr>";
		$("#items").append(tr);
	}
	
	function minusTR(numb){
		$("#item"+ numb).remove(); 
	}
	
	function userSub(){
		var sum = $("input[name ='sum']").val();
		
		if(sum != '') {
			if(isNaN(sum)) {
				alert("票据张数输入错误！");
				return ;
			}
		}
		
		var i = 0;
		
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
		window.location.href="product/list";
	}
	</script>
</html>