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
    <title>审核采购单</title>  
    <link rel="stylesheet" href="css/pintuer.css">
    <link rel="stylesheet" href="css/admin.css">
    <script src="js/jquery.js"></script>
    <script src="js/pintuer.js"></script>
    <script src="laydate/laydate.js"></script> 
    <style type="text/css">
    	.cc{line-height: 34px;}
    </style> 
</head>
<body>
<div class="panel admin-panel">
  <div class="panel-head"><strong><span class="icon-pencil-square-o"></span>&nbsp;&nbsp;审核采购单</strong></div>
  <div class="body-content">
    <form action="jxc/purchase/audit" method="post" class="form-x" id="form-article-add" enctype="multipart/form-data">
    	<input name="purchaseApply.id" value="${apply.id }" type="hidden"/>
      <div class="form-group">
        <div class="label">
          <label>产品名称：</label>
        </div>
        <div class="field cc">
          ${apply.productName }
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>用途：</label>
        </div>
        <div class="field cc">
          ${apply.purpose }
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
		     </tr>
		     <tbody id="items">
				<tr id="item0">
					<c:forEach items="${apply.detailList }" var="detail" varStatus="status">
		     		<tr id="item${status.index}">
						<td>
							${detail.productType.typeName }
						</td>
						<td> 
							${detail.model }
						</td>
						<td>
							${detail.manufacturer }
						</td>
						<td>
							${detail.amount }
						</td>
						<td>
							${detail.remark }
						</td>
						<td>
							<c:if test="${detail.image != null }">
								<img src="upload/${detail.image}" style="width: 50px;height: 50px;">
							</c:if>
						</td>
					</tr>
		     	</c:forEach>
			</tbody>
	      </table>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>审核：</label>
        </div>
        <div class="field cc">
           <select name="status" class="input" style="width: 200px;">
				<option value="1">审核通过</option>           	
				<option value="2">拒绝审核</option>
           </select>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>审核描述：</label>
        </div>
        <div class="field">
           <input type="text" class="input" id="auditMsg" name="auditMsg" value=""/>
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
		function userSub(){
			var auditMsg = $("input[name ='auditMsg']").val();
			
			if(auditMsg == '') {
				alert("审核描述不可以为空！");
				return ;
			}
			
			if(confirm("确认审核？")) {
				$("#form-article-add").submit();
			}
		}
		function goList(){
			window.location.href="product/list";
		}
	</script>
</html>