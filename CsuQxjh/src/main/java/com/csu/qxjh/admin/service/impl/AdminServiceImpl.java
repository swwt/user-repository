package com.csu.qxjh.admin.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.csu.qxjh.admin.dao.AdminDao;
import com.csu.qxjh.admin.pojo.Admin;
import com.csu.qxjh.admin.service.AdminService;
import com.csu.qxjh.util.PropertiesUtils;
import com.csu.qxjh.util.pojo.Message;

@Service
public class AdminServiceImpl implements AdminService{

	private final static String admin_login_success = "admin_login_success";
	private final static String admin_login_password_error = "admin_login_password_error";
	private final static String admin_login_name_not_exit = "admin_login_name_not_exit";

	@Autowired
	AdminDao adminDao;
	
	@Override
	public Message adminLogin(String adminLoginName, String adminPassword) {
		
		Message message = new Message();
		if (adminDao.isLonginNameExist(adminLoginName)) {
			Admin admin = adminDao.adminLogin(adminLoginName, adminPassword);
			if (admin!=null) {
				message.setMessage(PropertiesUtils.get(admin_login_success));
				message.setCode(Message.LOGIN_SUCCESS);
				message.setResult(admin);
			}
			else {
				message.setMessage(PropertiesUtils.get(admin_login_password_error));
				message.setCode(Message.PASSWORD_ERROR);
			}
		}
		else {
			message.setMessage(PropertiesUtils.get(admin_login_name_not_exit));
			message.setCode(Message.ACCOUNT_NOT_EXIT);
		}
		return message;
	}

}
