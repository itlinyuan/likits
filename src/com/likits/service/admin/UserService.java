package com.likits.service.admin;

import com.likits.model.admin.AdminUserJson;

public interface UserService {
	AdminUserJson findByNameAndPassword(String adminName,String password, String verificationCode);
}
