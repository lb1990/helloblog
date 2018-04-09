<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>login page</title>
<script type="text/javascript">
	function loginCheck(obj) {
		var name = document.getElementsByName("usrname")[0].value;
		var pwd = document.getElementsByName("pwd")[0].value;
		var xmlhttp = new XMLHttpRequest();
		xmlhttp.onreadystatechange = function() {
			if(xmlhttp.status == 200 && xmlhttp.readyState == 4) {
				debugger
				var json = JSON.parse(xmlhttp.response);
				if(json.isAdm) {
					alert("登录成功！");
				}else{
					alert("登录失败！");
				}
			}
		}
		xmlhttp.open("GET", "login?usrname="+name+"&pwd="+pwd, true);
		xmlhttp.send();
		return false;
	}
</script>
</head>
<body>
	<form action="/login">
		用户名：<input type="text" name="usrname"/>
		密码：    <input type="password" name="pwd"/>
		<input type="button" onclick="loginCheck(this)" value="登录"/>
	</form>
</body>
</html>