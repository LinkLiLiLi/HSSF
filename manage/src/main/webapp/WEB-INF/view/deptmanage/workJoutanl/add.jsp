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
    <title>填写日志</title>  
    <link rel="stylesheet" href="css/pintuer.css">
    <link rel="stylesheet" href="css/admin.css">
    <script src="js/jquery.js"></script>
    <script src="js/pintuer.js"></script>
    <script src="laydate/laydate.js"></script>  
   <script type="text/javascript">
    $(function(){
     var date=new Date();
     var year=date.getFullYear(); //获取当前年份
     var mon=date.getMonth()+1; //获取当前月份
     var da=date.getDate(); //获取当前日
     if (mon >= 1 && mon <= 9) {
         mon = "0" + mon;
     }
     if (da >= 0 && da <= 9) {
         da = "0" + da;
     }
     var nowtime=year+"-"+mon+"-"+da;
    $("#joutanlDate").val(nowtime);
    $.post("workjoutanl/checkdate",{"joutanlDate" : nowtime},function(result){
		if(result) {
			$("input[name ='id']").val(result.id);
			$("textarea[name='content']").val(result.workContent);
		}
    })
     }) 
     </script>
    <style type="text/css">
    	.cc{line-height: 34px;}
    </style>
</head>
<body>
<div class="panel admin-panel">
  <div class="panel-head"><strong><span class="icon-pencil-square-o"></span>&nbsp;&nbsp;填写日志</strong></div>
  <div class="body-content">
    <form action="workjoutanl/add" method="post" class="form-x" id="form-article-add" >
    	<input name="id" name="id" type="hidden" value=""/>
		<div class="form-group">
        <div class="label">
          <label>日志时间：</label>
        </div>
        <div class="field cc">
          <input type="text" class="input" id="joutanlDate" name="joutanlDate" />
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>日志内容：</label>
        </div>
        <div class="field" style="height:200px;">
          <textarea name="content" class="textarea" maxlength="800"></textarea>
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
	    elem: '#joutanlDate',
        event:focus,
        	
	    min: -7,
	    max: 0,
	    done:function (value) {
	    	var joutanlDate = value;
	    	
			$("input[name ='id']").val("");
			$("textarea[name='content']").val("");
			
			
			if(joutanlDate != "") {
				$.post("workjoutanl/checkdate",{"joutanlDate" : joutanlDate},function(result){
					if(result) {
						$("input[name ='id']").val(result.id);
						$("textarea[name='content']").val(result.workContent);
					}
				});
			}
    	}
	});

	/* $(document).ready(function(){
		$.post("workjoutanl/checkdate",{"joutanlDate":joutanlDate},function(result){
			if(result){
				$("input[name='id']").val(result.id);
				$("textarea[name='content']").val(result.workContent);
			}
		})
	})  */
	function goList(){
		window.location.href="workJoutanl/list";
	}
   function userSub(){
		var joutanlDate = $("input[name ='joutanlDate']").val();
		var content = $("textarea[name ='content']").val();
		
		if(joutanlDate == '') {
			alert("请选择日志时间！");
			return;
		}
		
		if(content == '') {
			alert("请输入日志内容！");
			return;
		}
		
		if(confirm("确认提交？")) {
			$("#form-article-add").submit();
		}
	}
	</script>
</html>