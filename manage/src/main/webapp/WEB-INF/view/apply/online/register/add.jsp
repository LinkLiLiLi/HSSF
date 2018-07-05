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
    <title>研究生登记</title>  
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
  <div class="panel-head"><strong><span class="icon-pencil-square-o"></span>&nbsp;&nbsp;研究生登记</strong></div>
  <div class="body-content">
    <form action="apply/online/register/add" method="post" class="form-x" id="form-article-add" >
      <div class="form-group">
        <div class="label">
          <label>姓名：</label>
        </div>
        <div class="field">
          <input type="text" class="input" id="userName" name="userName" value=""/>
        </div>
      </div>
		
		<div class="form-group">
        <div class="label">
          <label>性别：</label>
        </div>
        <div class="field cc">
          <label><input name="gender" type="radio" checked="checked" class="ace" value="0"><span class="lbl">男</span></label>&nbsp;&nbsp;
          <label><input name="gender" type="radio" class="ace" value="1"><span class="lbl">女</span></label>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>民族：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="nation" />
        </div>
      </div>

      <div class="form-group">
        <div class="label">
          <label>籍贯：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="place"/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>学历：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="education" />
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>是否在读：</label>
        </div>
        <div class="field cc">
          <label><input name="readingStudent" type="radio" checked="checked" class="ace" value="0"><span class="lbl">是</span></label>&nbsp;&nbsp;
          <label><input name="readingStudent" type="radio" class="ace" value="1"><span class="lbl">否</span></label>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>出生日期：</label>
        </div>
        <div class="field">
          <input type="text" class="input" id="birth" name="birth"/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>E-mail：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="email" />
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>联系电话：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="phone" />
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>专业：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="major" />
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>入学时间：</label>
        </div>
        <div class="field">
          <input type="text" class="input" id="entranceTime" name="entranceTime"  />
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>就读学校：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="school" />
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>毕业时间：</label>
        </div>
        <div class="field">
          <input type="text" class="input" id="graduationTime" name="graduationTime" />
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>第一导师：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="firstMentor" />
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>到中心时间：</label>
        </div>
        <div class="field">
          <input type="text" class="input" id="centerTime" name="centerTime" />
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>第二导师：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="secondMentor" />
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>中心责任导师：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="centerMentor" />
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>所在课题组：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="projectGroup" />
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>预计离开时间：</label>
        </div>
        <div class="field">
          <input type="text" class="input" id="departureTime" name="departureTime" />
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>课题组负责人：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="projectGroupPerson" />
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>兴趣爱好：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="hobby" />
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>身份证号码：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="idCard" />
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>办公电话：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="mobile" />
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>紧急联系人：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="contacts" />
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>紧急联系电话：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="contactsPhone" />
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>与本人关系：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="relationship" />
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>是否担任干部：</label>
        </div>
        <div class="field cc">
          <label><input name="cadres" type="radio" checked="checked" class="ace" value="0"><span class="lbl">是</span></label>&nbsp;&nbsp;
            	<label><input name="cadres" type="radio" class="ace" value="1"><span class="lbl">否</span></label>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>任过何种职务：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="post" />
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>培养方式：</label>
        </div>
        <div class="field">
          <select name="mode" class="input">
			<option value="1">联合培养</option>
			<option value="2">客座培养</option>
			<option value="3">短期实习</option>
		  </select>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>自我介绍：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="selfInfo" />
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
	    elem: '#birth',
	    event: 'focus' 
	});
	laydate.render({
	    elem: '#entranceTime',
	    event: 'focus' 
	});
	laydate.render({
	    elem: '#centerTime',
	    event: 'focus' 
	});
	laydate.render({
	    elem: '#graduationTime',
	    event: 'focus' 
	});
	laydate.render({
	    elem: '#departureTime',
	    event: 'focus' 
	});
	
	function userSub(){
		if(confirm("确认提交吗？")){
			$("#form-article-add").submit();
		}
	}
	
	function back (){
		window.location.href="apply/online/register/list";
	}
	</script>
</html>