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
    <title>合同制职工转企业编制(派得、农芯)申请表</title>  
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
  <div class="panel-head"><strong><span class="icon-pencil-square-o"></span>&nbsp;&nbsp;转编申请</strong></div>
  <div class="body-content">
    <form action="apply/online/turnup/add" method="post" class="form-x" id="form-article-add" enctype="multipart/form-data">
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
          <label>出生日期：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="birth" id="birth" value=""/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>民族：</label>
        </div>
        <div class="field">
            <input type="text" class="input" name="nation" value=""/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>婚否：</label>
        </div>
        <div class="field cc">
          <label><input name="marriage" type="radio" checked="checked" class="ace" value="0"><span class="lbl">已婚</span></label>&nbsp;&nbsp;
            	<label><input name="marriage" type="radio" class="ace" value="1"><span class="lbl">未婚</span></label>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>政治面貌：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="outlook" value=""/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>籍贯：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="place" value=""/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>家庭地址：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="homeAddress" value=""/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>部门：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="dept" id="dept" value=""/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>手机号码：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="phoneNumber" id="phoneNumber" value=""/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>身份证号：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="idCard" value=""/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>毕业院校：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="school" value=""/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>专业：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="major" value=""/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>毕业时间：</label>
        </div>
        <div class="field">
          <input type="text" class="input" id="graduationTime" name="graduationTime" value=""/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>学历：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="education" value=""/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>学位：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="degree" value=""/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>参加工作时间：</label>
        </div>
        <div class="field">
          <input type="text" class="input" id="joinWorkTime" name="joinWorkTime" value=""/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>来中心时间：</label>
        </div>
        <div class="field">
          <input type="text" class="input" id="centerTime" name="centerTime" value=""/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>连续工龄：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="workingYears" value=""/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>现工作岗位：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="post" value=""/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>宅电：</label>
        </div>
        <div class="field">
          <input type="text" class="input" name="mobile" value=""/>
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>上传照片：</label>
        </div>
        <div class="field">
          <input type="file" class="input" name="file">
        </div>
      </div>
      
      <div class="form-group">
        <div class="label">
          <label>工作经历：</label>
        </div>
        <div class="field">
          <table class="table table-hover text-center">
	      	 <tr>
		        <th>开始时间</th>
				<th>结束时间</th>
				<th>工作单位</th>
				<th>是否上保险</th>
		     </tr>
		     <tbody id="items">
					<tr>
						<td><input type="text" class="input" value=""  id="beginTime0" name="workExperienceList[0].beginTime" ></td>
						<td><input type="text" class="input" value=""  id="endTime0" name="workExperienceList[0].endTime" ></td>
						<td><input type="text" class="input" value=""  name="workExperienceList[0].unit" ></td>
						<td>
							<label><input name="workExperienceList[0].insurance" type="radio" checked="checked" class="ace" value="0"><span class="lbl">是</span></label>&nbsp;&nbsp;
            				<label><input name="workExperienceList[0].insurance" type="radio" class="ace" value="1"><span class="lbl">否</span></label>
						</td>
					</tr>
					<tr>
						<td><input type="text" class="input" value=""  id="beginTime1" name="workExperienceList[1].beginTime" ></td>
						<td><input type="text" class="input" value=""  id="endTime1" name="workExperienceList[1].endTime" ></td>
						<td><input type="text" class="input" value=""  name="workExperienceList[1].unit" ></td>
						<td>
							<label><input name="workExperienceList[1].insurance" type="radio" checked="checked" class="ace" value="0"><span class="lbl">是</span></label>&nbsp;&nbsp;
            				<label><input name="workExperienceList[1].insurance" type="radio" class="ace" value="1"><span class="lbl">否</span></label>
						</td>
					</tr>
					<tr>
						<td><input type="text" class="input" value=""  id="beginTime2" name="workExperienceList[2].beginTime" ></td>
						<td><input type="text" class="input" value=""  id="endTime2" name="workExperienceList[2].endTime" ></td>
						<td><input type="text" class="input" value=""  name="workExperienceList[2].unit" ></td>
						<td>
							<label><input name="workExperienceList[2].insurance" type="radio" checked="checked" class="ace" value="0"><span class="lbl">是</span></label>&nbsp;&nbsp;
            				<label><input name="workExperienceList[2].insurance" type="radio" class="ace" value="1"><span class="lbl">否</span></label>
						</td>
					</tr>
					<tr>
						<td><input type="text" class="input" value=""  id="beginTime3" name="workExperienceList[3].beginTime" ></td>
						<td><input type="text" class="input" value=""  id="endTime3" name="workExperienceList[3].endTime" ></td>
						<td><input type="text" class="input" value=""  name="workExperienceList[3].unit" ></td>
						<td>
							<label><input name="workExperienceList[3].insurance" type="radio" checked="checked" class="ace" value="0"><span class="lbl">是</span></label>&nbsp;&nbsp;
            				<label><input name="workExperienceList[3].insurance" type="radio" class="ace" value="1"><span class="lbl">否</span></label>
						</td>
					</tr>
					<tr>
						<td><input type="text" class="input" value=""  id="beginTime4" name="workExperienceList[4].beginTime" ></td>
						<td><input type="text" class="input" value=""  id="endTime4" name="workExperienceList[4].endTime" ></td>
						<td><input type="text" class="input" value=""  name="workExperienceList[4].unit" ></td>
						<td>
							<label><input name="workExperienceList[4].insurance" type="radio" checked="checked" class="ace" value="0"><span class="lbl">是</span></label>&nbsp;&nbsp;
            				<label><input name="workExperienceList[4].insurance" type="radio" class="ace" value="1"><span class="lbl">否</span></label>
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
	    elem: '#joinWorkTime',
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
	    elem: '#centerTime',
	    event: 'focus' 
	});
	laydate.render({
	    elem: '#beginTime0',
	    event: 'focus' 
	});
	laydate.render({
	    elem: '#endTime0',
	    event: 'focus' 
	});
	laydate.render({
	    elem: '#beginTime1',
	    event: 'focus' 
	});
	laydate.render({
	    elem: '#endTime1',
	    event: 'focus' 
	});
	laydate.render({
	    elem: '#beginTime2',
	    event: 'focus' 
	});
	laydate.render({
	    elem: '#endTime2',
	    event: 'focus' 
	});
	laydate.render({
	    elem: '#beginTime3',
	    event: 'focus' 
	});
	laydate.render({
	    elem: '#endTime3',
	    event: 'focus' 
	});
	laydate.render({
	    elem: '#beginTime4',
	    event: 'focus' 
	});
	laydate.render({
	    elem: '#endTime4',
	    event: 'focus' 
	});
	function userSub(){
		if(confirm("确认提交吗？")){
			$("#form-article-add").submit();
		}
	}
	
	function back (){
		window.location.href="apply/online/turnup/list";
	}
	</script>
</html>