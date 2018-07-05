<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE html>
<head>
	<base href="<%=request.getContextPath() %>/" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
	<meta name="renderer" content="webkit">
	<title>组织机构</title>
	<script src="js/jquery.js"></script>
	<script src="js/pintuer.js"></script>
	<link rel="stylesheet" href="css/pintuer.css">
	<link rel="stylesheet" href="css/admin.css">
	<link rel="stylesheet" href='css/jquery.jOrgChart.css?aabc'/>
    <script type='text/javascript' src='js/jquery.min.js'></script>
    <script type='text/javascript' src='js/jquery.jOrgChart.js'></script>
    <style>
        a {
            text-decoration: none;
            color: #fff;
            font-size: 12px;
        }
        .jOrgChart .node {
            width: 120px;
            height: 50px;
            line-height: 50px;
            border-radius: 4px;
            margin: 0 8px;
        }
        a:hover , a:visited ,a:FOCUS {
		    color: #fff;
		}
    </style>
</head>
<body>
<!--显示组织架构图-->
<div class="panel admin-panel">
  <div class="panel-head"><strong class="icon-reorder">&nbsp;&nbsp;组织机构</strong></div>
  <div class="body-content">
	<div id='jOrgChart' style="padding-top:5px;text-align:center;border-bottom: 1px solid #ddd;"></div>
	
	<table class="table table-hover text-center">
      <tr>
        <th>序号</th>
		<th>小组名称</th>
		<th>小组描述</th>
		<th>操作</th>
      </tr>
       <c:forEach items="${groupList}" var="group" varStatus="status">
			<tr>
	          <td>${status.index+1}</td>
	          <td>${group.groupName}</td>
	          <td>${group.groupDesc}</td>
	          <td>
	          	<div class="button-group">
	          		<shiro:hasPermission name="group_edit">
		          		<a class="button border-main" onclick="edit('${group.id}')" href="javascript:;">
		          			<span class="icon-edit"></span> 修改
		          		</a>
	          		</shiro:hasPermission>
	          		<shiro:hasPermission name="group_delete">
		          		<a class="button border-red" href="javascript:void(0)" onclick="del('${group.id}')">
		          			<span class="icon-trash-o"></span> 删除
		          		</a>
	          		</shiro:hasPermission>
	          	</div>
	          </td>
			</tr>
		</c:forEach>
    </table>
	
	
<script type='text/javascript'>
    $(function(){
        //数据返回
        $.ajax({
            url: "usergroup/json",
            type: 'POST',
            dataType: 'JSON',
            success: function(result){
                var showlist = $("<ul id='org' style='display:none'></ul>");
                showall(result.data, showlist);
                $("#jOrgChart").append(showlist);
                $("#org").jOrgChart( {
                    chartElement : '#jOrgChart',//指定在某个dom生成jorgchart
                    dragAndDrop : false //设置是否可拖动
                });
                $('.line').removeAttr("display");
            }
        });
    });

    function showall(menu_list, parent) {
        $.each(menu_list, function(index, val) {
            if(val.childrens.length > 0){

                var li = $("<li></li>");
                li.append("<a href='javascript:void(0)' onclick=add('"+val.id+"','"+val.name+"');>"+val.name+"</a>").append("<ul></ul>").appendTo(parent);
                //递归显示
                showall(val.childrens, $(li).children().eq(1));
            }else{
                $("<li></li>").append("<a href='javascript:void(0)' onclick=add('"+val.id+"','"+val.name+"');>"+val.name+"</a>").appendTo(parent);
            }
        });
        
    }
    
    function add(id,name){
    	if(confirm("确认在"+name+"下创建子项目组？")){
    		window.location.href="usergroup/toadd/" + id;
    	}
    }
    
    function edit(id){
    	window.location.href="usergroup/toedit/" + id;
    }
    
    function del(id){
    	if(confirm("确认删除？")){
	    	window.location.href="usergroup/del/" + id;
    	}
    }
    
    $(function(){
    	var msg = '${msg}';
    	
    	if(msg != '') {
    		alert(msg);
    	}
    });
</script>
  </div>
</div>
</body>
</html>


