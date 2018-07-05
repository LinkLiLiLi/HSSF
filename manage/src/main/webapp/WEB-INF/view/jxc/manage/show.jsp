<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<head>
	<base href="<%=request.getContextPath() %>/" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
	<meta name="renderer" content="webkit">
	<title>关系结构</title>
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
            font-size: 15px;
            height: 45px;
        }
        .jOrgChart .node {
            width: 120px;
            height: 50px;
            line-height: 25px;
            border-radius: 4px;
            margin: 0 8px;
        }
        
        .jOrgChart .node1 {
            width: 120px;
            height: 50px;
            line-height: 25px;
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
  <div class="panel-head"><strong class="icon-reorder">&nbsp;&nbsp;关系结构</strong></div>
	<div id='jOrgChart' style="padding-top:5px;text-align:center;border-bottom: 1px solid #ddd;"></div>
<script type='text/javascript'>
    $(function(){
        //数据返回
        $.ajax({
            url: "jxc/manage/json/${id}",
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
                $("a").each(function(){
                	$(this).parent().attr("title",$(this).attr('title'));
                });
            }
        });
    });

    function showall(menu_list, parent) {
        $.each(menu_list, function(index, val) {
        	var name = val.name;
        	
        	if(name.length > 9) {
        		name = name.substring(0,8)+"...";
        	}
            if(val.childrens.length > 0){

                var li = $("<li></li>");
                li.append("<a style='width:200%;' href='javascript:void(0)' title='"+val.name+"' onclick=add('"+val.id+"','"+val.name+"');>数量:"+val.amount+"</br/>"+name+"</a>").append("<ul></ul>").appendTo(parent);
                //递归显示
                showall(val.childrens, $(li).children().eq(1));
            }else{
                $("<li></li>").append("<a style='width:200%;' href='javascript:void(0)'  title='"+val.name+"' onclick=add('"+val.id+"','"+val.name+"');>数量:"+val.amount+"</br/>"+name+"</a>").appendTo(parent);
            }
        });
        
    }
    
    function add(id,name){
    	if(confirm("确认在"+name+"下添加组成零件？")){
    		window.location.href="jxc/manage/toaddchild/" + id+"/${id}";
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
</body>
</html>


