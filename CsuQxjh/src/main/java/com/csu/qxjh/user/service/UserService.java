package com.csu.qxjh.user.service;

import com.csu.qxjh.user.pojo.User;

public interface UserService {
	void insert(User user);//插入一条用户信息
	User getUserById(String id);//根据主键获取用户
	User getByNamePassword(String user_login_name,String user_password);//根据登录名和密码查询用户
}
