package com.likits.dao.admin.impl;

import java.util.List;

import com.likits.dao.BaseDao;
import com.likits.dao.admin.UserDao;
import com.likits.entity.admin.AdminUser;

public class UserDaoImpl extends BaseDao<AdminUser, Integer> implements UserDao {

	@Override
	public List<AdminUser> findUsers(String adminName, String password) {
		//在HQL语句中表名应该是ORM映射的类名，而不是你在数据库中的表名。
		//不然会出现*** is not mapped的错误
		String queryStr = "from AdminUser";
	   	queryStr += " where admin = '" + adminName + "' and password = '"+password+"'";
		
		return this.find(queryStr);
	}

}
