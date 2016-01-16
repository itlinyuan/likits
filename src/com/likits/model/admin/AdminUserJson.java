package com.likits.model.admin;

import com.likits.model.ReturnBaseJsonObject;

public class AdminUserJson extends ReturnBaseJsonObject {
	private String adminName;
	private String password;
	
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
	
}
