package com.csu.qxjh.sellor.service;

import java.util.Map;

import com.csu.qxjh.util.pojo.Message;

public interface SellorService {

	/**
	 * 分页，根据卖家登录名模糊查询
	 * 
	 * @param pageIndex
	 *            目标页
	 * @param key
	 *            用户名
	 * @return map中有5个对象 1、Map<String, Integer> startAndEnd 显示的起始页和终止页
	 *         2、pageIndex 目标页，也是当前页 3、pageCounts 总页数 4、key 用户名关键字 5、users
	 *         用户查询结果列表
	 */
	public Map<String, Object> fuzzyPageQuery(int param_targetPageIndex, String param_key);

	/** 商家登陆
	 * @param sellor_login_name 登陆名
	 * @param sellor_password 登陆密码
	 * @return 登陆消息
	 */
	public Message login(String sellor_login_name, String sellor_password);

}
