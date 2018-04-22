<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
String contextPath = request.getContextPath();
String servName = request.getServerName();
int servPort = request.getServerPort();
String servPath = request.getServletPath();
StringBuffer reqUrl = request.getRequestURL();
String scheme = request.getScheme();
String basePath = scheme+"://"+servName+":"+servPort+contextPath+"/";
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>test page</title>
<script type="text/javascript" src="<%=basePath %>js-1/jquery-3.3.1.js"></script>
<script type="text/javascript">
	$(function(e){
		debugger
		var p = "dsf";
		$("#dataParam").val(p);
		$("#data").submit();
		debugger
	});
</script>
</head>
<body>
	<form id="data" action="news" target="myframe" method="get">
		<input id="dataParam" name="name"/>
		<input id="dataP2" name="sex"/>
	</form>
	<iframe id="myframe" width="200px" height="300px"/>
</body>
</html>