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
    <title>办公室出入库登记</title>  
    <link rel="stylesheet" href="css/pintuer.css">
    <link rel="stylesheet" href="css/admin.css">
    <script src="js/jquery.js"></script>
    <script src="js/pintuer.js"></script>
    <script src="laydate/laydate.js"></script>  
</head>
<body>
<div class="panel admin-panel">
  <div class="panel-head"><strong><span class="icon-pencil-square-o"></span>&nbsp;&nbsp;办公室出入库登记</strong></div>
  <div class="body-content">
    <form action="apply/online/storage/add" method="post" class="form-x" id="form-article-add" enctype="multipart/form-data">
      <div class="form-group">
        <div class="label">
          <label>标题：</label>
        </div>
        <div class="field">
          <input type="text" class="input" id="titleName" name="titleName" value=""/>
        </div>
      </div>
		
		<div class="form-group">
        <div class="label">
          <label>出入库日期：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="changeTime" id="changeTime" value=""/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>送货部门：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="dept" id="dept" value=""/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>库单编号：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="kdNumber" value=""/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>库单：</label>
        </div>
        <div class="field">
          <table class="table table-hover text-center">
	      	 <tr>
		        <th>编号</th>
				<th>名称</th>
				<th>规格</th>
				<th>供货单位</th>
				<th>数量</th>
				<th>单价</th>
				<th>金额</th>
				<th>备注</th>
				<th>操作</th>
		     </tr>
		     <tbody id="items">
					<tr id="item0">
						<td><input type="text" class="input" name="itemList[0].goodsNumber"></td>
						<td><input type="text" class="input" name="itemList[0].goodsName"></td>
						<td><input type="text" class="input" name="itemList[0].specification"></td>
						<td><input type="text" class="input" name="itemList[0].unit"></td>
						<td><input type="text" class="input" name="itemList[0].amount"></td>
						<td><input type="text" class="input" name="itemList[0].signPrice"></td>
						<td><input type="text" class="input" name="itemList[0].price"></td>
						<td><input type="text" class="input" name="itemList[0].remark"></td>
						<td><img src="images/minus.png" style="cursor:pointer;" onclick="minusTR(0)"/></td>
					</tr>
				</tbody>
	      </table>
	      <div style="text-align: center;">
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
	var num = 0;
	
 	laydate.render({
	    elem: '#changeTime',
	    event: 'focus' 
	});
	function userSub(){
		if(confirm("确认提交吗？")){
			$("#form-article-add").submit();
		}
	}
	
	function plusTR(){
		num ++;
		var tr = "<tr id='item"+num+"'><td><input type='text' class='input' name='itemList[" + num + "].goodsNumber'></td><td><input type='text' class='input' name='itemList[" + num + "].goodsName'></td><td><input type='text' class='input' name='itemList[" + num + "].specification'></td><td><input type='text' class='input' name='itemList[" + num + "].unit'></td><td><input type='text' class='input' name='itemList[" + num + "].amount'></td><td><input type='text' class='input' name='itemList[" + num + "].signPrice'></td><td><input type='text' class='input' name='itemList[" + num + "].price'></td><td><input type='text' class='input' name='itemList[" + num + "].remark'></td><td><img src='images/minus.png' style='cursor:pointer;' onclick='minusTR("+ num +")'/></td></tr>";
		$("#items").append(tr);
	}
	
	function minusTR(numb){
		$("#item"+ numb).remove(); 
	}
	function back (){
		window.location.href="apply/online/storage/enter/list";
	}
	</script>
</html>