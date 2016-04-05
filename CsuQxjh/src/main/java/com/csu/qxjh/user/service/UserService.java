package com.csu.qxjh.user.service;

import com.csu.qxjh.user.pojo.User;

public interface UserService {
	void insert(User user);//插入一条用户信息
	User getUserById(String id);//根据主键获取用户
	User getByNamePassword(String user_login_name,String user_password);//根据登录名和密码查询用户
	User getByName(String user_login_name);//根据登录名查询用户
	User getByPhone(String user_phone);//根据手机号查询用户
	User getByPhonePassword(String user_phone,String user_password);//根据手机号和密码查询用户
}
