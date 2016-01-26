package com.likits.action.admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts2.ServletActionContext;
import org.springframework.web.util.WebUtils;

import com.likits.model.admin.AdminUserJson;
import com.likits.service.admin.UserService;

import net.sf.json.JSONObject;

public class LoginAction {
	public static final Log log = LogFactory
			.getLog(LoginAction.class);
	public static final Log adminLog = LogFactory.getLog("ADMIN");
	private String adminName;
	private String password;
	private String verificationCode;
	
	private UserService userService;
	
	public void login() throws IOException{
		log.info("开始登录..");
		adminLog.info("Login...");
		HttpServletResponse response=ServletActionContext.getResponse();
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		PrintWriter out;
		out = response.getWriter();
		//将要被返回到客户端的对象
		AdminUserJson auj = userService.findByNameAndPassword(adminName, password, verificationCode);
		
		WebUtils.setSessionAttribute(ServletActionContext.getRequest(), "currentAdmin", auj);
		//ServletActionContext.getRequest().getSession().setAttribute("currentAdmin", auj);
//		Cookie sourceTypeCookie = new Cookie("currentAdmin", auj.toString());  
//		// 生命周期  
//		//sourceTypeCookie.setMaxAge(60 * 60 * 24 * 30); // 保存30天  
//		response.addCookie(sourceTypeCookie);  
//		
//		Cookie[] cookies = ServletActionContext.getRequest().getCookies();
//		for (int i = 0; i < cookies.length; i++) {
//			Cookie cookie = cookies[i];
//			log.info(cookie.getName()+"===");
//		}

		JSONObject json=new JSONObject();
		json.accumulate("loginStatus", auj);
		out.println(json.toString());
		out.flush();
		out.close();
		log.info("登录结束..");
	}

	public String getAdminName() {
		return adminName;
	}

	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public String getVerificationCode() {
		return verificationCode;
	}

	public void setVerificationCode(String verificationCode) {
		this.verificationCode = verificationCode;
	}

	
}
