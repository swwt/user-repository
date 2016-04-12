package com.csu.qxjh.user.service.impl;

import javax.annotation.Resource;

import org.hibernate.Hibernate;
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
		user.setUser_name(user.getId());
		userDao.update(user);//将用户名设置为与主键值一样
	}

	public User getUserById(String id) {
		// TODO Auto-generated method stub
		return userDao.getById(id);
	}

	public User getByNamePassword(String user_login_name, String user_password) {
		// TODO Auto-generated method stub
		String password_MD5=new MD5Util().MD5(user_password);//先获取加密后的密码
		User user=userDao.getByNamePassword(user_login_name, password_MD5);
		user.setCollections(null);
		user.setGoodsOrders(null);
//		Hibernate.initialize(user.getCollections());--->解决session关闭，延迟加载异常
//		Hibernate.initialize(user.getGoodsOrders());
		return user;
	}

	public User getByName(String user_login_name) {
		// TODO Auto-generated method stub
		return userDao.getByName(user_login_name);
	}

	@Override
	public User getByPhone(String user_phone) {
		// TODO Auto-generated method stub
		return userDao.getByPhone(user_phone);
	}

	@Override
	public User getByPhonePassword(String user_phone, String user_password) {
		// TODO Auto-generated method stub
		String password_MD5=new MD5Util().MD5(user_password);//先获取加密后的密码
		return userDao.getByPhonePassword(user_phone, password_MD5);
	}
}
