package com.likits.service.front.impl;

import java.util.Date;
import java.util.List;
import java.util.Properties;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message.RecipientType;
import javax.mail.MessagingException;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts2.ServletActionContext;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.web.util.WebUtils;

import com.likits.dao.front.UserDao;
import com.likits.entity.front.User;
import com.likits.model.front.MyAuthenticator;
import com.likits.model.front.UserJson;
import com.likits.service.front.UserService;
import com.likits.util.Constances;

public class UserServiceImpl implements UserService {
	public static final Log log = LogFactory.getLog(UserServiceImpl.class);

	private UserDao userDao;
	private List<User> users;

	@Override
	public UserJson register(final String senderEmail, final String senderPassword, final String sernderHost,
			String registerEmail, final String registerPassword) {
		HttpServletRequest req = ServletActionContext.getRequest();
		// 去掉两边空格
		registerEmail = registerEmail.trim();
		final String toMail = registerEmail;

		UserJson uj = new UserJson();
		if (registerEmail.equals("") || registerEmail == null) {
			uj.setStatus(0);
			uj.setTips(Constances.USERNAME_IS_EMPTY);
			return uj;
		}
		if (registerPassword.equals("") || registerPassword == null) {
			uj.setStatus(-1);
			uj.setTips(Constances.PASSWORD_IS_EMPTY);
			return uj;
		}
		if (!checkEmail(registerEmail)) {
			uj.setStatus(-2);
			uj.setTips(Constances.NOT_VAILD_EMAIL);
			return uj;
		}
		users = userDao.findByEmail(registerEmail);
		// 邮箱已被使用并且还未超过48小时验证(!=2是在邮箱验证时间过了)
		if (users.size() != 0 && users.get(0).getIsActive() != 2) {
			long nowTime = new Date().getTime();
			long createTime = users.get(0).getCreateDate().getTime();
			long betweenTime = (nowTime - createTime) / (1000 * 3600);
			// 这里是没有去邮箱进行验证，过了48小时后，这个邮箱将被作废
			if (betweenTime < 48) {
				uj.setStatus(-3);
				uj.setTips(Constances.EMAIL_IS_EXIST);
				return uj;
			}
		}

		String registerId = "" + Math.random() * Math.random();
		// 获取当前URL
		String[] URLs = (req.getRequestURL() + "").split("/");
		String currentURL = "";
		for (int i = 0; i < URLs.length - 1; i++) {
			currentURL += URLs[i] + "/";
		}
		final String url = currentURL + "userMailBack.action?registerId=" + registerId + "&registerEmail="
				+ registerEmail;// 待会用户点在邮箱中点击这个链接回到你的网站。

		// HttpSession httpSession = req.getSession();
		// httpSession.setAttribute(registerId, registerEmail);
		// // 秒数
		// httpSession.setMaxInactiveInterval(1000);
		// // httpSession.setAttribute("2", registerName);

		// 发送邮件是一件非常耗时的事情，因此这里设计一个匿名线程类来发送邮件
		new Thread(new Runnable() {

			@Override
			public void run() {
				// 设置身份验证、服务器等信息
				Properties props = new Properties();
				props.setProperty("mail.smtp.host", sernderHost);
				// props.put("mail.smtp.port", "25");
				props.setProperty("mail.smtp.auth", "true");
				// log.info(senderEmail+"++++++"+senderPassword);
				Authenticator authenticator = new MyAuthenticator(senderEmail, senderPassword);

				javax.mail.Session session = javax.mail.Session.getDefaultInstance(props, authenticator);
				session.setDebug(true);

				try {
					Address from = new InternetAddress(senderEmail);
					Address to = new InternetAddress(toMail);

					MimeMessage msg = new MimeMessage(session);
					msg.setFrom(from);
					msg.setSubject(Constances.SENDER_EMAIL_SUBJECT);
					msg.setSentDate(new Date());
					msg.setContent("恭喜您注册成功,您的密码：" + registerPassword + "<br>请点击<a href='" + url + "'>" + url
							+ "</a>完成注册,该验证码48小时内有效", "text/html;charset=utf-8");
					msg.setRecipient(RecipientType.TO, to);
					/*
					 * Transport transport = session.getTransport("smtp");
					 * transport.connect("smtp.163.com", userName, password);
					 * transport.sendMessage(msg,msg.getAllRecipients());
					 * transport.close();
					 */
					Transport.send(msg);
				} catch (MessagingException e) {
					e.printStackTrace();
				}
			}

		}).start();

		// 保存注册信息
		User user;
		if (users.size() > 0) {
			user = users.get(0);
		} else {
			user = new User();
		}
		user.setEmail(registerEmail);
		user.setUsername(registerEmail);
		String stored_hash = BCrypt.hashpw(registerPassword, BCrypt.gensalt());
		user.setPassword(stored_hash);
		// if (BCrypt.checkpw(registerPassword, stored_hash))
		// log.info("It matches");
		// else
		// log.info("It does not match");
		user.setCreateDate(new Date());
		user.setIsActive(0);// 未激活
		user.setRegisterId(registerId);// 激活码
		userDao.saveOrUpdate(user);

		uj.setStatus(1);
		uj.setTips(Constances.REGISTER_SUCCESS);

		return uj;
	}

