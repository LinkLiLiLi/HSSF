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
    <title>学生请假登记</title>  
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
  <div class="panel-head"><strong><span class="icon-pencil-square-o"></span>&nbsp;&nbsp;学生请假登记</strong></div>
  <div class="body-content">
    <form action="apply/online/leave/edit" method="post" class="form-x" id="form-article-add" >
      <input name="applyType" value="1" type="hidden"/>
      <input name="id" value="${leave.id }" type="hidden"/>
      <div class="form-group">
        <div class="label">
          <label>申请时间：</label>
        </div>
        <div class="field">
          <input type="text" class="input" id="applyTime" name="applyTime" value="${leave.applyTime }"/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>请假类别：</label>
        </div>
        <div class="field cc">
        	<label><input name="leaveType" type="radio" <c:if test="${leave.leaveType == 1 }"> checked="checked"</c:if> class="ace" value="1"><span class="lbl">公差</span></label>&nbsp;&nbsp;
			<label><input name="leaveType" type="radio" <c:if test="${leave.leaveType == 2 }"> checked="checked"</c:if> class="ace" value="2"><span class="lbl">病假</span></label>&nbsp;&nbsp;
			<label><input name="leaveType" type="radio" <c:if test="${leave.leaveType == 3 }"> checked="checked"</c:if> class="ace" value="3"><span class="lbl">事假</span></label>&nbsp;&nbsp;
           	<label><input name="leaveType" type="radio" <c:if test="${leave.leaveType == 4 }"> checked="checked"</c:if> class="ace" value="4"><span class="lbl">其他</span></label>
		</div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>事由：</label>
        </div>
        <div class="field">
        	<input type="text" class="input" name="reason"  value="${leave.reason }"/>
		</div>
      </div>

      
      <div class="form-group">
        <div class="label">
          <label>联系电话：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="phoneNumber" value="${leave.phoneNumber }" />
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>紧急联系人：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="contactUser" value="${leave.contactUser }" />
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>紧急联系电话：</label>
        </div>
        <div class="field">
          <input type="text" class="input" id="contactMobile" name="contactMobile" value="${leave.contactMobile }"/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>开始时间：</label>
        </div>
        <div class="field">
          <input type="text" class="input" id="beginTime" name="beginTime" value="<fmt:formatDate value="${leave.beginTime }" pattern="yyyy-MM-dd HH:mm:ss"/>"/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>结束时间：</label>
        </div>
        <div class="field">
          <input type="text" class="input" id="endTime" name="endTime" value="<fmt:formatDate value="${leave.endTime }" pattern="yyyy-MM-dd HH:mm:ss"/>"/>
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
	    elem: '#beginTime',
	    type: 'datetime',
	    event: 'focus' 
	});
	laydate.render({
	    elem: '#endTime',
	    type: 'datetime',
	    event: 'focus' 
	});
	
	function userSub(){
		if(confirm("确认提交吗？")){
			$("#form-article-add").submit();
		}
	}
	
	function back (){
		window.location.href="apply/online/leave/1/list";
	}
	</script>
</html>