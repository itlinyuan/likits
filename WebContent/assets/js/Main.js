/*
author:linjie
modified date : 2016/1/4
*/
var Main = {

	pass: function() {
		$('#login_button').bind('click', function() {
			var user = $(this).siblings('#login_mail').val();
			var pass = $(this).siblings('#login_pass').val();
			XPASS.signin(user, pass);
		});

		$('#regi_button').bind('click', function() {
			var user = $(this).siblings('#regi_mail').val();
			var pass = $(this).siblings('#regi_pass').val();
			XPASS.signup(user, pass);
		});
	},

	hoverAndShow: function(links, contents) {
		var current = 0,
			left = '0';
		$('.tab_cons').css('height', $('.tab_con').height()+30); /* 设置高度 */

		var isRegi = Main.getUrlParam('pass');
		if (isRegi == 'regi') {
			$(links).eq(current).removeClass('active');
			$(contents).eq(0).removeClass('active');
			$(links).eq(1).addClass('active');
			$(contents).eq(1).addClass('active');
			$('.color-layer').css('left', '50%');
			current = 1;
			left = '50%';
			$('.tab_cons').css('height', $('.tab_con').eq(1).height()+30); /* 设置高度 */
		}


		$(links).each(function(idx, link) {
			$(this).hover(function() {
				if (idx != current) {
					$(links).eq(current).removeClass('active');
					$(contents).eq(current).removeClass('active');
					$(this).addClass('active');
					$(contents).eq(idx).addClass('active');
					$('.tab_cons').css('height', $('.tab_con.active').height());
					if (left == '0') {
						left = '50%';
					} else {
						left = '0'
					}
					$('.color-layer').css('left', left);
					current = idx;
				}
			})
		});


	},

	search_form: function() {
		var $form = $('.top-search-form'),
			$input = $('.top-search-input'),
			$choice_con = $('.search_choices'),
			$choice = $('.search_choice'),
			$links = $('.search_choice_link'),
			$link = $('.search_link');

		var flag = 0,
			text = $link.val(),
			text_temp = '';

		$input.focus(function() {
			$form.addClass('active');
			flag = 1; /* 如果光标还在 */
		});
		$input.blur(function() {
			$form.removeClass('active');
			flag = 0;
		});
		$form.hover(function() {
			$(this).addClass('active');
		}, function() {
			if (flag == 0) {
				$(this).removeClass('active');
			}
		});

		$choice_con.hover(function() {
			$choice.fadeIn();
		}, function() {
			$choice.hide();
		});

		$links.each(function(idx, link) {
			$(this).click(function() {
				text_temp = $(this).html();
				$link.val(text_temp); /* 替换文字 */
				$(this).html(text);
				text = text_temp;
			})
		});

	},

	slide: function(content) {

		var current = 0,
			$dots = $(content).find('.tab_dot'),
			$slide = $(content).find('.slide'),
			length = $dots.length;

		$dots.each(function(idx, link) {
			$(link).bind('click', function() {
				if (idx != current) {
					$dots.eq(current).removeClass('tab_on');
					$dots.eq(idx).addClass('tab_on');
					$slide.eq(current).removeClass('slide_on');
					$slide.eq(idx).addClass('slide_on');
					current = idx;
				}
			})
		});

		window.setInterval(function() { /* 轮播 */
			$dots.eq(current).removeClass('tab_on');
			$slide.eq(current).removeClass('slide_on');

			if (current == length - 1) {
				current = 0;
				$dots.eq(0).addClass('tab_on');
				$slide.eq(0).addClass('slide_on');
			} else {
				current = current + 1;
				$dots.eq(current).addClass('tab_on');
				$slide.eq(current).addClass('slide_on');
			}

		}, 8000);
	},

	top: function() {
		var $w = $(window),
			maxScrollTop = $w.height() / 2;

		$w.scroll(maxScrollTop, function() {
			var $me = $(this);
			if ($me.scrollTop() < maxScrollTop) {
				$('#pagetop').fadeOut();
			} else {
				$('#pagetop').fadeIn();
			}
		});
		$('#pagetop a').click(function() {
			var speed = 700;
			var href = $(this).attr("href");
			if (href != '#next' && href != '#prev') {
				var target = $(href == "#" || href == "" ? 'html' : href);
				var position = target.offset().top;
				$('body').animate({
					scrollTop: position
				}, speed, 'swing');
				return false;
			}
		});
		$('#pagetop a').mousemove(function() {
			$(this).stop(true, true).fadeTo(300, 0.7);
		});
		$('#pagetop a').mouseout(function() {
			$(this).fadeTo(200, 1);
		})
	},

	showTips: function() {
		var top, left,
			$tips = $('.tips');
		$('.regi_other_link a').hover(function() {
			top = $(this).offset().top + 25;
			left = $(this).offset().left + 10;
			// console.log(top, left);
			$tips.css({
				'top': top,
				'left': left
			});
			$tips.fadeIn();
		}, function() {
			$tips.fadeOut();
		});
	},

	getUrlParam: function(name) {
		//构造一个含有目标参数的正则表达式对象  
		var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
		//匹配目标参数  
		var r = window.location.search.substr(1).match(reg);
		//返回参数值  
		if (r != null) return unescape(r[2]);
		return null;
	}

};