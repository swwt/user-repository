package com.csu.qxjh.user.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.csu.qxjh.user.dao.GoodsOrderDao;
import com.csu.qxjh.user.pojo.GoodsOrder;
import com.csu.qxjh.user.pojo.User;
import com.csu.qxjh.user.service.GoodsOrderSerice;
import com.csu.qxjh.util.PageUtils;
import com.csu.qxjh.util.PropertiesUtils;

@Service
public class GoodsOrderServiceImpl implements GoodsOrderSerice{
	
	private static int page_size_in_seller_order_list = Integer.parseInt(PropertiesUtils.get("page_size_in_seller_order_list"));

	@Autowired
	GoodsOrderDao goodsOrderDao;
	
	@Override
	public Map<String, Object> fuzzyPageQuery(int param_targetPageIndex, String param_key) {
		// TODO Auto-generated method stub
		
		/* 模糊查询的字段名称 */
		final String field_name = "id";
		Map<String, Object> result = new HashMap<>();
		
		int pageSize = page_size_in_seller_order_list;
		
		Map<String, Integer> startAndEnd;
		Integer pageIndex = param_targetPageIndex;
		Integer pageCounts = null;
		String key = param_key;
		List<GoodsOrder> goodsOrders = null;
		
		int recordCounts = -1;
		
		/* 如果查询关键为空 */
		if (key == null || key.equals("")) {
			goodsOrders = goodsOrderDao.pageQuery(GoodsOrder.class, null, pageIndex, pageSize, true);
			recordCounts = goodsOrderDao.pageQueryCounts(GoodsOrder.class, null);
		} else {
			Map<String, String> conditions = new HashMap<>();
			conditions.put(field_name, key);
			goodsOrders = goodsOrderDao.pageFuzzyQuery(GoodsOrder.class, conditions, pageIndex, pageSize, true);
			recordCounts = goodsOrderDao.pageFuzzyQueryCounts(GoodsOrder.class, conditions);
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
		result.put("goodsOrders", goodsOrders);
		
		return result;
	}

}
