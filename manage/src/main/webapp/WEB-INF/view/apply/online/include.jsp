<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<style>
	.tabbable{
		width: 100%;
		padding-left: 20px;
		font-size: 5px;
	}
	
	.tabbable ul {
		margin-top: 10px;
		width: 100%;
		height: 25px;
	}
	
	.nav li {
		float: left;
		border-right: 1px solid #ccc;
		margin-bottom: 10px;
	}
	.nav li a:hover {
		color: #f60;
	}
	.nav li a {
		padding: 2px 10px;
		color: #737373;
		display: block;
	}
	
	.tabbable:after{
        content:".";
        clear:both;
        display:block;
        height:0;
        overflow:hidden;
        visibility:hidden;
	}
	.nav li:last-child {
		border-right: 0px solid #eee;
	}
	/* .tabbable{
		width: 100%;
		padding-left: 20px;
		font-size: 5px;
	}
	.tabbable ul {
		margin-top: 10px;
		width: 100%;
		height: 25px;
	}
	.nav li {
		float: left;
		border: 1px solid #0ae;
		border-radius: 5px;
		margin-right: 10px;
		margin-bottom: 10px;
	}
	.nav li a:hover {
		background-color: #0ae;
		color: #fff;
	}
	.nav li a {
		padding: 5px 10px;
		color: #0ae;
		display: block;
	}
	.tabbable:after{
        content:".";
        clear:both;
        display:block;
        height:0;
        overflow:hidden;
        visibility:hidden;
	} */
</style>
<div class="tabbable">
	<ul class="nav" id="myTab">
	  <shiro:hasPermission name="apply_usecar">
	  <li id="usecar" class="">
		<a data-toggle="tab" href="javascript:void()" onclick="golink('usecar')">公务用车</a>
	  </li>
	  </shiro:hasPermission>
	  <shiro:hasPermission name="apply_register">
      <li id="register" class="">
		<a data-toggle="tab"  href="javascript:void();" onclick="golink('register')">研究生登记</a>
      </li>
      </shiro:hasPermission>
	  <shiro:hasPermission name="apply_turnup">
      <li id="turnup" class="">
		<a data-toggle="tab"  href="javascript:void();" onclick="golink('turnup')">转编登记</a>
      </li>
      </shiro:hasPermission>
	  <shiro:hasPermission name="apply_needhands">
      <li id="needhands" class="">
		<a data-toggle="tab"  href="javascript:void();" onclick="golink('needhands')">用人登记</a>
      </li>
      </shiro:hasPermission>
	  <shiro:hasPermission name="apply_salary">
      <li id="salary" class="">
		<a data-toggle="tab"  href="javascript:void();" onclick="golink('salary')">调薪申请</a>
      </li>
      </shiro:hasPermission>
	  <shiro:hasPermission name="apply_backtoschool">
      <li id="backToSchool" class="">
		<a data-toggle="tab"  href="javascript:void();" onclick="golink('backToSchool')">返校申请</a>
      </li>
      </shiro:hasPermission>
	  <shiro:hasPermission name="apply_changedept">
      <li id="changeDept" class="">
		<a data-toggle="tab"  href="javascript:void();" onclick="golink('changeDept')">人事变动</a>
      </li>
      </shiro:hasPermission>
	  <shiro:hasPermission name="apply_overtime">
      <li id="overtime" class="">
		<a data-toggle="tab"  href="javascript:void();" onclick="golink('overtime')">加班申请</a>
      </li>
      </shiro:hasPermission>
	  <shiro:hasPermission name="apply_leave0">
      <li id="yg" class="">
		<a data-toggle="tab"  href="javascript:void();" onclick="golink('leave/0')">员工请假申请</a>
      </li>
      </shiro:hasPermission>
	  <shiro:hasPermission name="apply_leave1">
      <li id="xs" class="">
		<a data-toggle="tab"  href="javascript:void();" onclick="golink('leave/1')">学生请假申请</a>
      </li>
      </shiro:hasPermission>
	  <shiro:hasPermission name="apply_storage">
      <li id="enter" class="">
		<a data-toggle="tab" href="javascript:void();" onclick="golink('storage')">办公室出入库</a>
	  </li>
	  </shiro:hasPermission>
	  <shiro:hasPermission name="apply_trval">
	  <li id="trval" class="">
		<a data-toggle="tab" href="javascript:void();" onclick="golink('trval')">差旅报销</a>
	  </li>
	  </shiro:hasPermission>
	  <shiro:hasPermission name="apply_transfer">
	  <li id="transfer" class="">
		<a data-toggle="tab" href="javascript:void();" onclick="golink('transfer')">转账单</a>
	  </li>
	  </shiro:hasPermission>
	  <shiro:hasPermission name="apply_remuneration">
	  <li id="remuneration" class="">
		<a data-toggle="tab" href="javascript:void();" onclick="golink('remuneration')">劳务计算单</a>
	  </li>
	  </shiro:hasPermission>
	  <shiro:hasPermission name="apply_reimbursement">
	  <li id="reimbursement" class="">
		<a data-toggle="tab" href="javascript:void();" onclick="golink('reimbursement')">报销单</a>
	  </li>
	  </shiro:hasPermission>
	  <shiro:hasPermission name="apply_expertfee">
	  <li id="expertfee" class="">
		<a data-toggle="tab" href="javascript:void();" onclick="golink('expertfee')">专家费报销单</a>
	  </li>
	  </shiro:hasPermission>
	  <shiro:hasPermission name="apply_cheque">
	  <li id="cheque" class="">
		<a data-toggle="tab" href="javascript:void();" onclick="golink('cheque')">支票登记单</a>
	  </li>
	  </shiro:hasPermission>
	</ul>
</div>
<script type="text/javascript">
	$(function(){
		var type = "${param.clazz}";
	    $("#"+type).addClass("active");
	});
	function golink(url){
		window.location.href= "apply/online/"+ url +"/list";
	}
	
</script>