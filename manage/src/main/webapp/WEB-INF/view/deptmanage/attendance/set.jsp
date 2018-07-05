<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<base href="<%=request.getContextPath() %>/" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
	<meta name="renderer" content="webkit">
	<title>考勤组</title>
	<link rel="stylesheet" href="css/pintuer.css">
	<link rel="stylesheet" href="css/admin.css">
	<script src="js/jquery.js"></script>
	<script src="js/pintuer.js"></script>
	<script src="laydate/laydate.js"></script>  
</head>
<body>
<div class="panel admin-panel">
  <div class="panel-head"><strong><span class="icon-pencil-square-o"></span>&nbsp;&nbsp;考勤组设置</strong></div>
  <div class="body-content">
    <form method="post" class="form-x" action="attendance/set" id="roleForm">      
      <div class="form-group">
        <div class="label">
          <label>上班时间：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="startTime" id="startTime" value="<fmt:formatDate value="${setinfo.startTime }" pattern="HH:mm:ss"/>"/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>上午下班时间：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="lunchStartTime" id="lunchStartTime" value="<fmt:formatDate value="${setinfo.lunchStartTime }" pattern="HH:mm:ss"/>"/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>下午上班时间：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="lunchEndTime" id="lunchEndTime" value="<fmt:formatDate value="${setinfo.lunchEndTime }" pattern="HH:mm:ss"/>"/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>下班时间：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="endTime" id="endTime" value="<fmt:formatDate value="${setinfo.endTime }" pattern="HH:mm:ss"/>"/>
          <input type="hidden" value="" name="ids"/>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>考勤组：</label>
        </div>
        <div class="field">
          <table class="table table-hover text-center">
	      	 <tr>
		        <th style="width: 35%">无需考勤</th>
		        <th style="width: 30%"></th>
		        <th style="width: 35%">考勤人员</th>
		     </tr>
		     <tbody>
					<tr>
						<td>
							<select name="first" size="15" id="first" multiple="multiple" class="input">    
						        <c:forEach items="${notList }" var="user">
						        	<option value="${user.id }">${user.name }</option>
						        </c:forEach>
						    </select>
						</td>
						<td>
							<button style="width: 100px;" class="button bg-main" type="button" onclick="moveRight()"> --&gt;&nbsp;</button><br /> <br /> 
							<button style="width: 100px;" class="button bg-main" type="button" onclick="moveAll()"> --&gt;&gt;</button><br /> <br /> 
							<button style="width: 100px;" class="button bg-main" type="button" onclick="moveLeft()"> &nbsp;&lt;--</button><br /> <br /> 
							<button style="width: 100px;" class="button bg-main" type="button" onclick="moveAllLeft()"> &lt;&lt;--</button>
						</td>
						<td>
							<select id="secend" multiple="multiple"  class="input"  size="15">    
						        <c:forEach items="${groupList }" var="group">
						        	<option value="${group.user.id }">${group.user.name }</option>
						        </c:forEach>   
						    </select>
						</td>
					</tr>
				</tbody>
	      </table>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label></label>
        </div>
        <div class="field">
          <button class="button bg-main icon-check-square-o" type="button" onclick="roleSubmit()"> 提交</button>
        </div>
      </div>
    </form>
  </div>
</div>
</body>
<script type="text/javascript">
	var msg = '${msg}';
	if(msg != '') {
		alert(msg);
	}
	laydate.render({
	    elem: '#startTime',
	    type: 'time',
	    event: 'focus' 
	});
	
	laydate.render({
	    elem: '#endTime',
	    type: 'time',
	    event: 'focus' 
	});
	
	laydate.render({
	    elem: '#lunchEndTime',
	    type: 'time',
	    event: 'focus' 
	});
	
	laydate.render({
	    elem: '#lunchStartTime',
	    type: 'time',
	    event: 'focus' 
	});
	function roleSubmit(){
		var startTime = $("#startTime").val();
		var endTime = $("#endTime").val();
		var lunchStartTime = $("#lunchStartTime").val();
		var lunchEndTime = $("#lunchEndTime").val();
		
		if(startTime == '') {
			alert("请选择上班时间");
			return ;
		}
		
		if(endTime == '') {
			alert("请选择下班班时间");
			return ;
		}
		
		if(lunchStartTime == '') {
			alert("请选择上午下班时间");
			return ;
		}
		
		if(lunchEndTime == '') {
			alert("请选择下午上班时间");
			return ;
		}
		
		var ids = "";
		
		$("select[id='secend'] option").each(function(){
			ids += $(this).val() + ",";
		});
		
		$("input[name='ids']").val(ids);
		
		if(confirm("确认提交？")) {
			$("#roleForm").submit();
		}
	}
	/**选中的元素向右移动**/
	  function moveRight() 
	  { 
	      //得到第一个select对象 
	    var selectElement = document.getElementById("first"); 
	    var optionElements = selectElement.getElementsByTagName("option"); 
	    var len = optionElements.length; 
	    
	  
	    if(!(selectElement.selectedIndex==-1))  //如果没有选择元素，那么selectedIndex就为-1 
	    { 
	        
	      //得到第二个select对象 
	      var selectElement2 = document.getElementById("secend"); 
	    
	        // 向右移动 
	        for(var i=0;i<len ;i++) 
	        { 
	          selectElement2.appendChild(optionElements[selectElement.selectedIndex]); 
	        } 
	    } else
	    { 
	      alert("您还没有选择需要移动的用户！"); 
	    } 
	  } 
	    
	  //移动所有的到右边 
	  function moveAll() 
	  { 
	    //得到第一个select对象 
	    var selectElement = document.getElementById("first"); 
	    var optionElements = selectElement.getElementsByTagName("option"); 
	    var len = optionElements.length; 
	    //alert(len); 
	    
	    //将第一个selected中的数组翻转 
	    var firstOption = new Array(); 
	    for(var k=len-1;k>=0;k--) 
	    { 
	      firstOption.push(optionElements[k]); 
	    
	    } 
	    var lens = firstOption.length; 
	      //得到第二个select对象 
	    var selectElement2 = document.getElementById("secend"); 
	    for(var j=lens-1;j>=0;j--) 
	    { 
	      selectElement2.appendChild(firstOption[j]); 
	    } 
	  } 
	    
	  //移动选中的元素到左边 
	  function moveLeft() 
	  { 
	    //首先得到第二个select对象 
	    var selectElement = document.getElementById("secend"); 
	    var optionElement = selectElement.getElementsByTagName("option"); 
	    var len = optionElement.length; 
	      
	    //再次得到第一个元素 
	    if(!(selectElement.selectedIndex==-1)) 
	    { 
	      var firstSelectElement = document.getElementById("first"); 
	      for(i=0;i<len;i++) 
	      { 
	        firstSelectElement.appendChild(optionElement[selectElement.selectedIndex]);//被选中的那个元素的索引 
	      } 
	    }else
	    { 
	      alert("您还没有选中要移动的用户!"); 
	    } 
	  } 
	    
	  //全部向左移 
	  function moveAllLeft() 
	  { 
	    var selectElement = document.getElementById("secend"); 
	    var optionElements = document.getElementsByTagName("option"); 
	    var len = optionElements.length; 
	    var optionEls = new Array(); 
	    for(var i=len-1;i>=0;i--) 
	    { 
	      optionEls.push(optionElements[i]); 
	    } 
	    var lens = optionEls.length; 
	      
	    var firstSelectElement = document.getElementById("first"); 
	    for(var j=lens-1;j>=0;j--) 
	    { 
	      firstSelectElement.appendChild(optionEls[j]); 
	    } 
	  } 
</script>
</html>