package com.csu.qxjh.user.service;

import java.util.Map;

import com.csu.qxjh.user.pojo.User;

public interface UserService {
	void insert(User user);//插入一条用户信息
	User getUserById(String id);//根据主键获取用户
	User getByNamePassword(String user_login_name,String user_password);//根据登录名和密码查询用户
	User getByName(String user_login_name);//根据登录名查询用户
	User getByPhone(String user_phone);//根据手机号查询用户
	User getByPhonePassword(String user_phone,String user_password);//根据手机号和密码查询用户
	void update(User user);//更新用户信息
	/**分页，根据用户登陆名模糊查询
	 * @param pageIndex 目标页
	 * @param key 用户名
	 * @return map中有5个对象
	 * 1、Map<String, Integer> startAndEnd 显示的起始页和终止页
	 * 2、pageIndex 目标页，也是当前页
	 * 3、pageCounts 总页数
	 * 4、key 用户名关键字
	 * 5、users 用户查询结果列表
	 */
	public Map<String, Object> fuzzyPageQuery(int param_targetPageIndex, String param_key);
}
