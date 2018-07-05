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
    <title>创建采购单</title>  
    <link rel="stylesheet" href="css/pintuer.css">
    <link rel="stylesheet" href="css/admin.css">
    <script src="js/jquery.js"></script>
    <script src="js/pintuer.js"></script>
    <script src="laydate/laydate.js"></script>  
</head>
<body>
<div class="panel admin-panel">
  <div class="panel-head"><strong><span class="icon-pencil-square-o"></span>&nbsp;&nbsp;创建采购单</strong></div>
  <div class="body-content">
    <form action="jxc/purchase/addapply" method="post" class="form-x" id="form-article-add" enctype="multipart/form-data">
      <div class="form-group">
        <div class="label">
          <label>产品名称：</label>
        </div>
        <div class="field">
          <input type="text" class="input" id="productName" name="productName" value=""/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>用途：</label>
        </div>
        <div class="field">
          <input type="text" class="input" id="purpose" name="purpose" value=""/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>开始时间：</label>
        </div>
        <div class="field">
          <input type="text" class="input" id="applyTime" name="applyTime" value=""/>
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
          <label>采购清单：</label>
        </div>
        <div class="field">
          <table class="table table-hover text-center">
	      	 <tr>
		        <th>产品名称</th>
		        <th>规格/型号</th>
		        <th>生产厂家</th>
		        <th style="width: 100px;">数量</th>
		        <th>备注</th>
		        <th>图片附件</th>
		        <th></th>
		     </tr>
		     <tbody id="items">
				<tr id="item0">
					<td>
						<select name="detailList[0].productType.id" class="input" id="type0" onchange="changemodel('type0')">
							<option value="">请选择产品</option>
							<c:forEach items="${typeList }" var="type">
								<option value="${type.id}">${type.typeName }</option>
							</c:forEach>
						</select>
					</td>
					<td> 
						<select name="detailList[0].productStore.id" class="input" id="type0model">
							<option value="">请选择型号</option>
						</select>
					</td>
					<td>
						<input type="text" class="input" name="detailList[0].manufacturer">
					</td>
					<td>
						<input type="text" class="input" name="detailList[0].amount">
					</td>
					<td>
						<input type="text" class="input" name="detailList[0].remark">
					</td>
					<td>
						<input type="file" class="input" name="file">
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
		    elem: '#applyTime',
		    event: 'focus' 
		});
		laydate.render({
		    elem: '#endTime',
		    event: 'focus' 
		});
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
	
	
		var num = 0;
		function plusTR(){
			num ++;
			var tr = "<tr id='item"+num+"'>";
			tr += "<td>";
			tr += "<select name='detailList["+num+"].productType.id' class='input' id='type"+num+"' onchange='changemodel(\"type"+num+"\")'>";
			tr += "<option value=''>请选择产品</option>";
			tr += "</select></td>";
			tr += "<td>";
			tr += "<select name='detailList["+num+"].productStore.id' class='input' id='type"+num+"model'>";
			tr += "<option value=''>请选择型号</option>";
			tr += "</select></td>";
			tr += "<td>";
			tr += "<input type='text' class='input' name='detailList["+num+"].manufacturer'>";
			tr += "</td>";
			tr += "<td>";
			tr += "<input type='text' class='input' name='detailList["+num+"].amount'>";
			tr += "</td>";
			tr += "<td>";
			tr += "<input type='text' class='input' name='detailList["+num+"].remark'>";
			tr += "</td>";
			tr += "<td>";
			tr += "<input type='file' class='input' name='file'>";
			tr += "</td>";
			tr += "<td><img src='images/minus.png' style='cursor:pointer;' onclick='minusTR("+num+")'/></td>";
			tr += "</tr>";
			$("#items").append(tr);
			
			$.post("jxc/purchase/type",function(result){
				$.each(result, function(index,data){
					$("#type"+num).append("<option value='"+data.pid+"'>"+data.pname+"</option>");
				});
			});
		}
	
		function minusTR(numb){
			$("#item"+ numb).remove();
		}
	
		function userSub(){
			var productName = $("input[name ='productName']").val();
			var purpose = $("input[name ='purpose']").val();
			
			if(productName == '') {
				alert("产品名称不可以为空！");
				return ;
			}
			if(purpose == '') {
				alert("用途不可以为空！");
				return ;
			}
			
			var i=0;
			$("select[name$='.productType.id']").each(function(){
			    if($(this).val() == '') {
			    	i++;
			    }
			});
			
			if(i > 0) {
				alert("请选择产品名称！");
				return ;
			}
			i = 0;
			$("select[name$='.productStore.id']").each(function(){
			    if($(this).val() == '') {
			    	i++;
			    }
			});
			
			if(i > 0) {
				alert("请选择产品对应型号！");
				return ;
			}
			
			i = 0;
			var j=0;
			
			$("input[name$='.amount']").each(function(){
			    if($(this).val() == '') {
			    	i++;
			    }
			    if(isNaN($(this).val())){
			    	j++;
			    }
			});
			
			if(i > 0) {
				alert("请输入产品采购数量！");
				return ;
			}
			
			if(j > 0) {
				alert("采购数量输入错误！");
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