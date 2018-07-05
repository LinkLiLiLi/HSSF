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
    <title>添加资产</title>  
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
  <div class="panel-head"><strong><span class="icon-pencil-square-o"></span>&nbsp;&nbsp;添加资产</strong></div>
  <div class="body-content">
    <form action="assets/add" method="post" class="form-x" id="form-article-add" >
      <div class="form-group">
        <div class="label">
          <label>资产名称：</label>
        </div>
        <div class="field">
          <input type="text" class="input" id="assetsName" name="assetsName" value=""/>
        </div>
      </div>
		
		<div class="form-group">
        <div class="label">
          <label>资产编号：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="assetsNumber" value=""/>
        </div>
      </div>

		<div class="form-group">
        <div class="label">
          <label>价值：</label>
        </div>
        <div class="field">
          <input type="text" class="input" id="prize" name="prize" value=""/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>购置时间：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="buyDate" id="buyDate" value=""/>
        </div>
      </div>
      
	<div class="form-group">
        <div class="label">
          <label>类别：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="type" value=""/>
        </div>
      </div>
      
	<div class="form-group">
        <div class="label">
          <label>所在地：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="location" value=""/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>负责人：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="charge" value=""/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>状态：</label>
        </div>
        <div class="field cc">
          <label><input name="status" type="radio" checked="checked" class="ace" value="1"><span class="lbl">正常</span></label>&nbsp;&nbsp;
	      <label><input name="status" type="radio" class="ace" value="2"><span class="lbl">报废</span></label>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>是否固定资产：</label>
        </div>
        <div class="field cc">
          <label><input name="fixedAssets" type="radio" checked="checked" class="ace" value="0"><span class="lbl">是</span></label>&nbsp;&nbsp;
	    	 <label><input name="fixedAssets" type="radio" class="ace" value="1"><span class="lbl">否</span></label>
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
	    elem: '#buyDate',
	    event: 'focus' 
	});
	function userSub(){
		var assetsName = $("input[name ='assetsName']").val();
		var assetsNumber = $("input[name ='assetsNumber']").val();
		var prize = $("input[name ='prize']").val();
		var buyDate = $("input[name ='buyDate']").val();
		var type = $("input[name ='type']").val();
		var location = $("input[name ='location']").val();
		var charge = $("input[name ='charge']").val();
		
		if(assetsName == '') {
			alert("请输入资产名称！");
			return;
		}
		
		if(assetsNumber == '') {
			alert("请输入资产编号！");
			return;
		}
		
		if(prize == '') {
			alert("请输入价值！");
			return;
		}
		
		if(isNaN(prize)) {
			alert("价值输入错误！");
			return;
		}
		
		if(type == '') {
			alert("请输入类别！");
			return;
		}
		
		if(buyDate == '') {
			alert("请选择购置时间！");
			return;
		}
		
		if(location == '') {
			alert("请输入所在地！");
			return;
		}
		
		if(charge == '') {
			alert("请输入负责人！");
			return;
		}
		
		if(confirm("确认提交？")) {
			$("#form-article-add").submit();
		}
	}
	function goList(){
		window.location.href="assets/list";
	}
	</script>
</html>