/*!
 *
 * likits pass signin && signup
 * require [ jquery.js ]
 * 2016-1-28
 */

(function(w) {

	var xurl = 'http://120.27.96.114:8080/likits/',

		XPASS = {

			init: function() {
				this.rending();
			},

			rending: function() {
				var This = this;
				/*try {
					$.ajax({
						url: xurl + 'get_user_info/',
						type: 'GET',
						dataType: 'jsonp',
						jsonpCallback: 'getUserInfoCallback',
						success: function(account) {
							if (account) {
								This.u_account = account;
								if (account.length > 11) {
									account = (account.substr(0, 8)) + '...';
								}
							}
						}
					});
				} catch (e) {}*/
				console.log('xpass rending');
			},

			u_account: this.u_account || '',

			signup: function() {
				console.log($('#regi_form').serialize());
				try {
					$.ajax({
						url: xurl + 'userRegister.action',
						type: 'post',
						data: $('#regi_form').serialize(),
						dataType: 'json',
						cache: false,
						beforeSend: function() {
							console.log('before up');
						},
						success: function(data) {
							data = JSON.parse(data);
							console.log('message');
							if (data) {
								console.log(data);
							}
						},
						error: function(XMLHttpRequest, textStatus, errorThrown) {
							console.log(XMLHttpRequest, textStatus, errorThrown);
						}
					});
				} catch (e) {
					console.log(e, 'eeeee');
				}
			},

			signin: function() {
				console.log($('#login_form').serialize());
				try {
					$.ajax({
						url: xurl + 'userLogin.action',
						type: 'post',
						data: $('#login_form').serialize(),
						dataType: 'json',
						cache: false,
						beforeSend: function() {
							console.log('before in');
						},
						success: function(data) {
							data = JSON.parse(data);
							console.log('message');
							if (data) {
								console.log(data);
							}
						},
						error: function(XMLHttpRequest, textStatus, errorThrown) {
							console.log(XMLHttpRequest, textStatus, errorThrown);
						}
					});
				} catch (e) {
					console.log(e, 'eeeee');
				}
			},

			exit: function() {
				try {
					$.ajax({
						url: xurl + 'logout/',
						type: 'GET',
						dataType: 'jsonp',
						jsonpCallback: 'logoutCallback',
						success: function(result) {
							window.location.reload();
						}
					});
				} catch (e) {}
			}

		};

	XPASS.init();
	w.XPASS = XPASS;

})(window);