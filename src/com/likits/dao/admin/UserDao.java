package com.likits.dao.admin;

import java.util.List;

import com.likits.dao.Dao;
import com.likits.entity.admin.AdminUser;

public interface UserDao extends Dao<AdminUser, Integer>{
	List<AdminUser> findUsers(String adminName,String password);
}
