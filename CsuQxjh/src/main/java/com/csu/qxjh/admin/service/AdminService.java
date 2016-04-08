package com.csu.qxjh.admin.service;

import com.csu.qxjh.util.pojo.Message;

public interface AdminService {
	public Message adminLogin(String admin_login_name,String admin_password);
}
