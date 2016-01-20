package com.likits.model.admin;

import com.likits.model.ReturnBaseJsonObject;

public class AdminUserJson extends ReturnBaseJsonObject {
	private String adminName;
	private String password;
	private String roleName;
	
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
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	
}
