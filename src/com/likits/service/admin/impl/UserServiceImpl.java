package com.likits.service.admin.impl;

import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.springframework.web.util.WebUtils;

import com.likits.dao.admin.UserDao;
import com.likits.entity.admin.AdminUser;
import com.likits.model.admin.AdminUserJson;
import com.likits.service.admin.UserService;
import com.likits.util.Constances;

public class UserServiceImpl implements UserService {

	private UserDao userDao;
	private List<AdminUser> adminUsers;
	
	@Override
	public AdminUserJson findByNameAndPassword(String adminName, String password,String verificationCode) {
		
		adminUsers = userDao.findUsers(adminName, password);
		AdminUserJson auj = new AdminUserJson();
		String currentVerificationCode = (String)WebUtils.getSessionAttribute(ServletActionContext.getRequest(), "randVerificationCode");
//		String currentVerificationCode = (String) ServletActionContext.getRequest()
//				.getSession().getAttribute("randVerificationCode");
		
		if(!currentVerificationCode.toLowerCase().equals(verificationCode)){
			auj.setStatus(0);//<=0为错误码
			auj.setTips(Constances.ERROR_OF_VERIFICATION_CODE);
		}else{
			if(adminUsers.size()==0){ //没找到
				auj.setStatus(-1);
				auj.setTips(Constances.ERROR_OF_USERNAME_OR_PASSWORD);
			}else{
				auj.setStatus(1);//>0为正确码
				auj.setTips(Constances.LOGIN_SUCCESSS);
				auj.setAdminName(adminName);
				auj.setPassword(password);
				auj.setRoleName(adminUsers.get(0).getRole().getRoleName());
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
