package com.csu.qxjh.user.dao;

import com.csu.qxjh.user.pojo.User;

public interface UserDao {
	User getById(String id);//根据主键获取用户
	void insert(User user);//插入一条用户信息
}
