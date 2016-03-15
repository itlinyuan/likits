/*
author:linjie
modified date : 2016/1/4
*/

$(function() {
	page_init();
	Main.search_form(); /* 搜索框 */
	Main.top(); /* 回到顶部 */
	Main.showTips();
	Main.pass();

	function page_init() {
		$('.search_form_text').focus(function(){
			$('.search_form').addClass('active');
		});
		$('.search_form_text').blur(function(){
			$('.search_form').removeClass('active');
		});
	}
});