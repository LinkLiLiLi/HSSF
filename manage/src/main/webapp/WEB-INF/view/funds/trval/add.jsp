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
    <title>创建差旅报销单</title>  
    <link rel="stylesheet" href="css/pintuer.css">
    <link rel="stylesheet" href="css/admin.css">
    <script src="js/jquery.js"></script>
    <script src="js/pintuer.js"></script>
    <script src="laydate/laydate.js"></script>  
</head>
<body>
<div class="panel admin-panel">
  <div class="panel-head"><strong><span class="icon-pencil-square-o"></span>&nbsp;&nbsp;创建差旅报销单</strong></div>
  <div class="body-content">
    <form action="funds/trval/add" method="post" class="form-x" id="form-article-add" >
      <div class="form-group">
        <div class="label">
          <label>申请时间：</label>
        </div>
        <div class="field">
          <input type="text" class="input" id="travelDate" name="travelDate" value=""/>
        </div>
      </div>
		
		<div class="form-group">
        <div class="label">
          <label>出差人：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="name" value=""/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>出差事由：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="reason" value=""/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>公务卡：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="card" value=""/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>支票：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="cheque" value=""/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>现金：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="money" value=""/>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>备注：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="remark" value="" maxlength="200"/>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>明细：</label>
        </div>
        <div class="field">
          <table class="table table-hover text-center">
		        <tr>
		          <th colspan="3">出发</th>
		          <th colspan="3">到达</th>
		          <th></th>
		          <th colspan="2">交通费</th>
		          <th colspan="2">住宿费</th>
		          <th colspan="2">交通补助</th>
		          <th colspan="2">伙食补助</th>
		          <th colspan="2">其他</th>
		        </tr>
		        <tr>
		          <th colspan="2">出发日期</th>
		          <th>地点</th>
		          <th colspan="2">到达日期</th>
		          <th>地点</th>
		          <th>城市间<br/>交通工具</th>
		          <th>单据<br/>张数</th>
		          <th>金额</th>
		          <th>单据<br/>张数</th>
		          <th>金额</th>
		          <th>天数</th>
		          <th>金额</th>
		          <th>天数</th>
		          <th>金额</th>
		          <th>单据<br/>张数</th>
		          <th>金额</th>
		          <th></th>
		        </tr>
		     <tbody id="items">
					<tr id="item0">
						<td colspan="2"><input type="text" class="input" id="outDate0" name="detailList[0].outDate"></td>
						<td><input type="text" class="input" name="detailList[0].outAddr"></td>
						<td colspan="2"><input type="text" class="input" id="arriveDate0" name="detailList[0].arriveDate"></td>
						<td><input type="text" class="input" name="detailList[0].arriveAddr"></td>
						<td><input type="text" class="input" name="detailList[0].vehicle"></td>
						
						<td><input type="text" class="input" name="detailList[0].trafficSum"></td>
						<td><input type="text" class="input" name="detailList[0].trafficAmount"></td>
						
						<td><input type="text" class="input" name="detailList[0].liveSum"></td>
						<td><input type="text" class="input" name="detailList[0].liveAmount"></td>
						
						<td><input type="text" class="input" name="detailList[0].trafficSubsidyDays"></td>
						<td><input type="text" class="input" name="detailList[0].trafficSubsidyAmount"></td>
						
						<td><input type="text" class="input" name="detailList[0].foodSubsidyDays"></td>
						<td><input type="text" class="input" name="detailList[0].foodSubsidyAmount"></td>
						
						<td><input type="text" class="input" name="detailList[0].otherSum"></td>
						<td><input type="text" class="input" name="detailList[0].otherAmount"></td>
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
	    elem: '#outDate0',
	    event: 'focus' 
	});
	
	laydate.render({
	    elem: '#arriveDate0',
	    event: 'focus' 
	});
	laydate.render({
	    elem: '#travelDate',
	    event: 'focus' 
	});
	
	var num = 0;
	function plusTR(){
		num ++;
		var tr = "<tr id='item"+num+"'>";
		tr += "<td colspan='2'><input type='text' class='input' id='outDate"+num+"' name='detailList["+num+"].outDate'></td>";
		tr += "<td><input type='text' class='input' name='detailList["+num+"].outAddr'></td>";
		tr += "<td colspan='2'><input type='text' class='input' id='arriveDate"+num+"' name='detailList["+num+"].arriveDate'></td>";
		tr += "<td><input type='text' class='input' name='detailList["+num+"].arriveAddr'></td>";
		tr += "<td><input type='text' class='input' name='detailList["+num+"].vehicle'></td>";
		
		tr += "<td><input type='text' class='input' name='detailList["+num+"].trafficSum'></td>";
		tr += "<td><input type='text' class='input' name='detailList["+num+"].trafficAmount'></td>";
		
		tr += "<td><input type='text' class='input' name='detailList["+num+"].liveSum'></td>";
		tr += "<td><input type='text' class='input' name='detailList["+num+"].liveAmount'></td>";
		
		tr += "<td><input type='text' class='input' name='detailList["+num+"].trafficSubsidyDays'></td>";
		tr += "<td><input type='text' class='input' name='detailList["+num+"].trafficSubsidyAmount'></td>";
		
		tr += "<td><input type='text' class='input' name='detailList["+num+"].foodSubsidyDays'></td>";
		tr += "<td><input type='text' class='input' name='detailList["+num+"].foodSubsidyAmount'></td>";
		
		tr += "<td><input type='text' class='input' name='detailList["+num+"].otherSum'></td>";
		tr += "<td><input type='text' class='input' name='detailList["+num+"].otherAmount'></td>";
		tr += "<td><img src='images/minus.png' style='cursor:pointer;' onclick='minusTR("+num+")'/></td>";
		tr += "</tr>";
		$("#items").append(tr);
		
		laydate.render({
		    elem: '#outDate' + num,
		    event: 'focus' 
		});
		
		laydate.render({
		    elem: '#arriveDate' + num,
		    event: 'focus' 
		});
	}
	
	function minusTR(numb){
		$("#item"+ numb).remove(); 
	}
	
	function userSub(){
		var name = $("input[name ='name']").val();
		var card = $("input[name ='card']").val();
		var cheque = $("input[name ='cheque']").val();
		var money = $("input[name ='money']").val();
		if(name == '') {
			alert("出差人不可以为空！");
			return ;
		}
		
		if(card != ''){
			if(isNaN(card)) {
				alert("公务卡输入错误!");
				return ;
			}
		}
		
		if(cheque != ''){
			if(isNaN(cheque)) {
				alert("支票输入错误!");
				return ;
			}
		}
		
		if(money != ''){
			if(isNaN(money)) {
				alert("现金输入错误!");
				return ;
			}
		}
		
		var names = ['trafficSum','trafficAmount','liveSum','liveAmount','trafficSubsidyDays','trafficSubsidyAmount','foodSubsidyDays','foodSubsidyAmount','otherSum','otherAmount'];
		var errs = ['交通费单据张数','交通费金额','住宿费单据张数','住宿费金额','交通补助天数','交通补助金额','伙食补助天数','伙食补助金额','其他单据张数','其他金额'];
		
		var j = 0;
		$.each(names,function(index,value){
			
			var i = 0;
			$("input[name$='."+value+"']").each(function(){
			    if(isNaN($(this).val())) {
			    	i++;
				    j++;
			    }
			});
			
			if(i > 0) {
				alert(errs[index] + "输入错误!");
				i = 0;
				return false;
			}
		});
		
		if(j == 0) {
			if(confirm("确认提交？")) {
				$("#form-article-add").submit();
			}
		}
		
	}
	function goList(){
		window.location.href="funds/trval/list";
	}
	</script>
</html>