package com.csu.qxjh.user.service;

import java.util.Map;

public interface GoodsOrderSerice {
	
	/**分页，根据订单编号查询订单
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
