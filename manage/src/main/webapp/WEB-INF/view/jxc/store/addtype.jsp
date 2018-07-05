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
    <title>创建产品</title>  
    <link rel="stylesheet" href="css/pintuer.css">
    <link rel="stylesheet" href="css/admin.css">
    <script src="js/jquery.js"></script>
    <script src="js/pintuer.js"></script>
    <script src="laydate/laydate.js"></script>  
</head>
<body>
<div class="panel admin-panel">
  <div class="panel-head"><strong><span class="icon-pencil-square-o"></span>&nbsp;&nbsp;创建产品</strong></div>
  <div class="body-content">
    <form action="jxc/store/addtype" method="post" class="form-x" id="form-article-add" enctype="multipart/form-data">
      <div class="form-group">
        <div class="label">
          <label>产品名称：</label>
        </div>
        <div class="field">
          <input type="text" class="input" id="typeName" name="typeName" value=""/>
        </div>
      </div>
      
	  <div class="form-group">
        <div class="label">
          <label>产品属性：</label>
        </div>
        <div class="field">
          <table class="table table-hover text-center">
	      	 <tr>
		        <th>属性名称</th>
		        <th>自定义</th>
		        <th>属性值</th>
		        <th width="80px;"></th>
		     </tr>
		     <tbody id="items">
				<tr id="item0">
					<td><input type="text" class="input" name="propertyList[0].propertyName"></td>
					<td id="item0_0"><input type="text" class="input" name="propertyList[0].valueList[0].vals"/></td>
					<td><input type="checkbox" name="propertyList[0].type" value="0"/></td>
					<td><img src="images/plus_1.png" style="cursor:pointer;" onclick="plusInput(0,0)"/><img src="images/minus.png" style="cursor:pointer; margin-left: 10px;" onclick="minusTR(0)"/></td>
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
	var inputcount = 0;
	function plusInput(trid,rdid) {
		inputcount ++;
		$("#item" + trid + "_" + rdid).append("<br><input type='text' class='input' name='propertyList["+trid+"].valueList["+inputcount+"].vals'/>");
	}
	
	var num = 0;
	function plusTR(){
		num ++;
		var tr = "<tr id='item"+num+"'>";
		tr += "<td><input type='text' class='input' name='propertyList["+num+"].propertyName'></td>";
		tr += "<td id='item"+num+"_0'><input type='text' class='input' name='propertyList["+num+"].valueList[0].vals'></td>";
		tr += "<td><input type='checkbox' name='propertyList["+num+"].type' value='0'/></td>";
		tr += "<td><img src='images/plus_1.png' style='cursor:pointer;' onclick='plusInput("+num+",0)'/><img src='images/minus.png' style='cursor:pointer;' onclick='minusTR("+num+")'/></td>";
		tr += "</tr>";
		$("#items").append(tr);
	}
	
	function minusTR(numb){
		$("#item"+ numb).remove(); 
	}
	
	
	function userSub(){
		var typeName = $("input[name ='typeName']").val();
		
		if(typeName == '') {
			alert("产品名称不可以为空！");
			return ;
		}
		
		var i=0;
		$("input[name$='.propertyName']").each(function(){
		    if($(this).val() == '') {
		    	i++;
		    }
		});
		
		if(i > 0) {
			alert("属性名称不可以为空！");
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