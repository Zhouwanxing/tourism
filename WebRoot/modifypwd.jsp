﻿<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="entity.Userinfo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entity.Cart"%>
<%@page import="entity.Business"%>
<%@page import="java.util.List"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>购物车</title>
<link href="css/layout.css" rel="stylesheet" type="text/css" />
<link href="css/nf.lightbox.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="js/NFLightBox.js"></script>
<script type="text/javascript" src="js/shop.js"></script>
<script type="text/javascript" src="js/findpwd.js"></script>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style type="text/css">
.mask { /*遮罩层*/
	background-color: gray;
	left: 0;
	position: absolute;
	top: 0;
	z-index: 100;
	filter: alpha(opacity = 30);
	opacity: 0.3;
}
h3{
font-size:25px;
font-weight:bold;

}
div.dialog {
	width: 296px;
	height: 173px;
	position: absolute;
	z-index: 101;
	display: none;
	background-image: url(images/dialog.png)
}

div.title {
	padding-top: 5px;
	padding-left: 270px;
}

div.dialog div.content {
	height: 90px;
	text-align: center;
	font: bold 15px/90px Verdana, Geneva, sans-serif;
}

div.dialog div.bottom {
	text-align: right;
	padding: 10px 10px 10px 0px;
	border-top: 1px dashed #999999;
}

div.bottom .btn1 {
	border: none;
	width: 63px;
	height: 29px;
	cursor: pointer;
}

div.bottom #btnSure {
	background-image: url(images/delSure.jpg);
}

div.bottom #btnCancel {
	background-image: url(images/delCancel.jpg);
}
#shop{
	width:940px;
}
.p1{
	width:400px;
	height:40px;
	overflow:hidden;
	text-overflow:ellipsis; 
	white-space: nowrap;  /*强制不换行*/
}
.span_span{
	width:70px;
	display:inline-block;
}
/* .user{
	width:20%;
	margin: 0 auto;
} */
.touxiang{
   
	width: 200px;
	height: 100px;
	margin: 20px auto;
	position: relative;
}
.touxiang img{
	border: 1px solid #fff;
	border-radius:50% 50% 50% 50%;
	}
.user_test{
	width : 300px;
	margin: 20px auto;
}
.user_test form p{
	height: 10px;
}
#wangcheng{
	white-space: nowrap; 
	margin-left:200px;
}
#wangcheng1{
	white-space: nowrap; 
	margin-left:200px;
}
.touxiang p{
	width :100%;
	height :20px;
	position: absolute;
	bottom: 10px;
	text-align: center;
	border: 1px solid #fff;
	background : rgba(0,0,0,0.2); 
	border-radius: 0 0 50% 50%;
	display :  none;
}
.pwddiv{
display:none;
}
#pp{
height:10px;
}
.errmsg{
color:red;
}
</style>
<script type="text/javascript" >
$(function(){
 
	$("#users_pwd1").blur(function(){
		var pwd1=$("#users_pwd1").val();
		if(pwd1==""){
			$(".pwdmsg1").text("");
		}
		if((pwd1.length<6||pwd1.length>12)&&pwd1.length!=""){
			$(".pwdmsg1").css("color","red").text("密码位6~12位");
		}else{
			$(".pwdmsg1").text("");
		}
		
	});
	$("#users_pwd2").blur(function(){
		var pwd2=$("#users_pwd2").val();
		var pwd1=$("#users_pwd1").val();
		if(pwd2==""){
			$(".pwdmsg2").text("");
		}
		 
		if((pwd2.length<6||pwd2.length>12)&&pwd2!=""){
			$(".pwdmsg2").css("color","red").text("密码位6~12位");
		}else{
			if(pwd1==pwd2){
			$(".pwdmsg2").text("");}else{$(".pwdmsg2").text("两次输入密码不一样")}
		}
		
	});
	
 
})
</script>
<%-- <%
	Userinfo sessionUser = (Userinfo)session.getAttribute("userInfo");
	String users_userid = sessionUser.getUserid();
	String users_pwd = sessionUser.getPwd();
	String users_uname = sessionUser.getUname();
	String users_sex = sessionUser.getSex();
	String users_pid = sessionUser.getPid();
	String users_phone = sessionUser.getPhone();
	%> --%>
</head>

<body>

	<!--头部-->
	<div id="top-cont">
		<div id="top-min">
			<div id="min-left"></div>
			<div id="min-right"></div>
		</div>
	</div>
	<div id="menu">
		<div id="menu-m">
			<ul>
				<li><a href="index.jsp">首页</a></li>
				<li style="width:8px;"><img src="images/t1.jpg" width="8"
					height="42" /></li>
				<li><a href="type.jsp">境内游</a></li>
				<li style="width:8px;"><img src="images/t1.jpg" width="8"
					height="42" /></li>
				<li><a href="#">境外游</a></li>
				<li style="width:8px;"><img src="images/t1.jpg" width="8"
					height="42" /></li>
				<li><a href="#">热门游</a></li>
				<li style="width:8px;"><img src="images/t1.jpg" width="8"
					height="42" /></li>
				<li><a href="group.jsp">团购</a></li>
				<li><a href="CartServlet"><img src="images/che.jpg"
						width="176" height="42" /></a></li>
			</ul>
		</div>
	</div>
	<!--广告位图片-->


	<!--注册版块-->
	<div class="user">
		<div class="touxiang">
		 <h3>个人信息</h3>
			<!-- <img src="images/touxiang.jpg" />
			<p class="change_tx"><a href="" class="change_tx_a">更换头像</a></p> -->
		</div>
		<div class="user_test">
				<form  action="modifypwdSerlvet" method="post">
			 
				<span class="span_span"  >原密码： </span><input id="users_pwd" type="password"  name="oldpwd"  placeholder="请输入原密码"/><span class="errmsg">${errmsg }</span> <br/> <p></p>
				<span class="span_span" >新密码： </span><input id="users_pwd1" name="newpwd1"  type="password"  value=""  placeholder="请输入6~12位密码"/><span class="pwdmsg1"></span><br/><p id="pp"></p>
				<span class="span_span" >确认密码： </span><input  id="users_pwd2" name="newpwd2"   type="password"  value=""  placeholder="请输入确认密码"/><span class="pwdmsg2"></span><p></p>
				<input id="wangcheng1" type="submit" value="确认修改"/>  
			 </form>
			
		</div>
	</div>

	<!--底部-->
	<div id="foot">
		<div id="foot-t">
			<p>许可证编号：WE125482154 鄂ICP备125478966</p>
			<p>
				<a href="#">隐私保护</a> | <a href="#">诚聘英才</a> | <a href="#">关于我们</a> |
				<a href="#">网站地图</a> | <a href="#">友情链接</a> | <a href="#">商务合作</a>
			</p>
		</div>
	</div>
	<div class="mask"></div>


	<div class="dialog">
		<div class="title">
			<img src="images/del.png" id="closePic" title="关闭" />
		</div>
		<div class="content">
			<p>您真的要删除这条记录吗？</p>
		</div>
		<div class="bottom">
			<input type="button" value="" class="btn1" id="btnSure" /> <input
				type="button" value="" class="btn1" id="btnCancel" />
		</div>
	</div>
</body>
</html>
