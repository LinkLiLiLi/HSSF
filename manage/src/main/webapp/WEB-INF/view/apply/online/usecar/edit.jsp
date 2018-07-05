<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<base href="<%=request.getContextPath() %>/">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title>用车申请</title>  
    <link rel="stylesheet" href="css/pintuer.css">
    <link rel="stylesheet" href="css/admin.css">
    <script src="js/jquery.js"></script>
    <script src="js/pintuer.js"></script>
    <script src="laydate/laydate.js"></script>  
</head>
<body>
<div class="panel admin-panel">
  <div class="panel-head"><strong><span class="icon-pencil-square-o"></span>&nbsp;&nbsp;用车申请</strong></div>
  <div class="body-content">
    <form action="apply/online/usecar/edit" method="post" class="form-x" id="form-article-add" >
      <input type="hidden" name="id" value="${usecar.id }"/>
      <div class="form-group">
        <div class="label">
          <label>申请部门：</label>
        </div>
        <div class="field">
          <input type="text" class="input" id="applyDept" name="applyDept" value="${usecar.applyDept }"/>
        </div>
      </div>
		
		<div class="form-group">
        <div class="label">
          <label>申请日期：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="applyTime" id="applyTime" value="${usecar.applyTime }"/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>使用时间：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="useTime" id="useTime" value="${usecar.useTime }"/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>特殊使用申请：</label>
        </div>
        <div class="field">
            <label class="middle" style="margin-left: 15px;"><input value="1" <c:if test="${fn:contains(usecar.specialInfo,1)}"> checked="checked" </c:if> class="ace" type="checkbox" name="special"><span class="lbl">车辆在外过夜</span></label>
	     	<label class="middle" style="margin-left: 15px;"><input value="2" <c:if test="${fn:contains(usecar.specialInfo,2)}"> checked="checked" </c:if> class="ace" type="checkbox" name="special"><span class="lbl">特殊时期</span></label>
	     	<label class="middle" style="margin-left: 15px;"><input value="3" <c:if test="${fn:contains(usecar.specialInfo,3)}"> checked="checked" </c:if> class="ace" type="checkbox" name="special"><span class="lbl">恶劣天气</span></label>
	     	<label class="middle" style="margin-left: 15px;"><input value="4" <c:if test="${fn:contains(usecar.specialInfo,4)}"> checked="checked" </c:if> class="ace" type="checkbox" name="special"><span class="lbl">节假日期间</span></label>
	     	<label class="middle" style="margin-left: 15px;"><input value="5" <c:if test="${fn:contains(usecar.specialInfo,5)}"> checked="checked" </c:if> class="ace" type="checkbox" name="special"><span class="lbl">出京</span></label>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>事由（人数）：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="reason" value="${usecar.reason }"/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>目的地：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="destination" value="${usecar.destination }"/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>车牌号码：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="carNumber" value="${usecar.carNumber }"/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>异常情况记录：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="exceptionRecord" value="${usecar.exceptionRecord }"/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>驶出时间：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="beginTime" id="beginTime" value="${usecar.beginTime }"/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>交回时间：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="endTime" id="endTime" value="${usecar.endTime }"/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>停车费：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="stopCarPrice" value="${usecar.stopCarPrice }"/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>出车驾驶员：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="driver" value="${usecar.driver }"/>
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
	    elem: '#beginTime',
	    event: 'focus' 
	});
	laydate.render({
	    elem: '#endTime',
	    event: 'focus' 
	});
	laydate.render({
	    elem: '#applyTime',
	    event: 'focus' 
	});
	laydate.render({
	    elem: '#useTime',
	    event: 'focus' 
	});
	
	function userSub(){
		if(confirm("确认提交？")) {
			$("#form-article-add").submit();
		}
	}
	</script>
</html>