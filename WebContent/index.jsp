<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.UUID,java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.lbblog.db.*" %>
<% 
   String contextPath = request.getContextPath();
   String servName = request.getServerName();
   int servPort = request.getServerPort();
   String servPath = request.getServletPath();
   StringBuffer reqUrl = request.getRequestURL();
   String scheme = request.getScheme();
   String basePath = scheme+"://"+servName+":"+servPort+contextPath+"/";
   int count = 0;
   String sessionid = session.getId();
   if(application.getAttribute("loginCount") != null) {
	   count = Integer.parseInt(application.getAttribute("loginCount").toString());
	   count++;
	   application.setAttribute("loginCount", count);   
   }else{
	   count++;
	   application.setAttribute("loginCount", count);
   }
   String url = request.getHeader("Referer");
   String ip = request.getRemoteAddr();
   String id = UUID.randomUUID().toString();
   SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
   String time = sdf.format(Calendar.getInstance().getTime());
   DBDao dao = new DBDao();
   Object [] params = new Object[]{id, url == null ? "*" : url, ip == null ? "*" : ip, time};
   dao.update("insert into b_login_record values (?,?,?,?)", params);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>www.linbinblog.com</title>
<style type="text/css">
	
</style>
<link rel="stylesheet" href="<%=basePath %>css/index.css" type="text/css">
<script type="text/javascript" src="<%=basePath %>js/index.js"></script>
<script type="text/javascript">
	
</script>
</head>
<body background="<%=basePath %>pic/telescope2+width.jpg" style="background-repeat: no-repeat; background-size:cover; background-attachment: fixed;">
<div id="bg" name="bg" style="width:100%; height:1050px;"><!-- background-color: #CCFF99;  -->
	<div style="width:70%; margin: 0 auto">
		<div class=".blockinline" style="float:left; margin: 0px 10px 0px 10px"><img alt="family" src="<%=basePath%>pic/family.jpg" style="height:40px;"></div>
		<h1>welcome to my new web site!</h1>
	</div>
	<div name="content" style="width:70%; height:1070px; margin: 0 auto"><!-- background-color: #FFFF99; -->
		<div class="tab-content" style="height:1000px">
			<div name="headPic" style="height:40px; text-align: left; color: #E1FFFF;width:100%;">
				<div class="blockinline" style="float: left; width:30%">425475449@qq.com&nbsp&nbsp&nbsp&nbsp<img alt="live" src="<%=basePath%>pic/heart.gif" height="17px" width="15px"></div>
				<div class="blockinline" style="float: right; width:40px; font-style: normal; color:black; cursor:pointer;" onclick="login();">login</div>
			</div>
			<div name="navigateBar" style="height:40px; background-color:#0099CC">
				<ul id="nav">
					<li><a name="main_page" onclick='tabChange(this);'>主页</a></li>
					<li><a name="tech_page" onclick='tabChange(this);'>技术</a></li>
					<li><a name="emot_page" onclick='tabChange(this);'>情感</a></li>
				</ul>
			</div>
			<hr>
			<div id="cel_say" style="font-size: 5px; color: yellow">新年快乐！</div>
			<hr>
			<div id="main_page" name="blockBody" style="height:800px; margin-top:10px">
				<div class="blockinline" name="leftBlock" style="width:25%; float:left; height:500px; margin-right:2%;">
					<div style="height:250px; background-color: white; margin-bottom:10px">
						<div style="height:20px;text-align:center">linbin的blog</div>
						<hr>
						<div class=".img-box" style="text-align: center">
							<img src="<%=basePath %>pic/jinmao.jpg" height="170px"/>
						</div>
						<div style="width:100%; height:15px; text-align: center"><a onclick='cool(this);'>发私信</a>|<a onclick='cool(this);'>加友情链接</a></div>
					</div>
					<div style="height:200px; background-color: white; margin-bottom:10px">
						<div style="margin-left:10px">
							博客统计信息
							<hr>
							用户名：卖萌的二哈<br>
							文章数：1<br>
							评论数：0<br>						
						</div>
					</div>
					<div id="suxing" style="height:100px; background-color: white; margin-bottom:10px"></div>
					<div style="height:90px; background-color: white; margin-bottom:10px">other thing</div>
				</div>
				<div class="blockinline" name="leftBlock" style="width:46%; float: left; height:700px; margin-right:2%;">
					<div id="article" style="height:400px; background-color: white; position: relative;">
						<!-- <div style="width:100px;height:20px;margin-left:10px">
							<label style="text-align: center;"></label>
						</div> -->
						<div style="margin-left:10px">
							文章
							<hr>
							<div id="content" style="height:320px; margin: 10px 10px auto 0px"></div>
						</div>
					</div>
					<div style="height:200px; background-color: white; margin-top:10px">will be staying</div>
				</div>
				<div class="blockinline" name="blockinline" style="width:25%; float:right; height:250px; margin: auto; background-color: white; margin-bottom:10px">
					<div style="margin-left:10px">
						网站链接<hr>
						<div><a href="http://www.baidu.com">百度</a></div>
					</div>
				</div>
				<div class="blockinline" name="blockinline" style="width:25%; float:right; height:250px; margin: auto; background-color: white">
					<div style="margin-left:10px">
						看视频<hr>
						<div><a href="http://www.iqiyi.com/w_19rs9jwy4x.html">宋冬野西安演唱会</a></div>
						<hr>
						<img src="<%=basePath %>pic/playball.gif" height="140px"/><br>
						登录次数：<%=count %>
					</div>
				</div>
			</div>
			<div id="tech_page">
				<div id="tech_list">
					<ul>
						<li>1</li>
						<li>2</li>
						<li>3</li>
					</ul>
				</div>
			</div>
			<div id="emot_page">
				<div id="em_list">
					<ul>
						<li>1</li>
						<li>2</li>
						<li>3</li>
					</ul>
				</div>
			</div>
		</div>
		<div style="margin:0px auto; text-align:center">
			<div style="height:30px;color: #FAEBD7">地球的中心</div>
			<div style="width:300px;margin:0 auto; padding:5px 0px;">
		 		<a target="_blank" href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=37010502000967" style="display:inline-block;text-decoration:none;height:20px;line-height:20px;"><img src="<%=basePath %>pic/beian.png" style="float:left;"/><p style="float:left;height:20px;line-height:20px;margin: 0px 0px 0px 5px; color:#FAEBD7;">鲁公网安备 37010502000967号</p></a>
		 	</div>
		</div>
	</div>
</div>
</body>
</html>