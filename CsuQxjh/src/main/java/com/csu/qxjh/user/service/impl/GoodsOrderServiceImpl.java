package com.csu.qxjh.user.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.csu.qxjh.user.dao.GoodsOrderDao;
import com.csu.qxjh.user.pojo.GoodsOrder;
import com.csu.qxjh.user.service.GoodsOrderSerice;
import com.csu.qxjh.util.DateUtil;
import com.csu.qxjh.util.PageUtils;
import com.csu.qxjh.util.PropertiesUtils;

@Transactional(propagation=Propagation.REQUIRED)
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
		
		for (GoodsOrder goodsOrder : goodsOrders) {
			Hibernate.initialize(goodsOrder.getUser());
			Hibernate.initialize(goodsOrder.getGoods());
		}
		
		return result;
	}
	@Override
	public void insert(GoodsOrder goodsOrder) {
		goodsOrder.setGoods_order_create_time(DateUtil.getDate());
		goodsOrder.setGoods_order_user_use(1);//用户保留订单
		// TODO Auto-generated method stub
		goodsOrderDao.insert(goodsOrder);
	}
	@Override//删除用户订单，实际只是修改数据表字段
	public void deleteGoodsUserType(GoodsOrder goodsOrder) {
		// TODO Auto-generated method stub
		goodsOrder.setGoods_order_user_use(0);//用户不保留订单
	}
	@Override
	public GoodsOrder getById(String id) {
		// TODO Auto-generated method stub
		return goodsOrderDao.selectById(id);
	}
	
	
}