	@Override
	public UserJson updateUserActivate(String registerId, String registerEmail) {
		users = userDao.findByEmail(registerEmail);
		UserJson uj = new UserJson();

		if (users.size() == 0) {
			// 没有该邮箱用户
			uj.setStatus(-7);
			uj.setTips(Constances.EMAIL_IS_NOT_REGISTER);
			return uj;
		}

		User user = users.get(0);
		long nowTime = new Date().getTime();
		long createTime = user.getCreateDate().getTime();
		long betweenTime = (nowTime - createTime) / (1000 * 3600);

		// 超过48小时
		if (betweenTime >= 48 && !user.getRegisterId().equals("")) {
			user.setIsActive(2);// 这种状态是超过48小时未注册
			userDao.saveOrUpdate(user);
			uj.setStatus(-4);
			uj.setTips(Constances.ACTIVATION_CODE_EXPIRED);
			return uj;
		}

		// 未激活且激活码一致
		if (user.getIsActive() == 0) {
			if (user.getRegisterId().equals(registerId)) {
				user.setIsActive(1);// 激活状态1
				user.setRegisterId("");// 激活码置为空，防止再次激活
				userDao.saveOrUpdate(user);
				uj.setStatus(2);
				uj.setTips(Constances.EMAIL_ACTIVATION_SUCCESSS);
				uj.setUsername(user.getUsername());
			} else {
				uj.setStatus(-6);
				uj.setTips(Constances.INVAILD_ACTIVATION_CODE);
			}
		} else {// 已经激活了
			uj.setStatus(-5);
			uj.setTips(Constances.RECONDITIONING);
		}

		return uj;
	}

