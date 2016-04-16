package com.csu.qxjh.util;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.csu.qxjh.user.pojo.User;
import com.csu.qxjh.util.pojo.Message;

//app未登录拦截器
public class LoginInterceptor_app implements HandlerInterceptor{

	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}


	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object arg2, ModelAndView arg3)
			throws Exception {
		// TODO Auto-generated method stub
	}

	@Override//未登录拦截
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("---------app未登陆拦截---------");
		boolean judge=false;
		User user=(User)request.getSession().getAttribute("user");
		if(user!=null){
			judge=true;
		}else{
			PrintWriter pw= response.getWriter();
	 	    Message message=new Message();
	 	    message.setCode(-1);
	 	    message.setMessage("还未登录,请先登录");
	 	    message.setResult(null);
	 	    JSON.toJSONString(message);
	 	    pw.print(JSON.toJSONString(message));
		}
		return judge;
	}

}
