package com.csu.qxjh.user.service;

import com.csu.qxjh.user.pojo.User;

public interface UserService {
	void insert(User user);
	User getUserById(String id);
}
