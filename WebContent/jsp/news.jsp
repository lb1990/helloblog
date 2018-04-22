<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%
String contextPath = request.getContextPath();
String servName = request.getServerName();
int servPort = request.getServerPort();
String servPath = request.getServletPath();
StringBuffer reqUrl = request.getRequestURL();
String scheme = request.getScheme();
String basePath = scheme+"://"+servName+":"+servPort+contextPath+"/";
%>
</head>
<body>
news
contents:<%=request.getAttribute("content") %>
</body>
</html>