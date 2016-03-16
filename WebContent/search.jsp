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
	<link rel="stylesheet" type="text/css" href="assets/css/reset.css" />
	<link rel="stylesheet" type="text/css" href="assets/css/search.css" />
	
</head>
<body id="no_login" class="inside">
	<div class="nav_container">
		<div class="nav clearfix">
			<!-- logo -->
			<a class="top_logo" href="index.jsp">
				<img src="assets/images/logo.png" alt="">
			</a>
			<!-- message -->
			<div class="top_mess">
				<a href="#">消息</a>
			</div>
			<!-- 个人 -->
			<div class="top_profile">
				<a href="#" class="top_profile_link">周周周周煜瑶</a>
				<ul class="top_choice">
					<li><a href="#">个人主页</a></li>
					<li><a href="#">设置</a></li>
					<li><a href="#">退出</a></li>
				</ul>
			</div>
			<div class="top_pass">
				<a href="pass.jsp">登录</a>
				<span class="line"></span>
				<a href="pass.jsp?pass=regi" class="top_pass_regi">注册</a>
			</div>
			<!-- 搜素 -->
			<div class="top_search">
				<form method="GET" action="#" class="top-search-form">
					<input type="text" class="top-search-input" name="q" autocomplete="off" value="" placeholder="搜索" />
					
					<!-- 下拉框 -->
					<div class="search_choices">
						<input type="text" class="search_link" value="首页" />
						<ul class="search_choice">
							<li><a class="search_choice_link" href="javascript:;">展示区</a></li>
							<li><a class="search_choice_link" href="javascript:;">讨论区</a></li>
						</ul>
					</div>
					
					<!-- submit -->
					<button type="submit" class="top-search-button">
					</button>
				</form>
			</div>
			<!-- 导航栏菜单 -->
			<div class="top_nav">
				<ul class="clearfix">
					<li class="top_menu">
						<a class="top_menu_link" href="index.html">首页</a>
						<ul class="top_choice index">
							<li><a href="#">球队队服</a></li>
							<li><a href="#">足球品牌</a></li>
							<li><a href="#">足球战靴</a></li>
							<li><a href="#">其他品牌</a></li>
						</ul>
					</li>
					<li class="top_menu">
						<a class="top_menu_link" href="#">展示区</a>
						<ul class="top_choice">
							<li><a href="#">广场</a></li>
							<li><a href="#">我的关注</a></li>
						</ul>
					</li>
					<li class="top_menu">
						<a class="top_menu_link" href="#">讨论区</a>
						<ul class="top_choice">
							<li><a href="#">广场</a></li>
							<li><a href="#">我的关注</a></li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<div class="bg">
		<!-- 内容体 -->
		<div class="bg_con">
			<div class="content">
				<div class="search_input">
					<form action="javascript:;" class="search_form">
						<input type="text" class="search_form_text" name="search_text" autocomplete="off" placeholder="搜索" />
						<input type="submit" class="search_form_button" value="搜  索" />
					</form>
				</div>
				<div class="search_con">
					<div class="search_navs">
						<ul class="clearfix">
							<li class="search_nav current"><a href="#">首页</a></li>
							<li class="search_nav"><a href="#">展示区</a></li>
							<li class="search_nav"><a href="#">讨论区</a></li>
						</ul>
					</div>
					<div class="search_content">
						<div class="clearfix">
							<div class="search_left fl">
								<h1 class="search_title">相关内容</h1>
								<div class="news_cons">
									<div class="news_con clearfix">
										<a href="#">
											<div class="news_img fl">
												<img src="assets/images/1.jpg">
											</div>
											<div class="news_detail fr">
												<h1 class="news_title">就是那么man</h1>
												<p>阿迪达斯发布了2016阿根廷足协官方用球Argentum。本款足球通体缀以阿根廷国旗的蓝色，配有阿根廷足协的标志...</p>
												<h2 class="news_date">2016-1-25</h2>
											</div>
										</a>
									</div>
									<div class="news_con clearfix">
										<a href="#">
											<div class="news_img fl">
												<img src="assets/images/1.jpg">
											</div>
											<div class="news_detail fr">
												<h1 class="news_title">就是那么man</h1>
												<p>阿迪达斯发布了2016阿根廷足协官方用球Argentum。本款足球通体缀以阿根廷国旗的蓝色，配有阿根廷足协的标志...</p>
												<h2 class="news_date">2016-1-25</h2>
											</div>
										</a>
									</div>
									<div class="news_con clearfix">
										<a href="#">
											<div class="news_img fl">
												<img src="assets/images/1.jpg">
											</div>
											<div class="news_detail fr">
												<h1 class="news_title">就是那么man</h1>
												<p>阿迪达斯发布了2016阿根廷足协官方用球Argentum。本款足球通体缀以阿根廷国旗的蓝色，配有阿根廷足协的标志...</p>
												<h2 class="news_date">2016-1-25</h2>
											</div>
										</a>
									</div>
									<div class="news_con clearfix">
										<a href="#">
											<div class="news_img fl">
												<img src="assets/images/1.jpg">
											</div>
											<div class="news_detail fr">
												<h1 class="news_title">就是那么man</h1>
												<p>阿迪达斯发布了2016阿根廷足协官方用球Argentum。本款足球通体缀以阿根廷国旗的蓝色，配有阿根廷足协的标志...</p>
												<h2 class="news_date">2016-1-25</h2>
											</div>
										</a>
									</div>
									<div class="news_con clearfix">
										<a href="#">
											<div class="news_img fl">
												<img src="assets/images/1.jpg">
											</div>
											<div class="news_detail fr">
												<h1 class="news_title">就是那么man</h1>
												<p>阿迪达斯发布了2016阿根廷足协官方用球Argentum。本款足球通体缀以阿根廷国旗的蓝色，配有阿根廷足协的标志...</p>
												<h2 class="news_date">2016-1-25</h2>
											</div>
										</a>
									</div>
									
									<div class="news_con clearfix">
										<a href="#">
											<div class="news_img fl">
												<img src="assets/images/1.jpg">
											</div>
											<div class="news_detail fr">
												<h1 class="news_title">就是那么man</h1>
												<p>阿迪达斯发布了2016阿根廷足协官方用球Argentum。本款足球通体缀以阿根廷国旗的蓝色，配有阿根廷足协的标志...</p>
												<h2 class="news_date">2016-1-25</h2>
											</div>
										</a>
									</div>
									<div class="news_con clearfix">
										<a href="#">
											<div class="news_img fl">
												<img src="assets/images/1.jpg">
											</div>
											<div class="news_detail fr">
												<h1 class="news_title">就是那么man</h1>
												<p>阿迪达斯发布了2016阿根廷足协官方用球Argentum。本款足球通体缀以阿根廷国旗的蓝色，配有阿根廷足协的标志...</p>
												<h2 class="news_date">2016-1-25</h2>
											</div>
										</a>
									</div>
								</div>
							</div>
							<div class="search_right fl">
								<div class="layer">
									<div class="clearfix">
										<h1 class="search_title fl">相关用户</h1>
										<a class="search_more fr" href="#">更多<img src="assets/images/more.png" alt="click more"></a>
									</div>
									<div class="search_users">
										<div class="search_user clearfix">
											<a href="#">
												<div class="user_img fl">
													<img src="assets/images/img2/img1.jpg" alt="">
												</div>
												<div class="user_detail fl">
													<h2 class="username">周一要</h2>
													<p>今天，看了一场球赛...</p>
												</div>
											</a>
										</div>
										<div class="search_user clearfix">
											<a href="#">
												<div class="user_img fl">
													<img src="assets/images/img2/img2.jpg" alt="">
												</div>
												<div class="user_detail fl">
													<h2 class="username">周一要</h2>
													<p>今天，看了一场球赛...</p>
												</div>
											</a>
										</div>
										<div class="search_user clearfix">
											<a href="#">
												<div class="user_img fl">
													<img src="assets/images/img2/img3.jpg" alt="">
												</div>
												<div class="user_detail fl">
													<h2 class="username">周一要</h2>
													<p>今天，看了一场球赛...</p>
												</div>
											</a>
										</div>
										<div class="search_user clearfix">
											<a href="#">
												<div class="user_img fl">
													<img src="assets/images/img2/img4.jpg" alt="">
												</div>
												<div class="user_detail fl">
													<h2 class="username">周一要</h2>
													<p>今天，看了一场球赛...</p>
												</div>
											</a>
										</div>
										<div class="search_user clearfix">
											<a href="#">
												<div class="user_img fl">
													<img src="assets/images/img2/img5.jpg" alt="">
												</div>
												<div class="user_detail fl">
													<h2 class="username">周一要</h2>
													<p>今天，看了一场球赛...</p>
												</div>
											</a>
										</div>
									</div>
								</div>
								<div class="layer">
									<h1 class="search_title">推荐内容</h1>
									<div class="search_users">
										<div class="search_user clearfix">
											<a href="#">
												<div class="user_img fl">
													<img src="assets/images/img2/img1.jpg" alt="">
												</div>
												<div class="user_detail fl">
													<h2 class="username">梅西来中国啦</h2>
													<p>在北京我和科比打了一场...</p>
												</div>
											</a>
										</div>
										<div class="search_user clearfix">
											<a href="#">
												<div class="user_img fl">
													<img src="assets/images/img2/img2.jpg" alt="">
												</div>
												<div class="user_detail fl">
													<h2 class="username">梅西来中国啦</h2>
													<p>在北京我和科比打了一场...</p>
												</div>
											</a>
										</div>
										<div class="search_user clearfix">
											<a href="#">
												<div class="user_img fl">
													<img src="assets/images/img2/img3.jpg" alt="">
												</div>
												<div class="user_detail fl">
													<h2 class="username">梅西来中国啦</h2>
													<p>在北京我和科比打了一场...</p>
												</div>
											</a>
										</div>
										<div class="search_user clearfix">
											<a href="#">
												<div class="user_img fl">
													<img src="assets/images/img2/img4.jpg" alt="">
												</div>
												<div class="user_detail fl">
													<h2 class="username">梅西来中国啦</h2>
													<p>在北京我和科比打了一场...</p>
												</div>
											</a>
										</div>
										<div class="search_user clearfix">
											<a href="#">
												<div class="user_img fl">
													<img src="assets/images/img2/img5.jpg" alt="">
												</div>
												<div class="user_detail fl">
													<h2 class="username">梅西来中国啦</h2>
													<p>在北京我和科比打了一场...</p>
												</div>
											</a>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="paging">
							<a href="#" class="first_page">首页</a>
							<a href="#" class="page_num current">1</a>
							<a href="#" class="page_num">2</a>
							<a href="#" class="page_num">3</a>
							<a href="#" class="page_num">4</a>
							<span>...</span>
							<a href="#" class="page_num">99</a>
							<a href="#" class="page_num">100</a>
							<a href="#" class="prev_page"><img src="assets/images/prev.png"></a>
							<a href="#" class="next_page"><img src="assets/images/next.png"></a>
							<a href="#" class="last_page">尾页</a>
						</div>
					</div>

				</div>
				
			</div>
		</div>
	</div>
	<!-- 底部 -->
	<div class="footer">
		<div class="links">
			<a href="#">网站声明</a>
			<a href="#">联系我们</a>
			<a href="#">免责条款</a>
			<a href="#">隐私政策</a>
			<a href="#">广告服务</a>
		</div>
		<div class="copying">
			<span>
				Copying@2016       绿壳网
			</span>
		</div>
	</div>
	<!-- 回到顶部 -->
	<div id="pagetop">
		<a href="#">Page Top</a>
	</div>

	<script type="text/javascript" src="assets/js/jquery-2.1.0.min.js"></script>
	<script type="text/javascript" src="assets/js/Main.js"></script>
	<script type="text/javascript" src="http://120.27.96.114:8080/likits/assets/js/pass.js"></script>
	<script src="assets/js/search.js"></script>

</body>
</html>

