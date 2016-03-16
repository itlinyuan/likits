<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";

	response.setHeader("Cache-Control","no-cache"); 
	response.setHeader("Cache-Control","no-store");  //和上面的参数不一样
	response.setDateHeader("Expires", 0); 
	response.setHeader("Pragma","no-cache"); 
%>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title></title>
	<meta name="description" content="" />
	<meta name="keywords" content="" />
	<link rel="shortcut icon" type="/image/ico" href="assets/images/icon.png">
	<link rel="stylesheet" type="text/css" href="assets/css/pass.css" />
	
</head>
<body>
	<div class="bg">
		<div class="container">
			<div class="logo">
				<a href="index.jsp" title="点击到主页"><img src="assets/images/biglogo.png" alt="likits"></a>
			</div>
			<div class="regi_login">
				<div class="tab_links">
					<a class="active" href="javascript:;">登录</a>
					<a href="javascript:;">注册</a>
					<div class="color-layer"></div>
				</div>
				<div class="tab_cons clearfix">
					<div class="tab_con tab_con_1 clearfix active">
						<div class="regi_form">
							<form action="userLogin.action" id="login_form">
								<input type="text" name="email" id="login_mail" autocomplete="off" placeholder="用户名或邮箱" />
								<input type="password" name="password" id="login_pass" autocomplete="off" placeholder="密码" />
								<s:token></s:token>
								<input type="submit" class="regi_form_button" id="login_button" value="登 录" />
								<div class="choice">
									<label class="fl auto_login">
										<input name="auto_login" type="checkbox" value="" />自动登录
									</label>
									<a href="forget.html" class="forget fr">忘记密码？</a>
								</div>
							</form>
						</div>
						<div class="regi_other">
							<p>第三方登录</p>
							<div class="regi_other_link">
								<a href="javascript:;"><img src="assets/images/qq_2.png"></a>
								<a href="javascript:;"><img src="assets/images/wechat_2.png"></a>
								<a href="javascript:;"><img src="assets/images/weibo_2.png"></a>
							</div>
						</div>
					</div>
					<div class="tab_con tab_con_2 clearfix">
						<div class="regi_form">
							<form action="javascript:;" id="regi_form">
								<input type="text" name="user" id="regi_user"  autocomplete="off" placeholder="用户名" />
								<input type="text" name="email" id="regi_mail"  autocomplete="off" placeholder="邮箱" />
								<input type="password" name="password" id="regi_pass" autocomplete="off" placeholder="密码" />
								<input type="submit" class="regi_form_button" id="regi_button" value="注 册" />
							</form>
						</div>
						<div class="regi_other">
							<p>第三方注册</p>
							<div class="regi_other_link">
								<a href="javascript:;"><img src="assets/images/qq_2.png"></a>
								<a href="javascript:;"><img src="assets/images/wechat_2.png"></a>
								<a href="javascript:;"><img src="assets/images/weibo_2.png"></a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="tips">
		<span>暂不支持此功能</span>
	</div>

	<script type="text/javascript" src="assets/js/jquery-2.1.0.min.js"></script>
	<script type="text/javascript" src="assets/js/Main.js"></script>
	<script type="text/javascript" src="http://120.27.96.114:8080/likits/assets/js/pass.js"></script>
	<script src="assets/js/index.js"></script>

</body>
</html>

