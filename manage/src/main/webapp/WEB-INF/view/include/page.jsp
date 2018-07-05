<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<tr>
<td id="tdhb">
<div class="pagelist"> 
	<c:if test="${page.hasFirstPage}">
		<a href="javascript:void(0);" onclick="invokeAction(1);">第一页</a>
	</c:if>
	<c:if test="${!page.hasFirstPage}"><a href="javascript:void(0);">第一页</a></c:if>
	<c:if test="${page.hasPrevPage}">
		<a href="javascript:void(0);" onclick="invokeAction(${page.currPage-1});">上一页</a>
	</c:if>
	<c:if test="${!page.hasPrevPage}"><a href="javascript:void(0);">上一页</a></c:if>
	<input id="goPage" name="goPage" type="hidden" value="${page.currPage}"/>
	<span class="current">${page.currPage}</span>
	<c:if test="${page.hasNextPage}">
		<a href="javascript:void(0);" onclick="invokeAction(${page.currPage+1});">下一页 </a>
	</c:if>
	<c:if test="${!page.hasNextPage}"><a href="javascript:void(0);">下一页</a></c:if>
	<c:if test="${page.hasLastPage}">
		<a href="javascript:void(0);" onclick="invokeAction(${page.totalPage});">最末页</a>
	</c:if>
	<c:if test="${!page.hasLastPage}"><a href="javascript:void(0);">最末页</a></c:if>
	</div>
</td>
</tr>
<script type="text/javascript">
	function invokeAction(goPage){
	 	document.getElementById("goPage").value = goPage;
		var formObj = document.forms[0];
		var actionURL = formObj.action;
		formObj.submit();
	}
	
	$(function (){
		var colspan = '${param.colspan}';
		$("#tdhb").attr("colspan", colspan);
		
	});
</script>
