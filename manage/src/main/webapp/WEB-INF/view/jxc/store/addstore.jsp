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
    <title>创建库存</title>  
    <link rel="stylesheet" href="css/pintuer.css">
    <link rel="stylesheet" href="css/admin.css">
    <script src="js/jquery.js"></script>
    <script src="js/pintuer.js"></script>
    <script src="laydate/laydate.js"></script>  
</head>
<body>
<div class="panel admin-panel">
  <div class="panel-head"><strong><span class="icon-pencil-square-o"></span>&nbsp;&nbsp;创建库存</strong></div>
  <div class="body-content">
    <form action="jxc/store/addstore" method="post" class="form-x" id="form-article-add" enctype="multipart/form-data">
      <div class="form-group">
        <div class="label">
          <label>产品：</label>
        </div>
        <div class="field">
          <select name="productType.id" onchange="typeChange()" id="typeid" class='input'>
          	<option value="">请选择</option>
          	<c:forEach items="${typeList }" var="type">
          		<option value="${type.id }">${type.typeName }</option>
          	</c:forEach>
          </select>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>数量：</label>
        </div>
        <div class="field">
          <input type="text" class="input" id="amount" name="amount" value=""/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>存放地点：</label>
        </div>
        <div class="field">
          <input type="text" class="input" id="storeAddr" name="storeAddr" value=""/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>品牌：</label>
        </div>
        <div class="field">
          <input type="text" class="input" id="brand" name="brand" value=""/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>经销商：</label>
        </div>
        <div class="field">
          <select name="productDealer.id"  class='input'>
          	<option value="">请选择</option>
          	<c:forEach items="${dealerList }" var="dealer">
          		<option value="${dealer.id }">${dealer.dealerName }</option>
          	</c:forEach>
          </select>
        </div>
      </div>
      
      
      <div class="form-group">
        <div class="label">
          <label>价格：</label>
        </div>
        <div class="field">
          <input type="text" class="input" id="prize" name="prize" value=""/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>备注：</label>
        </div>
        <div class="field">
          <input type="text" class="input" id="content" name="content" value=""/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>图片：</label>
        </div>
        <div class="field">
          <input type="file" class="input" value="" name="file">
        </div>
      </div>
      
	  <div class="form-group">
        <div class="label">
          <label>产品规格型号：</label>
        </div>
        <div class="field">
          <table class="table table-hover text-center">
	      	 <tr>
		        <th>属性名称</th>
		        <th>属性值</th>
		        <th>自定义</th>
		     </tr>
		     <tbody id="item">
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
		function typeChange(){
			var typeid = $("#typeid").val();
			
			if(typeid == '') {
				$("#item").empty();
			} else {
				$("#item").empty();
				$.post("jxc/store/property/"+typeid,function(data){
					$.each(data, function(index,item){
				        var str = "<tr>";
				        str += "<td><input type='hidden' name='itemList["+index+"].propertyName' value='"+item.pname+"'/>"+item.pname+"</td>";
				        str += "<td>";
				        str += "<select nt='sel' id='"+index+"' class='input' onchange='changevalue("+index+")'>";
				        str += "<option value=''>请选择</option>";
					        $.each(item.voList, function(index1,itemv){
					        	str += "<option value='"+itemv.pname+"'>"+itemv.pname+"</option>";
					        });
				        str += "</select>";
				        str += "</td>";
				        if(item.type == 0) {
				        	str += "<td>";
				        	str += "<input id='value"+index+"' type='text' class='input' value='' onblur='fz("+index+")'/><input id='value"+index+"' type='hidden' name='itemList["+index+"].propertyValue' value=''/>";
				        	str += "</td>";
				        } else {
				        	str += "<td><input id='value"+index+"' type='hidden' name='itemList["+index+"].propertyValue' value=''/></td>";
				        }
				        str += "</tr>";
						
				        $("#item").append(str);
				    });
				});
			}
		}
		
		function changevalue(id) {
			$("input[name='itemList["+id+"].propertyValue']").val($("#"+id).val());
		}
		
		function fz(id) {
			if($("#value"+id).val() == '') {
				$("input[name='itemList["+id+"].propertyValue']").val($("#"+id).val());
			} else {
				$("input[name='itemList["+id+"].propertyValue']").val($("#value"+id).val());
			}
			
		}
		
		function userSub(){
			var amount = $("input[name='amount']").val();
			var storeAddr = $("input[name='storeAddr']").val();
			var brand = $("input[name='brand']").val();
			var prize = $("input[name='prize']").val();
			var dealerid = $("select[name='productDealer.id']").val();
			var typeid = $("select[name='productType.id']").val();
			
			if(typeid == '') {
				alert("请选择产品！");
				return;
			}
			
			if(amount == '') {
				alert("数量不可以为空！");
				return;
			}
			
			if(isNaN(amount)) {
				alert("输入数量错误！");
				return;
			}
			
			if(storeAddr == '') {
				alert("存放地点不可以为空！");
				return;
			}
			
			if(brand == '') {
				alert("品牌不可以为空！");
				return;
			}
			
			if(dealerid == '') {
				alert("请选择经销商！");
				return;
			}
			
			if(prize == '') {
				alert("价格不可以为空！");
				return;
			}
			
			if(isNaN(prize)) {
				alert("输入价格错误！");
				return;
			}
			
			$("input[id^='value']").each(function(){
				if($(this).val() != '') {
					var id = $(this).attr("id").replace('value','');
					$("input[name='itemList["+id+"].propertyValue']").val($(this).val());
				}
			});
			
			var j = 0;
			$("input[name$='.propertyValue']").each(function(){
				if($(this).val()== '') {
					j++;
				}
			});
			
			if(j > 0) {
				alert('属性值不可以为空！');
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