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
    <title>创建横向项目</title>  
    <link rel="stylesheet" href="css/pintuer.css">
    <link rel="stylesheet" href="css/admin.css">
    <script src="js/jquery.js"></script>
    <script src="js/pintuer.js"></script>
    <script src="laydate/laydate.js"></script>  
</head>
<body>
<div class="panel admin-panel">
  <div class="panel-head"><strong><span class="icon-pencil-square-o"></span>&nbsp;&nbsp;创建横向项目</strong></div>
  <div class="body-content">
    <form action="project/1/add" method="post" class="form-x" id="form-article-add" enctype="multipart/form-data">
      <div class="form-group">
        <div class="label">
          <label>财务编号：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="financialNumber" value=""/>
        </div>
      </div>
		
      <div class="form-group">
        <div class="label">
          <label>项目名称：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="projectName" value=""/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>项目负责人：</label>
        </div>
        <div class="field">
          <select name="user.id" class="input w50" style="width: 300px;">
          	<c:forEach items="${userList }" var="user">
          		<option value="${user.id }">${user.name }</option>
          	</c:forEach>
          </select>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>项目类别：</label>
        </div>
        <div class="field">
          <select name="projectType" class="input w50" style="width: 300px;">
          	<option value="1">技术开发</option>
          	<option value="2">技术服务</option>
          	<option value="3">技术咨询</option>
          	<option value="4">横向工程</option>
          	<option value="5">横向产品</option>
          </select>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>所在小组：</label>
        </div>
        <div class="field">
          <select name="userGroup.id" class="input w50" style="width: 300px;">
          	<c:forEach items="${groupList }" var="group">
          		<option value="${group.id }">${group.groupName }</option>
          	</c:forEach>
          </select>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>承担单位：</label>
        </div>
        <div class="field">
          <select name="unit" class="input w50" style="width: 300px;">
          	<option value="1">信息中心</option>
          	<option value="2">装备中心</option>
          	<option value="3">派得</option>
          	<option value="4">农芯</option>
          </select>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>委托单位：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="deputeUnit" value=""/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>档案编号：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="fileNumber" value=""/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>开始时间：</label>
        </div>
        <div class="field">
          <input type="text" class="input" id="beginTime" name="beginTime" value=""/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>结束时间：</label>
        </div>
        <div class="field">
          <input type="text" class="input" id="endTime" name="endTime" value=""/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>经费总额：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="totalMoney" value=""/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>入账情况：</label>
        </div>
        <div class="field">
          <table class="table table-hover text-center">
	      	 <tr>
		        <th>时间</th>
		        <th>金额</th>
		        <th>支付情况</th>
		        <th>发票开具</th>
		        <th>免税认证</th>
		        <th></th>
		     </tr>							
		     <tbody id="items">
					<tr id="item0">
						<td><input type="text" id="enterTime0" class="input" name="enterList[0].enterTime"></td>
						<td><input type="text" class="input" name="enterList[0].amount"></td>
						<td>
							<select name="enterList[0].payInfo" class="input w50" style="width: 100%;">
								<option value="0">已到账</option>
								<option value="1">未到账</option>
							</select>
						</td>
						<td><input type="checkbox" name="enterList[0].billInfo" value="1" ></td>
						<td>
							<select name="enterList[0].dfutyFree" class="input w50" style="width: 100%;">
								<option value="0">有</option>
								<option value="1">无</option>
							</select>
						</td>
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
	    elem: '#beginTime',
	    event: 'focus' 
	});
	
	laydate.render({
	    elem: '#endTime',
	    event: 'focus' 
	});
	
	laydate.render({
	    elem: '#enterTime0',
	    event: 'focus' 
	});
	
	var num = 0;
	function plusTR(){
		num ++;
		var tr = "<tr id='item"+num+"'>";
		tr += "<td><input type='text' id='enterTime"+num+"' class='input' name='enterList["+num+"].enterTime'></td>";
		tr += "<td><input type='text' class='input' name='enterList["+num+"].amount'></td>";
		tr += "<td>";
			tr += "	<select name='enterList["+num+"].payInfo' class='input w50' style='width: 100%;'>";
			tr += "	<option value='0'>已到账</option>";
			tr += "	<option value='1'>未到账</option>";
			tr += "</select>";
				tr += "</td>";
					tr += "<td><input type='checkbox' name='enterList["+num+"].billInfo' value='1'></td>";
					tr += "<td>";
						tr += "<select name='enterList["+num+"].dfutyFree' class='input w50' style='width: 100%;'>";
						tr += "	<option value='0'>有</option>";
						tr += "	<option value='1'>无</option>";
						tr += "</select>";
							tr += "</td>";
								tr += "<td><img src='images/minus.png' style='cursor:pointer;' onclick='minusTR("+num+")'/></td>";
								tr += "</tr>";
		
		$("#items").append(tr);
		
		laydate.render({
		    elem: '#enterTime' + num,
		    event: 'focus' 
		});
	}
	
	function minusTR(numb){
		$("#item"+ numb).remove(); 
	}
	
	function userSub(){
		var projectName = $("input[name ='projectName']").val();
		var totalMoney = $("input[name ='totalMoney']").val();
		if(projectName == '') {
			alert("项目名称不可以为空！");
			return ;
		}
		
		if(isNaN(totalMoney)) {
			alert("经费总额输入错误!");
			return false;
	    }
		
		var i = 0;
		$("input[name$='.amount']").each(function(){
		    if(isNaN($(this).val())) {
		    	i++;
		    }
		});
		
		if(i > 0) {
			alert("金额输入错误!");
			return false;
		}
		
		if(confirm("确认提交？")) {
			$("#form-article-add").submit();
		}
	}
	function goList(){
		window.location.href="apply/online/remuneration/list";
	}
	</script>
</html>