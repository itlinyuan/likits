package com.likits.dao.front;

import java.util.List;

import com.likits.dao.Dao;
import com.likits.entity.front.User;

public interface UserDao extends Dao<User, Integer>{

	List<User> findByEmail(String email);
	//List<AdminUser> findUsers(String adminName,String password);

	List<User> findByEmailAndPassword(String email, String password);
}
