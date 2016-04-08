package com.csu.qxjh.admin.dao;

import com.csu.qxjh.admin.pojo.Admin;

public interface AdminDao {

	public boolean isLonginNameExist(String adminLoginName);

	public Admin adminLogin(String adminLoginName, String adminPassword);
}
