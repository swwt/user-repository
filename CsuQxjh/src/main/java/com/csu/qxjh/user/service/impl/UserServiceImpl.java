package com.csu.qxjh.user.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.csu.qxjh.user.dao.UserDao;
import com.csu.qxjh.user.dao.impl.UserDaoImpl;
import com.csu.qxjh.user.pojo.User;
import com.csu.qxjh.user.service.UserService;
import com.csu.qxjh.util.MD5Util;

//如果有事务,那么加入事务,没有的话新建一个
@Transactional(propagation=Propagation.REQUIRED)
@Service
public class UserServiceImpl implements UserService{
	@Resource
	private UserDao userDao;
	//插入一条用户信息，密码作MD5加密
	public void insert(User user) {
		// TODO Auto-generated method stub
		String passowrd=user.getUser_password();
		String password_MD5=new MD5Util().MD5(passowrd);
		user.setUser_password(password_MD5);
		userDao.insert(user);
	}

	public User getUserById(String id) {
		// TODO Auto-generated method stub
		return userDao.getById(id);
	}
}
