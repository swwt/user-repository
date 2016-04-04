package com.csu.qxjh.user.controller.app;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.csu.qxjh.user.pojo.User;
import com.csu.qxjh.user.service.UserService;
import com.csu.qxjh.util.pojo.Message;

/*
 * 用户（买家）webapp控制层
 */
@RequestMapping("/user")
@Controller
public class UserControllerApp {
	@Resource
	private UserService userService;
	
	/*
	 * 买家登陆
	 */
	@ResponseBody
	@RequestMapping("/login")	
	public Message login(@RequestParam(value="user_login_name")String user_login_name,
			@RequestParam(value="user_password")String user_password,
			HttpSession session){
		Message message=new Message();
		User user=userService.getByNamePassword(user_login_name, user_password);
		if(user!=null){
			message.setCode(1);
			message.setMessage("登陆成功");
			message.setResult(user);
			session.setAttribute("user", user);
		}else{
			message.setCode(0);
			message.setMessage("登陆失败，用户不存在");
		}		
		return message;
	}
	
	
}



