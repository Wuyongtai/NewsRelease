<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="css/bootstrap.min.css" rel="stylesheet" />
<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<title>新闻发布系统</title>
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/style.css" />
<script src='//zaole.net/sliding.js'></script>
<script src="//assets.codepen.io/assets/common/stopExecutionOnTimeout-6c99970ade81e43be51fa877be0f7600.js"></script>

<script>

	function login() {
		$("#loginBtn").click(function() {
			$('#modal').css('display', 'block');
			$('.modal-bg').fadeIn();
		});
		$('#close').click(function() {
			$('.modal-bg').fadeOut();
			$('#modal').fadeOut();
			return false;
		});
	}
	
	function reg() {
		$("#regBtn").click(function() {
			$('#modal1').css('display', 'block');
			$('.modal-bg1').fadeIn();
		});
		$('#close1').click(function() {
			$('.modal-bg1').fadeOut();
			$('#modal1').fadeOut();
			return false;
		});
	}
	
	function loginOut(){
		var flag=confirm("你确定要退出吗？");
		if(flag){
			<% session.removeAttribute("user");%>
			window.location.href="pages/front/front_comment.jsp";
			return true;
		}	
	}
</script>

</head>
<body>
	<!--用户登录-->
	<div class="modal-bg" style="display: none;">
		<div id="modal">
			<span>请登录<a href="#close" id="close">×</a></span>
			<span><font color="red">${message}</font></font></span>
			<form action="pages/back/user_fontLogin.action" method="post">
				<input id="username" name="user.name" type="textbox"
					placeholder="请输入用户名" required> <input id="password"
					name="user.password" type="password" placeholder="请输入密码" required>
				<a id="forgot-link" href="#">没有账号?</a> <input type="submit"
					value="登录" style="width:80px;border: none;font-family:'微软雅黑';float: right;background: #0FC491;margin-top: 15px;" />
			</form>
		</div>
	</div>
	<!-- 用户注册 -->
	<div class="modal-bg1" style="display: none;">
		<div id="modal1">
			<span>欢迎注册<center>${message}</center><a href="#close" id="close1">×</a></span>
			<form action="pages/back/user_insert.action" method="post">
				<input id="username" name="user.name" type="textbox"
					placeholder="请输入用户名" required style="margin-top:-10px"> 
			    <input  
					name="user.userType" type="hidden" value="0" required>
					<input  
					name="user.dateStr" type="hidden" value="<%=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(new Date())%>" required>
				<input id="password"
					name="user.password" type="password" placeholder="请输入密码" required>
			    <input id="password"
					name="confirm_password" type="password" placeholder="确认密码" required>
				<input type="submit"
					value="注册" style="width:80px;border: none;font-family:'微软雅黑';float:left;background: #0FC491;margin-left:100px;margin-top:0px;" />
			</form>
		</div>
	</div>
	
	<!--导航-->
	<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#navbar" aria-expanded="false"
				aria-controls="navbar">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
		</div>
		<div class="collapse navbar-collapse" id="navbar">
			<ul class="nav navbar-nav">
				<li class="active"><a href="index.html">首页</a></li>
				<li><a href="#">国内</a></li>
				<li><a href="#">国际</a></li>
				<li><a href="#">体育</a></li>
				<li><a href="#">娱乐</a></li>
				<li><a href="#">游戏</a></li>
				<li><a href="pages/back/back_login.jsp">后台管理</a></li>
			</ul>
			<c:if test="${empty user}">
				<ul class="nav navbar-nav navbar-right">

					<li style="margin-right:-25px">
						<a href="javascript:login()" id="loginBtn">登录</a>
						
					</li>
					<li >
						<a href="javascript:reg()" id="regBtn">注册</a>
					</li>

				</ul>
			</c:if>
			<!-- 用户以登陆，显示用户管理中心块 -->
			 
			<c:if test="${!empty user}">
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown"
							role="button" aria-haspopup="true" aria-expanded="false">
							${user.name}
							<span class="caret"></span>
						</a>
						<ul class="dropdown-menu">
							<li>
								<a href="#">个人中心</a>
							</li>
							<li>
								<a href="#">密码修改</a>
							</li>
							<li role="separator" class="divider"></li>
							<li>
								<a onclick="loginOut()">退出</a>
							</li>

						</ul>
					</li>
				</ul>
			</c:if>
		</div>
	</div>
	</nav>
	<!--主体内容-->
	<div class="container bg-info" style="margin-top: 51px;">
		<div style="margin-top: 100px;">
			<!--标题-->
			<div
				style="text-align: center;margin: 0 auto;font-family: '微软雅黑'; font-size: 20px;">Top
				aligned media</div>
			<!--内容-->
			<div style="margin-top: 30px;">Be sure to add aria-expanded to
				the control element. This attribute explicitly defines the current
				state of the collapsible element to screen readers and similar
				assistive technologies. If the collapsible element is closed by
				default, it should have a value of aria-expanded="false". If you've
				set the collapsible element to be open by default using the in
				class, set aria-expanded="true" on the control instead. The plugin
				will automatically toggle this attribute based on whether or not the
				collapsible element has been opened or closed.</div>
			<!--浏览量-->
			<div class="pull-right" style="margin-top: 30px;margin-bottom: 30px;">
				浏览量: <font color="#B5002A">10</font>
			</div>
			<!--评论-->
			<div style="margin-top: 100px;margin-left: 20px;">
				<font color="#5A62FB" style="font-size: 16px;">网友评论</font>&nbsp;&nbsp;
				<font color="#999999">文明上网,理性发言</font> <font color="#B5002A"
					class="pull-right">4条评论</font>
			</div>
			<div style="margin-top: 15px;">
				<!--内容框-->
				<textarea rows="6" class="form-control" value=""></textarea>
				<input type="submit" value="发表" class="pull-right btn btn-info"
					style="width: 100px; margin-top: 5px;margin-bottom: 5px;border: none;" />
			</div>
			<!--评论列表-->
		</div>
	</div>
	<!--底部-->
	<div style="text-align: center;margin: 0 auto;">
		<footer>
		<div>
			<p>
				<a href="#">关于我们</a> | <a href="#">联系我们</a> | <a href="#">使用帮助</a> |
				<a href="#">用户协议</a> | <a href="#">iPhone/iPad Android</a>
			</p>
			<p>
				<a href="#">地址：贵州省贵阳市花溪区贵州大学北校区野猪林</a> | <a href="#">联系电话：0851-1234567</a>
			</p>
		</div>
		</footer>
	</div>
	<script>
		$('#userOpen').click(function() {
			$('#show').slideToggle('slow');
		});
	</script>
</body>
</html>
