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
    <title>生产</title>  
    <link rel="stylesheet" href="css/pintuer.css">
    <link rel="stylesheet" href="css/admin.css">
    <script src="js/jquery.js"></script>
    <script src="js/pintuer.js"></script>
    <script src="laydate/laydate.js"></script>  
</head>
<body>
<div class="panel admin-panel">
  <div class="panel-head"><strong><span class="icon-pencil-square-o"></span>&nbsp;&nbsp;生产</strong></div>
  <div class="body-content">
    <form action="jxc/production/add" method="post" class="form-x" id="form-article-add" enctype="multipart/form-data">
      <div class="form-group">
        <div class="label">
          <label>产品名称：</label>
        </div>
        <div class="field">
          <select name="productType.id" class="input" id="type" onchange="changemodel('type')">
			<option value="">请选择产品</option>
			<c:forEach items="${typeList }" var="type">
				<option value="${type.id}">${type.typeName }</option>
			</c:forEach>
		  </select>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>型号：</label>
        </div>
        <div class="field">
          <select name="productStore.id" class="input" id="typemodel">
			<option value="">请选择型号</option>
		  </select>
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
          <label>数量：</label>
        </div>
        <div class="field">
          <input type="text" class="input" id="amount" name="amount" value="1" onblur="changeamount()"/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>备注：</label>
        </div>
        <div class="field">
          <input type="text" class="input" id="remark" name="remark" value=""/>
        </div>
      </div>
      
	  <div class="form-group">
        <div class="label">
          <label>出库清单：</label>
        </div>
        <div class="field">
          <table class="table table-hover text-center">
	      	 <tr>
		        <th>产品名称</th>
		        <th>规格/型号</th>
		        <th style="width: 100px;">数量</th>
		        <th></th>
		     </tr>
		     <tbody id="items">
				
			</tbody>
	      </table>
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
			var amount = $("#amount").val();
			
			if(amount == '') {
				$("#amount").val(1);
				amount = 1;
			}
			
			$("#items").empty();
			
			if(typeid != '') {
				$.post("jxc/purchase/model/"+typeid,function(result){
					$.each(result, function(index,data){
						$("#"+id+"model").append("<option value='"+data.pid+"'>"+data.pname+"</option>");
					});
				});
				
				$.post("jxc/production/data/"+typeid,function(result){
					$.each(result, function(index,data){
						var useAmount = data.useAmount * amount;
						var tr = "<tr><td><input type='hidden' name='itemList["+index+"].productType.id' class='input' value='"+data.productId+"' />"+ data.productName +"</td><td>";
						tr += "<select name='itemList["+index+"].productStore.id' class='input' id='storeuseamount"+index+"' onchange='changestore(\"storeuseamount"+index+"\")'><option value=''>请选择型号</option>";
						$.each(data.valueList, function(i,item){
							tr += "<option value='"+item.pid+"'>"+item.pname+"</option>";
						})
						tr += "</select></td><td>";
						tr += "<input type='text' name='itemList["+index+"].amount' class='input' value='"+useAmount+"' id='useamount"+index+"' onblur='changeuseamount(\"useamount"+index+"\")'/><input type='hidden' id='storeamount"+index+"' class='input' value='0'/><input type='hidden' id='amount"+index+"' class='input' value='"+useAmount+"'/>";	
						tr += "</td></tr>";
						$("#items").append(tr);
					});
				});
			}
		}
		
		function changestore(id){
			var storeid = $("#"+id).val();
			if(storeid != '') {
				$.post("jxc/out/model/amount/"+storeid,function(result){
					$("#"+id.replace("use","")).val(result);
				});
			}
		}
		
		function changeamount(){
			var amount = $("#amount").val();
			
			if(amount == '') {
				alert("请输入数量");
				$("#amount").val(1);
				$("#amount").focus();
				return;
			}
			
			if(isNaN(amount)){
				alert("数量输入错误");
				$("#amount").val(1);
				$("#amount").focus();
				return;
			}
			
			$("input[id^=amount]").each(function(){
				$("#use" + $(this).attr("id")).val($(this).val() * amount);
			});
		}
		
		function changeuseamount(id){
			var pamount = $("#amount").val();
			var useamount = $("#"+id.replace("use","")).val();
			var amount = $("#"+id).val();
			
			if(amount == '') {
				alert("请输入数量");
				$("#"+id).val(pamount*useamount);
				$("#"+id).focus();
				return;
			}
			
			if(isNaN(amount)){
				alert("数量输入错误");
				$("#"+id).val(pamount*useamount);
				$("#"+id).focus();
				return;
			}
		}
		
		function userSub(){
			var productName = $("select[name ='productType.id'").val();
			var storeName = $("select[name ='productStore.id'").val();
			var purpose = $("input[name ='purpose']").val();
			var amount = $("#amount").val();
			
			if(productName == '') {
				alert("请选择产品！");
				return ;
			}
			
			if(storeName == '') {
				alert("请选择产品型号！");
				return ;
			}
			
			if(purpose == '') {
				alert("用途不可以为空！");
				return ;
			}
			
			var i=0;
			$("select[name$='.productStore.id']").each(function(){
			    if($(this).val() == '') {
			    	i++;
			    }
			});
			
			if(i > 0) {
				alert("请选择产品清单规格型号！");
				return ;
			}
			
			i = 0;
			$("input[name$='.amount']").each(function(){
				var out = $(this).val();
				var store = $("#" + $(this).attr("id").replace("use","store")).val();
				if(parseInt(store) < parseInt(out) && i == 0) {
					var model = $("#store"+$(this).attr("id")).find("option:selected").text();
					i++
					alert(model+" 库存数量不足！");
				}
			});
			
			if(i > 0) {
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