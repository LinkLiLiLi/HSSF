<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title></title>
</head>
<frameset rows="77,*" frameborder="no" border="0" framespacing="0">
	<frame src="include/top.jsp" name="topFrame" scrolling="no" noresize="noresize" id="topFrame" title="topFrame" />
		<frameset cols="200,*" frameborder="no" border="0" framespacing="0" id="contentFrame">
			<frame src="include/left.jsp" name="leftFrame" scrolling="auto" noresize="noresize" id="leftFrame" style="overflow-x:hidden;"/>
			<frame src="include/welcome.jsp" name="mainFrame" scrolling="auto"id="mainFrame" style="padding: 15px;"/>
  		</frameset>
</frameset>
<noframes>
</noframes>

</html>