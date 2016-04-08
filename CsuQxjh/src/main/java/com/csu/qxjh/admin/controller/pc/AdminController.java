package com.csu.qxjh.admin.controller.pc;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.csu.qxjh.admin.pojo.Admin;
import com.csu.qxjh.admin.service.AdminService;
import com.csu.qxjh.util.MD5Util;
import com.csu.qxjh.util.pojo.Message;

/*
 * pc端控制层
 */
@RequestMapping("/pc_admin")
@Controller
public class AdminController {
	@Autowired
	AdminService adminService;
	
	@Autowired
	HttpServletRequest request;
	
	@Autowired
	HttpSession session;

	@ResponseBody
	@RequestMapping("/login")
	public Message adminLogin(@RequestParam(value = "admin_login_name") String adminLoginName,
			@RequestParam(value = "admin_password") String adminPassword) {
		Message message = adminService.adminLogin(adminLoginName, MD5Util.MD5(adminPassword));
		if (message.getCode()==Message.LOGIN_SUCCESS) {
			session.setAttribute("admin", message.getResult());
		}
		return message;
	}
}
