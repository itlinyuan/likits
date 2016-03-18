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
	<link rel="stylesheet" type="text/css" href="assets/css/index.css" />
	
</head>
<body id="no_login">
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
			<!-- 搜索 -->
			<div class="top_search">
				<form method="GET" action="search.jsp" class="top-search-form">
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
					<li class="top_menu current">
						<a class="top_menu_link" href="index.jsp">首页</a>
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
		<div class="bg_slides">
			<!-- 轮播 -->
			<div class="slides" id="slide">
				<ul>
					<input type="radio" name="radio-btn" class="radio-btn" id="img-1" checked />
					<li class="slide_container">
						<div class="slide slide_on">
							<img src="assets/images/slide1.jpg" />
						</div>
					</li>
					<input type="radio" name="radio-btn" class="radio-btn" id="img-2"  />
					<li class="slide_container">
						<div class="slide">
							<img src="assets/images/slide1.jpg" />
						</div>
					</li>
				</ul>
				<div class="tab_dots">
					<label class="tab_dot tab_on" for="img-1" id="img-dot-1"></label>
					<label class="tab_dot" for="img-2" id="img-dot-2"></label>
				</div>
			</div>
			<!-- 中间登录注册 -->
			<div class="bg_center">
				<div class="slogan">
					<img class="slogan_1" src="assets/images/slogan_1.png" />
					<img class="slogan_2" src="assets/images/slogan_2.png" />
				</div>
				<div class="regi_login">
					<div class="tab_links">
						<a class="active" href="">注册</a>
						<a href="">登录</a>
					</div>
					<div class="tab_cons clearfix">
						<div class="tab_con tab_con_1 clearfix active">
							<div class="regi_form">
								<form action="javascript:;" id="regi_form">
									<input type="text" name="email" id="regi_mail"  autocomplete="off" placeholder="常用邮箱" />
									<input type="password" name="password" id="regi_pass" autocomplete="off" placeholder="设置密码" />
									<input type="submit" class="regi_form_button" id="regi_button" value="注 册" />
								</form>
							</div>
							<div class="regi_other">
								<p>其他账号注册</p>
								<div class="regi_other_link">
									<a href="javascript:;"><img src="assets/images/qq.png"></a>
									<a href="javascript:;"><img src="assets/images/wechat.png"></a>
									<a href="javascript:;"><img src="assets/images/weibo.png"></a>
								</div>
							</div>
						</div>
						<div class="tab_con tab_con_2 clearfix">
							<div class="regi_form">
								<form action="javascript:;" id="login_form">
									<input type="text" name="email" id="login_mail" autocomplete="off" placeholder="邮箱" />
									<input type="password" name="password" id="login_pass" autocomplete="off" placeholder="密码" />
									<input type="submit" class="regi_form_button" id="login_button" value="登 录" />
								</form>
							</div>
							<div class="regi_other">
								<p>其他账号登录</p>
								<div class="regi_other_link">
									<a href="javascript:;"><img src="assets/images/qq.png"></a>
									<a href="javascript:;"><img src="assets/images/wechat.png"></a>
									<a href="javascript:;"><img src="assets/images/weibo.png"></a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 内容体 -->
		<div class="bg_con">
			<div class="content">
				<div class="clearfix">
					<div class="news_con">
						<a href="#">
							<div class="news_img">
								<img class="" src="assets/images/img1/img_1.jpg">
							</div>
							<h1 class="news_title">我们是第一</h1>
							<h2 class="news_date">2015-12-25</h2>
							<p>
								<span class="news_watch">11</span>
								<span class="news_like">20</span>
							</p>
							<span class="news_tag tag_article">文章</span>
						</a>
					</div>
					<div class="news_con">
						<a href="#">
							<div class="news_img">
								<img src="assets/images/img1/img_2.jpg">
							</div>
							<h1 class="news_title">你猜他们看什么</h1>
							<h2 class="news_date">2015-12-21</h2>
							<p>
								<span class="news_watch">11</span>
								<span class="news_like">20</span>
							</p>
							<span class="news_tag tag_article">资讯</span>
						</a>
					</div>
					<div class="news_con">
						<a href="#">
							<div class="news_img">
								<img src="assets/images/img1/img_3.jpg">
							</div>
							<h1 class="news_title">这个足球场超级大</h1>
							<h2 class="news_date">2015-12-25</h2>
							<p>
								<span class="news_watch">11</span>
								<span class="news_like">20</span>
							</p>
							<span class="news_tag tag_news">资讯</span>
						</a>
					</div>
					<div class="news_con">
						<a href="#">
							<div class="news_img">
								<img src="assets/images/img1/img_4.jpg">
							</div>
							<h1 class="news_title">我们是第一</h1>
							<h2 class="news_date">2015-12-25</h2>
							<p>
								<span class="news_watch">11</span>
								<span class="news_like">20</span>
							</p>
							<span class="news_tag tag_article">文章</span>
						</a>
					</div>
					<div class="news_con">
						<a href="#">
							<div class="news_img">
								<img src="assets/images/img1/img_5.jpg">
							</div>
							<h1 class="news_title">我们是第一</h1>
							<h2 class="news_date">2015-12-25</h2>
							<p>
								<span class="news_watch">11</span>
								<span class="news_like">20</span>
							</p>
							<span class="news_tag tag_video">视频</span>
						</a>
					</div>
					<div class="news_con">
						<a href="#">
							<div class="news_img">
								<img src="assets/images/img1/img_6.jpg">
							</div>
							<h1 class="news_title">我们是第一</h1>
							<h2 class="news_date">2015-12-25</h2>
							<p>
								<span class="news_watch">11</span>
								<span class="news_like">20</span>
							</p>
							<span class="news_tag tag_article">文章</span>
						</a>
					</div>
					<div class="news_con">
						<a href="#">
							<div class="news_img">
								<img src="assets/images/img1/img_7.jpg">
							</div>
							<h1 class="news_title">这个足球场超级大</h1>
							<h2 class="news_date">2015-12-25</h2>
							<p>
								<span class="news_watch">11</span>
								<span class="news_like">20</span>
							</p>
							<span class="news_tag tag_article">文章</span>
						</a>
					</div>
					<div class="news_con">
						<a href="#">
							<div class="news_img">
								<img src="assets/images/img1/img_8.jpg">
							</div>
							<h1 class="news_title">我们是第一</h1>
							<h2 class="news_date">2015-12-25</h2>
							<p>
								<span class="news_watch">11</span>
								<span class="news_like">20</span>
							</p>
							<span class="news_tag tag_article">文章</span>
						</a>
					</div>					
					<div class="news_con">
						<a href="#">
							<div class="news_img">
								<img src="assets/images/img1/img_9.jpg">
							</div>
							<h1 class="news_title">我们是第一</h1>
							<h2 class="news_date">2015-12-25</h2>
							<p>
								<span class="news_watch">11</span>
								<span class="news_like">20</span>
							</p>
							<span class="news_tag tag_article">文章</span>
						</a>
					</div>
					<div class="news_con">
						<a href="#">
							<div class="news_img">
								<img src="assets/images/img1/img_10.jpg">
							</div>
							<h1 class="news_title">我们是第一</h1>
							<h2 class="news_date">2015-12-25</h2>
							<p>
								<span class="news_watch">11</span>
								<span class="news_like">20</span>
							</p>
							<span class="news_tag tag_article">文章</span>
						</a>
					</div>
					<div class="news_con">
						<a href="#">
							<div class="news_img">
								<img src="assets/images/img1/img_11.jpg">
							</div>
							<h1 class="news_title">我们是第一</h1>
							<h2 class="news_date">2015-12-25</h2>
							<p>
								<span class="news_watch">11</span>
								<span class="news_like">20</span>
							</p>
							<span class="news_tag tag_news">资讯</span>
						</a>
					</div>
					<div class="news_con">
						<a href="#">
							<div class="news_img">
								<img src="assets/images/img1/img_12.jpg">
							</div>
							<h1 class="news_title">就是这么man</h1>
							<h2 class="news_date">2015-12-25</h2>
							<p>
								<span class="news_watch">11</span>
								<span class="news_like">20</span>
							</p>
							<span class="news_tag tag_article">文章</span>
						</a>
					</div>
					<div class="news_con">
						<a href="#">
							<div class="news_img">
								<img src="assets/images/img1/img_13.jpg">
							</div>
							<h1 class="news_title">我们是第一</h1>
							<h2 class="news_date">2015-12-25</h2>
							<p>
								<span class="news_watch">11</span>
								<span class="news_like">20</span>
							</p>
							<span class="news_tag tag_video">视频</span>
						</a>
					</div>
					<div class="news_con">
						<a href="#">
							<div class="news_img">
								<img src="assets/images/img1/img_14.jpg">
							</div>
							<h1 class="news_title">我们是第一</h1>
							<h2 class="news_date">2015-12-25</h2>
							<p>
								<span class="news_watch">11</span>
								<span class="news_like">20</span>
							</p>
							<span class="news_tag tag_article">文章</span>
						</a>
					</div>
					<div class="news_con">
						<a href="#">
							<div class="news_img">
								<img src="assets/images/img1/img_15.jpg">
							</div>
							<h1 class="news_title">我们是第一</h1>
							<h2 class="news_date">2015-12-25</h2>
							<p>
								<span class="news_watch">11</span>
								<span class="news_like">20</span>
							</p>
							<span class="news_tag tag_article">文章</span>
						</a>
					</div>
					<div class="news_con">
						<a href="#">
							<div class="news_img">
								<img src="assets/images/img1/img_16.jpg">
							</div>
							<h1 class="news_title">我们是第一</h1>
							<h2 class="news_date">2015-12-25</h2>
							<p>
								<span class="news_watch">11</span>
								<span class="news_like">20</span>
							</p>
							<span class="news_tag tag_article">文章</span>
						</a>
					</div>
					<div class="news_con">
						<a href="#">
							<div class="news_img">
								<img src="assets/images/img1/img_17.jpg">
							</div>
							<h1 class="news_title">我们是第一</h1>
							<h2 class="news_date">2015-12-25</h2>
							<p>
								<span class="news_watch">11</span>
								<span class="news_like">20</span>
							</p>
							<span class="news_tag tag_article">文章</span>
						</a>
					</div>
					<div class="news_con">
						<a href="#">
							<div class="news_img">
								<img src="assets/images/img1/img_18.jpg">
							</div>
							<h1 class="news_title">我们是第一</h1>
							<h2 class="news_date">2015-12-25</h2>
							<p>
								<span class="news_watch">11</span>
								<span class="news_like">20</span>
							</p>
							<span class="news_tag tag_article">文章</span>
						</a>
					</div>
					<div class="news_con">
						<a href="#">
							<div class="news_img">
								<img src="assets/images/img1/img_19.jpg">
							</div>
							<h1 class="news_title">我们是第一</h1>
							<h2 class="news_date">2015-12-25</h2>
							<p>
								<span class="news_watch">11</span>
								<span class="news_like">20</span>
							</p>
							<span class="news_tag tag_article">文章</span>
						</a>
					</div>
					<div class="news_con">
						<a href="#">
							<div class="news_img">
								<img src="assets/images/img1/img_20.jpg">
							</div>
							<h1 class="news_title">我们是第一</h1>
							<h2 class="news_date">2015-12-25</h2>
							<p>
								<span class="news_watch">11</span>
								<span class="news_like">20</span>
							</p>
							<span class="news_tag tag_article">文章</span>
						</a>
					</div>
					<div class="news_con">
						<a href="#">
							<div class="news_img">
								<img src="assets/images/img1/img_21.jpg">
							</div>
							<h1 class="news_title">我们是第一</h1>
							<h2 class="news_date">2015-12-25</h2>
							<p>
								<span class="news_watch">11</span>
								<span class="news_like">20</span>
							</p>
							<span class="news_tag tag_article">文章</span>
						</a>
					</div>
					<div class="news_con">
						<a href="#">
							<div class="news_img">
								<img src="assets/images/img1/img_22.jpg">
							</div>
							<h1 class="news_title">我们是第一</h1>
							<h2 class="news_date">2015-12-25</h2>
							<p>
								<span class="news_watch">11</span>
								<span class="news_like">20</span>
							</p>
							<span class="news_tag tag_article">文章</span>
						</a>
					</div>
					<div class="news_con">
						<a href="#">
							<div class="news_img">
								<img src="assets/images/img1/img_23.jpg">
							</div>
							<h1 class="news_title">我们是第一</h1>
							<h2 class="news_date">2015-12-25</h2>
							<p>
								<span class="news_watch">11</span>
								<span class="news_like">20</span>
							</p>
							<span class="news_tag tag_article">文章</span>
						</a>
					</div>
					<div class="news_con">
						<a href="#">
							<div class="news_img">
								<img src="assets/images/img1/img_24.jpg">
							</div>
							<h1 class="news_title">我们是第一</h1>
							<h2 class="news_date">2015-12-25</h2>
							<p>
								<span class="news_watch">11</span>
								<span class="news_like">20</span>
							</p>
							<span class="news_tag tag_article">文章</span>
						</a>
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
	<div class="tips">
		<span>暂不支持此功能</span>
	</div>

	<script type="text/javascript" src="assets/js/jquery-2.1.0.min.js"></script>
	<script type="text/javascript" src="assets/js/Main.js"></script>
	<script type="text/javascript" src="assets/js/pass.js"></script>
	<script src="assets/js/index.js"></script>

</body>
</html>

