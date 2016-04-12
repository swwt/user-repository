package com.csu.qxjh.user.controller.app;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import org.springframework.transaction.annotation.Transactional;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.serializer.CollectionSerializer;
import com.csu.qxjh.user.dao.CollectionDao;
import com.csu.qxjh.user.pojo.User;
import com.csu.qxjh.user.service.CollectionService;
import com.csu.qxjh.user.service.UserService;
import com.csu.qxjh.util.StringUtil;
import com.csu.qxjh.util.pojo.Message;

/*
 * 用户（买家）webapp控制层
 */

@RequestMapping("/user")
@Controller
public class UserControllerApp {
	@Resource
	private UserService userService;
	@Resource
	private CollectionService collectionService;
	/*
	 * 买家登陆(用户名或者手机号都可以登录)
	 */
	@ResponseBody
	@RequestMapping("/login") 	
	public Message login(@RequestParam(value="user_login_name")String user_login_name,
			@RequestParam(value="user_password")String user_password,
			HttpSession session){
		System.out.println("------------登陆----------");
		Message message=new Message();
		boolean isPhone=StringUtil.isDigital(user_login_name);
		User user_1=null;
		User user_2=null;
		if(isPhone){
			user_1=userService.getByPhone(user_login_name);			
			user_2=userService.getByPhonePassword(user_login_name, user_password);	
		}else{
			user_1=userService.getByName(user_login_name);	
			user_2=userService.getByNamePassword(user_login_name, user_password);
		}

		if(user_1!=null){
			if(user_2!=null){
				message.setCode(1);
				message.setMessage("登陆成功");
				message.setResult(user_2);
				session.setAttribute("user", user_2);//登陆成功放入session
				
			}else{
				message.setCode(0);
				message.setMessage("登陆失败，密码错误");
			}
		}else{
			message.setCode(0);
			message.setMessage("登陆失败，用户名不存在");
		}	
		return message;
	}
}



