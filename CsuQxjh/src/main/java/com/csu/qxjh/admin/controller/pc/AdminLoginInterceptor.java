package com.csu.qxjh.admin.controller.pc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.csu.qxjh.admin.pojo.Admin;

public class AdminLoginInterceptor implements HandlerInterceptor {

	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		System.out.println("admin未登录，拦截器启动");
		boolean flag = false;
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		if (admin != null) {
			flag = true;
			System.out.println("已登陆");
		}
		else {
			System.out.println("未登陆");
			response.sendRedirect("/web_page/administrator/signin.jsp");
		}
		return flag;
	}

}
