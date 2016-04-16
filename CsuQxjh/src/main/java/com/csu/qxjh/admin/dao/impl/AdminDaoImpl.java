package com.csu.qxjh.admin.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.csu.qxjh.admin.dao.AdminDao;
import com.csu.qxjh.admin.pojo.Admin;
import com.csu.qxjh.util.base.BaseDaoImpl;

@Repository
public class AdminDaoImpl extends BaseDaoImpl<Admin> implements AdminDao {

	private static String ADMIN_LOGIN_NAME = "admin_login_name";
	private static String ADMIN_PASSWORD = "admin_password";

	@Override
	public Admin adminLogin(String adminLoginName, String adminPassword) {
		// TODO Auto-generated method stub
		Map<String, String> conditions = new HashMap<>();
		conditions.put(this.ADMIN_LOGIN_NAME, adminLoginName);
		conditions.put(this.ADMIN_PASSWORD, adminPassword);
		List<Admin> admins = pageQuery(Admin.class, conditions, 1, 1,null, false);
		if (admins.size()!=1) {
			return null;
		}
		else {
			return admins.get(0);
		}
	}

	@Override
	public boolean isLoginNameExist(String adminLoginName) {
		
		Map<String, String> conditions = new HashMap<>();
		conditions.put(this.ADMIN_LOGIN_NAME, adminLoginName);
		List<Admin> admins = pageQuery(Admin.class, conditions, 1, 1, null,false);
		if (admins.size()!=1) {
			return false;
		}
		else {
			return true;
		}
	}
}
