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
    <title>创建项目商务</title>  
    <link rel="stylesheet" href="css/pintuer.css">
    <link rel="stylesheet" href="css/admin.css">
    <script src="js/jquery.js"></script>
    <script src="js/pintuer.js"></script>
    <script src="laydate/laydate.js"></script>  
</head>
<body>
<div class="panel admin-panel">
  <div class="panel-head"><strong><span class="icon-pencil-square-o"></span>&nbsp;&nbsp;创建项目商务</strong></div>
  <div class="body-content">
    <form action="project/business/edit" method="post" class="form-x" id="form-article-add" enctype="multipart/form-data">
      <input name="id" value="${business.id }" type="hidden"/>
      <div class="form-group">
        <div class="label">
          <label>业务名称：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="bussName" value="${business.bussName }"/>
        </div>
      </div>
		
	  <div class="form-group">
        <div class="label">
          <label>甲方单位：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="unit" value="${business.unit }"/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>甲方联系人：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="contact" value="${business.contact }"/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>联系电话：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="phoneNumber" value="${business.phoneNumber }"/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>业务员：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="salesman" value="${business.salesman }"/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>接洽时间：</label>
        </div>
        <div class="field">
          <input type="text" class="input" id="contactDate" name="contactDate" value="<fmt:formatDate value="${business.contactDate }" pattern="yyyy-MM-dd"/>"/>
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
          <label>业务内容：</label>
        </div>
        <div class="field">
          <input type="text" class="input"  name="bussContent" value="${business.bussContent }"/>
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
	    elem: '#contactDate',
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
		var bussName = $("input[name ='bussName']").val();
		
		if(bussName == '') {
			alert("业务名称不可以为空！");
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