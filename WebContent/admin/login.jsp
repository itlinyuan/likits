<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	 
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>likits后台管理</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<script type="application/x-javascript">
			addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 	
	</script>
	 <script type="text/javascript">  
    function refresh(obj) {  
        obj.src = "${pageContext.request.contextPath}/VerificationCodeServlet?"+Math.random();  
    }  
    </script>
	<meta name="keywords" content="keyword1,keyword2,keyword3" />
	<link href="../assets/admin/css/style.css" rel='stylesheet' type='text/css' />
    <script src="../assets/js/jquery-2.1.0.min.js"></script>
</head>
<body>
	<!--SIGN UP-->
	<h1>likits后台管理系统</h1>
	<div class="login-form">
		<div class="avtar">
			<img src="../assets/admin/images/logo.png" />
		</div>
		<form action="adminLogin.action" method="post">
			<input type="text" class="adminName" value="请输入账号.." name="adminName"
				onfocus="if (this.value == '请输入账号..') {this.value = '';}"
				onblur="if (this.value == '') {this.value = '请输入账号..';}">
			<input type="password" class="password" value="" name="Password">
	  		<input type="text" class="verificationCode" value="" name="verificationCode">
	  		<img src="${pageContext.request.contextPath}/VerificationCodeServlet" class="verificationCodeimg" title="点击更换" onclick="javascript:refresh(this);"/>
		   
		   <div class="signin">
			<input type="submit" value="登录">
		   </div>
		</form>
		
	</div>
	<div class="copy-rights">
		<p>Copyright &copy; 2016 likits All rights reserved.</p>
	</div>

</body>
</html>