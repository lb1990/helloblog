window.onload = function() {
	requestSuxing();
}
function requestSuxing() {
	var xmlhttp = new XMLHttpRequest();
	xmlhttp.onreadystatechange = function() {
		if(xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			var suxing = document.getElementById("suxing");
			var json = JSON.parse(xmlhttp.response);
			/* suxing.innerHTML = "<a onclick='cool(this);'>master:"+json.master+"</a>"; */
			var article = document.getElementById("content");
			var content = json.content;
			for(var i=0; i<content.length; i++) {
				var idx = i+1;
				var praiseCount = json.content[i].praiseCount;
				praiseCount = praiseCount == null ? 0 : praiseCount;
				var cnt = json.content[i].content;
				var articleid = json.content[i].id;
				article.innerHTML += 
				"<div id='cnt_id_" +articleid+ "'>"+
					"<div id='article_id_" +articleid+ "'>" +cnt+ "</div>" + "<br>" +
					"<div style='width:450px;'>"+
						"<div style='margin-left:350px'>" +
							"<a class='cover' style='font-size:10px;color:green' onclick='praise(this);'>赞</a>"+
								" (<label id='count_" +articleid+ "'>"+praiseCount+"</label>)"+ "&nbsp&nbsp&nbsp" +
							"<a id='cmt_"+articleid+"' class='cover' style='font-size:10px;color:green' onclick='comment(this);'>回复</a>"+
						"</div>"+
					"</div>"+
					"<hr>"+
				"</div>";
			}
		}
	}
	xmlhttp.open("GET","suxing",true);
	xmlhttp.send();
}
function praise(obj) {
	var beanid = obj.parentElement.id;
	var cntid = obj.parentElement.parentElement.parentElement.id;
	debugger
	var articleid = cntid.substring(cntid.lastIndexOf("_")+1);          
	var xmlhttp = new XMLHttpRequest();
	xmlhttp.onreadystatechange = function() {
		if(xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			var json = JSON.parse(xmlhttp.response);
			if(json.isPrs) {
				alert("您已赞过");
			}
			var prsCntNode = document.getElementById("count_"+articleid);
			prsCntNode.innerHTML = json.prsCount;
		}
	}
	xmlhttp.open("GET","save?articleid="+articleid,true);
	xmlhttp.send();
}
function login() {
	var url = "<%=basePath%>login.jsp";
	window.open(url, "_blank", "width=700,height=400,top=200,left=460,location=no,toolbar=no,directories=no");
}
var mvspd = 2;
var dir = 1;
window.setInterval(function(){
	var celsayDiv = document.getElementById("cel_say");
	var mleft = celsayDiv.style.marginLeft;
	var mleftcount = mleft.substring(0,mleft.indexOf("p")); 
	document.getElementsByTagName("body");
	if(mleftcount == "") {
		mleftcount = 2;
	} else {
		var maxCount = Math.round(document.getElementsByTagName("body")[0].scrollWidth*0.7);
		var offset = -80;
		if(mleftcount >= maxCount+offset) {
			dir = -1;
		}else if(mleftcount < 0) {
			dir = 1;
		}
		mleftcount = Number(mleftcount) + mvspd * dir;			
	}
	celsayDiv.style.marginLeft = mleftcount+"px";
}, 20);
/**tab页切换*/
function tabChange(obj) {
	debugger
	
	var mainPage = document.getElementById(obj.name);
	mainPage.className = "show";
			
}
function comment(obj) {
	alert("wait...");
}