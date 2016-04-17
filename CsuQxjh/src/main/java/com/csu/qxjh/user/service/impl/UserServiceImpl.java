package com.csu.qxjh.user.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.catalina.connector.Request;
import org.hibernate.Hibernate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.csu.qxjh.admin.pojo.Admin;
import com.csu.qxjh.user.dao.UserDao;
import com.csu.qxjh.user.dao.impl.UserDaoImpl;
import com.csu.qxjh.user.pojo.User;
import com.csu.qxjh.user.service.UserService;
import com.csu.qxjh.util.MD5Util;
import com.csu.qxjh.util.PageUtils;
import com.csu.qxjh.util.PropertiesUtils;

//如果有事务,那么加入事务,没有的话新建一个
@Transactional(propagation = Propagation.REQUIRED)
@Service
public class UserServiceImpl implements UserService {

	/**
	 * 用户管理界面最多显示的记录的个数
	 */
	private static final int page_size_in_user_manager = Integer
			.parseInt(PropertiesUtils.get("page_size_in_user_manager"));

	@Resource
	private UserDao userDao;

	// 插入一条用户信息，密码作MD5加密
	public void insert(User user) {
		// TODO Auto-generated method stub
		String passowrd = user.getUser_password();
		String password_MD5 = new MD5Util().MD5(passowrd);
		user.setUser_password(password_MD5);
		userDao.insert(user);
		user.setUser_name(user.getId());
		userDao.update(user);// 将用户名设置为与主键值一样
	}

	public User getUserById(String id) {
		// TODO Auto-generated method stub
		return userDao.getById(id);
	}

	public User getByNamePassword(String user_login_name, String user_password) {
		// TODO Auto-generated method stub
		String password_MD5=new MD5Util().MD5(user_password);//先获取加密后的密码
		User user=userDao.getByNamePassword(user_login_name, password_MD5);
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
		String password_MD5 = new MD5Util().MD5(user_password);// 先获取加密后的密码
		return userDao.getByPhonePassword(user_phone, password_MD5);
	}

	@Override
	public Map<String, Object> fuzzyPageQuery(int param_targetPageIndex, String param_key) {

		/* 模糊查询的字段名称 */
		final String field_name = "user_login_name";

		Map<String, Object> result = new HashMap<>();

		int pageSize = page_size_in_user_manager;

		Map<String, Integer> startAndEnd;
		Integer pageIndex = param_targetPageIndex;
		Integer pageCounts = null;
		String key = param_key;
		List<User> users = null;

		int recordCounts = -1;
		String[] orderConditions = { "id" };
		/* 如果查询关键为空 */
		if (key == null || key.equals("")) {
			
			users = userDao.pageQuery(User.class, null, pageIndex, pageSize, orderConditions,true);
			recordCounts = userDao.pageQueryCounts(User.class, null);
		} else {
			Map<String, String> conditions = new HashMap<>();
			conditions.put(field_name, key);
			users = userDao.pageFuzzyQuery(User.class, conditions, pageIndex, pageSize, orderConditions,true);
			recordCounts = userDao.pageFuzzyQueryCounts(User.class, conditions);
		}

		pageCounts = recordCounts / pageSize;
		if (recordCounts % pageSize != 0 && recordCounts > 0) {
			pageCounts++;
		}

		startAndEnd = PageUtils.getStartAndEnd(pageIndex, pageCounts);

		result.put("startAndEnd", startAndEnd);
		result.put("pageIndex", pageIndex);
		result.put("pageCounts", pageCounts);
		result.put("key", key);
		result.put("users", users);
		
		return result;
	}

	@Override
	public void update(User user) {
		// TODO Auto-generated method stub
		String passowrd = user.getUser_password();
		String password_MD5 = new MD5Util().MD5(passowrd);
		user.setUser_password(password_MD5);
		userDao.update(user);
	}
}
