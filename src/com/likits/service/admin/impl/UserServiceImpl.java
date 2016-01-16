package com.likits.service.admin.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.likits.dao.admin.UserDao;
import com.likits.entity.admin.AdminUser;
import com.likits.model.admin.AdminUserJson;
import com.likits.service.admin.UserService;

public class UserServiceImpl implements UserService {

	private UserDao userDao;
	private List<AdminUser> adminUsers;
	
	@Override
	public AdminUserJson findByNameAndPassword(String adminName, String password,String verificationCode) {
		adminUsers = userDao.findUsers(adminName, password);
		AdminUserJson auj = new AdminUserJson();
		String currentVerificationCode = (String) ServletActionContext.getRequest()
				.getSession().getAttribute("randVerificationCode");
		
		if(!currentVerificationCode.toLowerCase().equals(verificationCode)){
			auj.setStatus(0);//<=0为错误码
			auj.setTips("验证码错误");
		}else{
			if(adminUsers.size()==0){ //没找到
				auj.setStatus(-1);
				auj.setTips("用户名或密码错误");
			}else{
				auj.setStatus(1);//>0为正确码
				auj.setTips("登陆成功");
				auj.setAdminName(adminName);
				auj.setPassword(password);
			}
		}
		
		return auj;
	}

	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}


}