	@Override
	public UserJson findUser(String loginEmail, String loginPassword) {
		HttpServletRequest req = ServletActionContext.getRequest();

		// 查看是否已经登录
		// if(WebUtils.getSessionAttribute(req, "currentLoginUser")!=null){
		// return (UserJson) WebUtils.getSessionAttribute(req,
		// "currentLoginUser");
		// }
		// if(req.getSession().getAttribute("currentLoginUser")!=null){
		// return (UserJson) req.getSession().getAttribute("currentLoginUser");
		// }

		users = userDao.findByEmail(loginEmail);
		UserJson uj = new UserJson();
		if (loginEmail.equals("") || loginEmail == null) {
			uj.setStatus(0);
			uj.setTips(Constances.LOGIN_ACCOUNT_IS_EMPTY);
			return uj;
		}
		if (users.size() == 0) {
			// 没有该邮箱用户
			uj.setStatus(-1);
			uj.setTips(Constances.EMAIL_IS_NOT_REGISTER);
			return uj;
		}

		User user = users.get(0);
		long nowTime1 = new Date().getTime();
		long createTime = user.getCreateDate().getTime();
		long betweenTime1 = (nowTime1 - createTime) / (1000 * 3600);

		if (user.getIsActive() == 0) {
			// 虽然数据库中有该账号，但超过48小时未激活
			if (betweenTime1 >= 48) {
				uj.setStatus(-1);
				uj.setTips(Constances.EMAIL_IS_NOT_REGISTER);
			} else {
				uj.setStatus(-2);
				uj.setTips(Constances.EMAIL_IS_NOT_ACTIVE);
				uj.setUsername(user.getUsername());
			}
			return uj;
		}

		if (user.getUnLockTime() != null) {
			long nowTime = new Date().getTime();
			long unLockTime = user.getUnLockTime().getTime();
			long betweenTime = (nowTime - unLockTime) / (1000 * 60);
			if (betweenTime < 15) {
				uj.setStatus(-3);
				uj.setTips(Constances.USER_IS_LOCK + "剩余时间：" + (15 - (int) betweenTime) + "分钟");
				uj.setUsername(user.getUsername());
				return uj;
			} else {
				user.setRestrictNumber(0);
				user.setUnLockTime(null);
				userDao.saveOrUpdate(user);
			}
		}

		if (user.getUnLockTime() == null) {
			if (BCrypt.checkpw(loginPassword, user.getPassword())) {
				log.info("密码正确");
				user.setRecentDate(new Date());
				loginPassword = BCrypt.hashpw(loginPassword, BCrypt.gensalt());// 重置密码
				user.setPassword(loginPassword);
				user.setRestrictNumber(0);
				user.setUnLockTime(null);
				userDao.saveOrUpdate(user);

				uj.setStatus(1);
				uj.setTips(Constances.LOGIN_SUCCESSS);
				uj.setEmail(user.getEmail());
				uj.setUsername(user.getUsername());
				uj.setSex(user.getSex());
				uj.setScore(user.getScore());
				uj.setLevel(user.getLevel());
				uj.setPersonSignature(user.getPersonSignature());
				uj.setRecentDate(user.getRecentDate());
				uj.setBirthday(user.getBirthday());
				uj.setLogin(true);

				WebUtils.setSessionAttribute(req, "currentLoginUser", uj);
				// HttpSession httpSession = req.getSession();
				// httpSession.setAttribute("currentLoginUser", uj);
				// log.info(httpSession.getAttribute("currentLoginUser") +
				// "======");
			} else {
				// 登陆次数验证
				log.info("密码错误");
				user.setRestrictNumber(user.getRestrictNumber() + 1);
				if (user.getRestrictNumber() < 5) {
					uj.setStatus(-4);
					uj.setTips(
							Constances.ERROR_OF_USERNAME_OR_PASSWORD + ",还剩余" + (5 - user.getRestrictNumber()) + "次机会");
					uj.setUsername(user.getUsername());
				} else {
					user.setUnLockTime(new Date());
					userDao.saveOrUpdate(user);
					uj.setStatus(-5);
					uj.setTips(Constances.USER_IS_LOCK + "请15分钟后再尝试登录。");
					uj.setUsername(user.getUsername());
				}
			}
		}
		return uj;
	}

	/**
	 * 验证邮箱
	 * 
	 * @param email
	 * @return
	 */
	public static boolean checkEmail(String email) {
		boolean flag = false;
		try {
			String check = "^([a-z0-9A-Z]+[-|_|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$";
			Pattern regex = Pattern.compile(check);
			Matcher matcher = regex.matcher(email);
			flag = matcher.matches();
		} catch (Exception e) {
			flag = false;
		}
		return flag;
	}

	// ---------getter&setter----------
	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

}
