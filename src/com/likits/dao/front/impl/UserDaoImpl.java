package com.likits.dao.front.impl;

import java.util.List;

import com.likits.dao.BaseDao;
import com.likits.dao.front.UserDao;
import com.likits.entity.front.User;

public class UserDaoImpl extends BaseDao<User, Integer> implements UserDao {

	@Override
	public List<User> findByEmail(String email) {
		String queryStr = "from User";
	   	queryStr += " where email = '" + email + "'";
		
		return this.find(queryStr);
	}

	@Override
	public List<User> findByEmailAndPassword(String email, String password) {
		String queryStr = "from User";
	   	queryStr += " where email = '" + email + "' and password = '"+password+"'";
		
		return this.find(queryStr);
	}

}
