<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<tr>
	<td colspan="8">
	  	<div class="pagelist">
	  		总计 ${page.totalRows} 个记录，共 ${page.totalPage} 页，当前第 ${page.currPage} 页
  			<c:if test="${page.hasFirstPage}">
				<a href="javascript:void(0);" onclick="invokeAction(1);">第一页</a>
			</c:if>
			<c:if test="${!page.hasFirstPage}"><li class="prev disabled"><a href="javasxript:void(0)">第一页</a></c:if>
			
			<c:if test="${page.hasPrevPage}">
				<a href="javascript:void(0);" onclick="invokeAction(${page.currPage-1});">上一页</a>
			</c:if>
			<c:if test="${!page.hasPrevPage}"><li class="prev disabled"><a href="javasxript:void(0)">上一页</a></c:if>
			
			<c:if test="${page.hasNextPage}">
				<a href="javascript:void(0);" onclick="invokeAction(${page.currPage+1});">下一页</a>
			</c:if>
			<c:if test="${!page.hasNextPage}"><li class="next disabled"><a href="javasxript:void(0)">下一页</a> </c:if>

			<c:if test="${page.hasLastPage}">
				<a href="javascript:void(0);" onclick="invokeAction(${page.totalPage});">最末页</a>
			</c:if>
			<c:if test="${!page.hasLastPage}"><li class="next disabled"><a href="javasxript:void(0)">最末页</a></c:if>
			<input id="goPage" name="goPage" type="hidden" value="${page.currPage}"/>
		</div>
	</td>
</tr>