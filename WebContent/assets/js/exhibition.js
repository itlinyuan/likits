/*
author:linjie
modified date : 2016/1/4
*/

$(function() {
	Main.search_form(); /* 搜索框 */
	Main.top(); /* 回到顶部 */
	Main.showTips();
	Main.pass();
	$('#js_scroll1').jScrollPane();
	$('#js_scroll2').jScrollPane();

	var ex_form = {
		init: function() {
			this.file_preview();
			this.keyup_count('.file_text', 200);
			this.keyup_count('.ex_text', 1000);
			this.pop();
		},
		file_preview: function() {

			$('.file_preview').change(function(e) {
				var that = $(this).parent('.input_file');

				if (window.FileReader) {
					var file = e.target.files[0];
					var reader = new FileReader();
					if (file && file.type.match('image.*')) {
						reader.readAsDataURL(file);
						reader.onloadend = function(e) {
							$("<img title='点击更换图片' src='" + reader.result + "'/>").appendTo(that);
							$('.input_file img').click(function() {
								$('.file_preview').trigger('click');
							})
						}
					} else if (file) {
						alert('不是image格式');
					}
				}
			});
		},
		keyup_count: function(text, count) {
			$(text).keyup(function() {
				var len = $(this).val().length;
				$(this).siblings('.text_count').children('span').html(len);

				if (len > 0) {
					$(this).siblings('.file_desc').hide();
				} else {
					$(this).siblings('.file_desc').fadeIn();

				}
			});
		},
		pop: function() {
			$('.pop_link').click(function() {
				$('.pop_outer').fadeIn();
				$('.pop_form').addClass('active');
				$('.cancer').click(function() {
					$('.pop_outer').fadeOut();
					$('.pop_form').removeClass('active');
				})
			})
		}
	};

	ex_form.init();
});