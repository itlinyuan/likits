package com.likits.action.front;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts2.ServletActionContext;

import com.likits.model.front.UserJson;
import com.likits.service.front.UserService;

import net.sf.json.JSONObject;


public class RegisterAndLoginAction {
	public static final Log log = LogFactory.getLog(RegisterAndLoginAction.class);
	
	private String emailSenderUser;
	private String emailSenderPassword;
	private String emailSenderHost;
	
	//跟前台页面对应的元素的属性name值，post方法直接通过getter,setter取值
	private String email;
	private String password;
	
	private String registerId,registerEmail;
	private UserService userService;
	private HttpServletResponse response;
	private HttpServletRequest request;
	
	public void register() throws IOException, ParseException{
		response=ServletActionContext.getResponse();
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		PrintWriter out;
		out = response.getWriter();
		//log.info(emailSenderUser+"   "+ emailSenderPassword);
		UserJson userjson = userService.register(
				emailSenderUser,emailSenderPassword,emailSenderHost,email,password);
		
		JSONObject json=new JSONObject();
		json.accumulate("registerStatus", userjson);
		out.println(json.toString());
		out.flush();
		out.close();
	}
	
	public void mailBack() throws IOException{
		response=ServletActionContext.getResponse();
		request = ServletActionContext.getRequest();
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		PrintWriter out;
		out = response.getWriter();
		
		registerId = request.getParameter("registerId");
		registerEmail = request.getParameter("registerEmail");
		UserJson userjson = userService.updateUserActivate(registerId,registerEmail);
		
		JSONObject json=new JSONObject();
		json.accumulate("registerStatus", userjson);
		out.println(json.toString());
		out.flush();
		out.close();

		//request.setAttribute("registerName", registerName);
	}
	
	public void login() throws IOException{
		response=ServletActionContext.getResponse();
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		PrintWriter out;
		out = response.getWriter();
		//log.info(emailSenderUser+"   "+ emailSenderPassword);
		UserJson userjson = userService.findUser(email,password);
		
		JSONObject json=new JSONObject();
		json.accumulate("loginStatus", userjson);
		out.println(json.toString());
		out.flush();
		out.close();
	}
	
	public void logout() throws IOException{
		response=ServletActionContext.getResponse();
		request = ServletActionContext.getRequest();
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
//		PrintWriter out;
//		out = response.getWriter();
		//log.info(emailSenderUser+"   "+ emailSenderPassword);
//		ReturnBaseJsonObject rbjo = new ReturnBaseJsonObject();
//		rbjo.setStatus(1);
//		rbjo.setTips(Constances.LOGOUT_SUCCESSS);
		
		//若存在会话则返回该会话，否则返回NULL
		request.getSession(false);  		
		request.getSession().removeAttribute("currentLoginUser");
		response.setHeader("refresh","0;URL=index.jsp");
		
//		JSONObject json=new JSONObject();
//		json.accumulate("logoutStatus", rbjo);
//		out.println(json.toString());
//		out.flush();
//		out.close();
	}
	//--------getter&setter-------------
	public String getEmailSenderUser() {
		return emailSenderUser;
	}

	public void setEmailSenderUser(String emailSenderUser) {
		this.emailSenderUser = emailSenderUser;
	}

	public String getEmailSenderPassword() {
		return emailSenderPassword;
	}

	public void setEmailSenderPassword(String emailSenderPassword) {
		this.emailSenderPassword = emailSenderPassword;
	}

	public String getEmailSenderHost() {
		return emailSenderHost;
	}

	public void setEmailSenderHost(String emailSenderHost) {
		this.emailSenderHost = emailSenderHost;
	}

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setRegisterId(String registerId) {
		this.registerId = registerId;
	}

	public void setRegisterEmail(String registerEmail) {
		this.registerEmail = registerEmail;
	}

	public HttpServletResponse getResponse() {
		return response;
	}

	public void setResponse(HttpServletResponse response) {
		this.response = response;
	}

	public HttpServletRequest getRequest() {
		return request;
	}

	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}
}
