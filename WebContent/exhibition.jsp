<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="description" content="" />
	<meta name="keywords" content="" />
	<link rel="shortcut icon" type="/image/ico" href="assets/images/icon.png">
	<link rel="stylesheet" type="text/css" href="assets/css/reset.css" />
	<link rel="stylesheet" type="text/css" href="assets/css/exhibition.css" />
	
<title>展示区</title>
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
						<a class="top_menu_link" href="index.jsp">首页</a>
						<ul class="top_choice index">
							<li><a href="#">球队队服</a></li>
							<li><a href="#">足球品牌</a></li>
							<li><a href="#">足球战靴</a></li>
							<li><a href="#">其他品牌</a></li>
						</ul>
					</li>
					<li class="top_menu current">
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
				<div class="clearfix">
					<div class="search_left fl">
						<div class="ex_nav clearfix">
							<a href="" class="current fl">广场</a>
							<a href="" class="fl">我的关注</a>
							<a href="javascript:;" class="pop_link fr">发布内容</a>
						</div>
						<div class="ex_tabs">
							<div class="ex_tab">
								<div class="news_cons">
									<c:forEach var="articleInfo" items="${ articles }">
									<div class="news_con ex_con clearfix" data-id="${ articleInfo.newsId }">
										<a href="#">
											<div class="news_img fl">
												<img src="${ articleInfo.newsImage }">
											</div>
											<div class="news_detail fl">
												<h1 class="news_title">${ articleInfo.newsTitle }</h1>
												<p class="news_desc">${ articleInfo.newsDesc }</p>
												<p>
													<img src="${ articleInfo.newsUserAvatar }" />
													<span class="news_user">${ articleInfo.newsUser }</span>
													<span class="news_watch">${ articleInfo.newsWatch }</span>
													<span class="news_like">${ articleInfo.newsLike }</span>
													<span class="news_date fr">${ articleInfo.newsDate }</span>
												</p>
											</div>
										</a>
									</div>
									</c:forEach>
								</div>
							</div>
						</div>
					</div>
					<div class="search_right fl">
						<div class="layer">
							<div class="clearfix">
								<h1 class="search_title fl">相关用户</h1>
								<a class="search_more fr" href="#">更多<img src="assets/images/more.png" alt="click more"></a>
							</div>
							<div class="search_users search_users2">
								<c:forEach var="recommendUser" items="${ recommendUsers }">
								<div class="search_user clearfix">
									<a href="#">
										<div class="user_img fl">
											<img src="${ recommendUser.userAvatar }" alt="">
										</div>
										<div class="user_detail fl">
											<h2 class="username">${ recommendUser.userName }</h2>
											<p>${ recommendUser.userSignature }</p>
										</div>
									</a>
								</div>
								</c:forEach>
							</div>
						</div>
						<div class="layer">
							<h1 class="search_title">推荐内容</h1>
							<div class="search_users">
								<c:forEach var="recommendArticle" items="${ recommendArticles }">
								<div class="search_user clearfix">
									<a href="#">
										<div class="user_img fl">
											<img src="${ recommendArticle.newsImage }" alt="" width="53" height="52">
										</div>
										<div class="user_detail fl">
											<h2 class="username">${ recommendArticle.newsTitle }</h2>
											<p>${ recommendArticle.newsDesc }</p>
										</div>
									</a>
								</div>
								</c:forEach>
							</div>
						</div>
						<img src="assets/images/tuijian1.jpg" alt="">
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
				<div class="form_exhi">
					<form>
						<div class="input_title">
							<input type="text" placeholder="标题" />
						</div>
						<div class="input_tag">
							标签：<span>展示</span>
						</div>
						<div class="input_area">
							<div id="js_scroll1">
								<div class="input_files">
									<div class="input_file">
										<label for="file1"></label>
										<input type="file" class="file_preview" id="file1" />
										<textarea class="file_text" ></textarea>
										<span class="file_desc">添加对照片的描述...</span>
										<span class="text_count"><span>0</span>/200</span>
									</div>
									<div class="input_file">
										<label for="file2"></label>
										<input type="file" class="file_preview" id="file2" />
										<textarea class="file_text" ></textarea>
										<span class="file_desc">添加对照片的描述...</span>
										<span class="text_count"><span>0</span>/200</span>
									</div>
									<div class="input_file">
										<label for="file2"></label>
										<input type="file" class="file_preview" id="file2" />
										<textarea class="file_text" ></textarea>
										<span class="file_desc">添加对照片的描述...</span>
										<span class="text_count"><span>0</span>/200</span>
									</div>
								</div>
							</div>
							
							<div class="input_text">
								<textarea class="ex_text"></textarea>
								<span class="file_desc">把你想要说的写在这里......</span>
								<span class="text_count"><span>0</span>/1000</span>
							</div>
						</div>
						<div class="input_submit">
							<input type="checkbox" class="is_apply" id="is_apply" />
							<label class="input_apply" for="is_apply"><span></span>申请上广场</label>
							<input class="submit" type="submit" value="发表" />
						</div>
					</form>
				</div>
				
			</div>
		</div>
	</div>
	<div class="pop_outer"></div>
	<div class="pop_form">
		<div class="form_exhi">
			<form>
				<div class="input_title">
					<input type="text" placeholder="标题" />
				</div>
				<div class="input_tag">
					标签：<span>展示</span>
				</div>
				<div class="input_area">
					<div id="js_scroll2">
						<div class="input_files clearfix">
							<div class="input_file">
								<label for="file1"></label>
								<input type="file" class="file_preview" id="file1" />
								<textarea class="file_text" ></textarea>
								<span class="file_desc">添加对照片的描述...</span>
								<span class="text_count"><span>0</span>/200</span>
							</div>
							<div class="input_file">
								<label for="file2"></label>
								<input type="file" class="file_preview" id="file2" />
								<textarea class="file_text" ></textarea>
								<span class="file_desc">添加对照片的描述...</span>
								<span class="text_count"><span>0</span>/200</span>
							</div>
							<div class="input_file">
								<label for="file2"></label>
								<input type="file" class="file_preview" id="file2" />
								<textarea class="file_text" ></textarea>
								<span class="file_desc">添加对照片的描述...</span>
								<span class="text_count"><span>0</span>/200</span>
							</div>
							<div class="input_file">
								<label for="file2"></label>
								<input type="file" class="file_preview" id="file2" />
								<textarea class="file_text" ></textarea>
								<span class="file_desc">添加对照片的描述...</span>
								<span class="text_count"><span>0</span>/200</span>
							</div>
						</div>
					</div>
					<div class="input_text">
						<textarea class="ex_text"></textarea>
						<span class="file_desc">把你想要说的写在这里......</span>
						<span class="text_count"><span>0</span>/1000</span>
					</div>
				</div>
				<div class="input_submit">
					<div class="layer">
						<input type="checkbox" class="is_apply" id="is_apply_2" />
						<label class="input_apply" for="is_apply_2"><span></span>申请上广场</label>
					</div>
					<input class="submit cancer" type="reset" value="取消" />
					<input class="submit" type="submit" value="发表" />
				</div>
			</form>
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
	<script type="text/javascript" src="assets/js/jquery.jscrollpane.min.js"></script>
	<script type="text/javascript" src="assets/js/jquery.mousewheel.js"></script>
	<script type="text/javascript" src="assets/js/Main.js"></script>
	<script type="text/javascript" src="assets/js/pass.js"></script>
	<script src="assets/js/exhibition.js"></script>

</body>
</html>