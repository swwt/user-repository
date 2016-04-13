package com.csu.qxjh.admin.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.csu.qxjh.admin.dao.AdminDao;
import com.csu.qxjh.admin.pojo.Admin;
import com.csu.qxjh.admin.service.AdminService;
import com.csu.qxjh.user.pojo.User;
import com.csu.qxjh.util.PageUtils;
import com.csu.qxjh.util.PropertiesUtils;
import com.csu.qxjh.util.pojo.Message;

@Service
public class AdminServiceImpl implements AdminService {

	private final static String admin_login_success = "admin_login_success";
	private final static String admin_login_password_error = "admin_login_password_error";
	private final static String admin_login_name_not_exit = "admin_login_name_not_exit";

	private final static int page_size_in_admin_manager = Integer
			.parseInt(PropertiesUtils.get("page_size_in_admin_manager"));

	@Autowired
	AdminDao adminDao;

	@Override
	public Message adminLogin(String adminLoginName, String adminPassword) {

		Message message = new Message();
		if (adminDao.isLonginNameExist(adminLoginName)) {
			Admin admin = adminDao.adminLogin(adminLoginName, adminPassword);
			if (admin != null) {
				message.setMessage(PropertiesUtils.get(admin_login_success));
				message.setCode(Message.LOGIN_SUCCESS);
				message.setResult(admin);
			} else {
				message.setMessage(PropertiesUtils.get(admin_login_password_error));
				message.setCode(Message.PASSWORD_ERROR);
			}
		} else {
			message.setMessage(PropertiesUtils.get(admin_login_name_not_exit));
			message.setCode(Message.ACCOUNT_NOT_EXIT);
		}
		return message;
	}

	@Override
	public Map<String, Object> fuzzyPageQuery(int param_targetPageIndex, String param_key) {
		Map<String, Object> result = new HashMap<>();

		int pageSize = page_size_in_admin_manager;

		Map<String, Integer> startAndEnd;
		Integer pageIndex = param_targetPageIndex;
		Integer pageCounts = null;
		String key = param_key;
		List<Admin> admins = null;

		/* 如果查询关键为空 */
		if (key == null || key.equals("")) {
			admins = adminDao.pageQuery(Admin.class, null, (pageIndex - 1) * pageSize, pageSize, true);
			pageCounts = adminDao.pageQueryCounts(Admin.class, null);
		} else {
			Map<String, String> conditions = new HashMap<>();
			conditions.put("admin_name", key);
			admins = adminDao.pageFuzzyQuery(Admin.class, conditions, (pageIndex - 1) * pageSize, pageSize, true);
			pageCounts = adminDao.pageFuzzyQueryCounts(Admin.class, conditions);
		}

		startAndEnd = PageUtils.getStartAndEnd(pageIndex, pageCounts);

		result.put("startAndEnd", startAndEnd);
		result.put("pageIndex", pageIndex);
		result.put("pageCounts", pageCounts);
		result.put("key", key);
		result.put("admins", admins);
		
		return result;
	}

}
