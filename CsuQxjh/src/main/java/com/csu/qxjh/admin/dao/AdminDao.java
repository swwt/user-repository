package com.csu.qxjh.admin.dao;

import com.csu.qxjh.admin.pojo.Admin;
import com.csu.qxjh.util.base.BaseDao;

public interface AdminDao extends BaseDao<Admin> {

	public boolean isLonginNameExist(String adminLoginName);

	public Admin adminLogin(String adminLoginName, String adminPassword);
}
