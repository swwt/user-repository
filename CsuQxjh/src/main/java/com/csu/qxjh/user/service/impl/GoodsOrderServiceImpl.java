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
import com.csu.qxjh.util.pojo.Message;

@Transactional(propagation = Propagation.REQUIRED)
@Service
public class GoodsOrderServiceImpl implements GoodsOrderSerice {

	private static int page_size_in_seller_order_list = Integer
			.parseInt(PropertiesUtils.get("page_size_in_seller_order_list"));

	@Autowired
	GoodsOrderDao goodsOrderDao;

	@Override
	public Map<String, Object> fuzzyPageQuery(int param_targetPageIndex, String param_key, int payment_status,
			int deliver_status, int gain_status,String sellor_id) {
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

		Map<String, String> conditions = new HashMap<>();
		conditions.put("sellor_id", sellor_id);
		String[] orderConditions = { "goods_order_create_time" };
		if (payment_status != -1 || deliver_status != -1 || gain_status != -1) {
			
			
			if (payment_status != -1) conditions.put("goods_order_payment_status", payment_status+"");
			if (deliver_status != -1) conditions.put("goods_order_deliver_status", deliver_status+"");
			if (gain_status != -1) conditions.put("goods_order_gain_status", gain_status+"");
			
			goodsOrders = goodsOrderDao.pageQuery(GoodsOrder.class, conditions, pageIndex, pageSize, orderConditions,true);
			recordCounts = goodsOrderDao.pageQueryCounts(GoodsOrder.class, conditions);
		}
		/* 如果查询关键为空 */
		else if (key == null || key.equals("")) {
			goodsOrders = goodsOrderDao.pageQuery(GoodsOrder.class, conditions, pageIndex, pageSize, orderConditions,true);
			recordCounts = goodsOrderDao.pageQueryCounts(GoodsOrder.class, null);
		} else {
			conditions.put(field_name, key);
			goodsOrders = goodsOrderDao.pageFuzzyQuery(GoodsOrder.class, conditions, pageIndex, pageSize, orderConditions,true);
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

		/*
		 * for (GoodsOrder goodsOrder : goodsOrders) {
		 * Hibernate.initialize(goodsOrder.getUser());
		 * Hibernate.initialize(goodsOrder.getGoods()); }
		 */

		return result;
	}

	
	
	@Override
	public void insert(GoodsOrder goodsOrder) {
		goodsOrder.setGoods_order_create_time(DateUtil.getDate());
		goodsOrder.setGoods_order_user_use(1);// 用户保留订单
		// TODO Auto-generated method stub
		goodsOrderDao.insert(goodsOrder);
	}

	@Override // 删除用户订单，实际只是修改数据表字段
	public void deleteGoodsUserType(GoodsOrder goodsOrder) {
		// TODO Auto-generated method stub
		goodsOrder.setGoods_order_user_use(0);// 用户不保留订单
	}

	@Override
	public GoodsOrder getById(String id) {
		// TODO Auto-generated method stub
		GoodsOrder goodsOrder=goodsOrderDao.selectById(id);
		Hibernate.initialize(goodsOrder.getGoods());
		return goodsOrder;
	}

	@Override
	public List<GoodsOrder> getOrderByNoPay(String userId) {
		// TODO Auto-generated method stub
		return goodsOrderDao.selectOrderByNoPay(userId);
	}

	@Override
	public List<GoodsOrder> getOrderByNoGet(String userId) {
		// TODO Auto-generated method stub
		return goodsOrderDao.selectOrderByNoGet(userId);
	}

	@Override
	public List<GoodsOrder> getOrderByNoComment(String userId) {
		// TODO Auto-generated method stub
		return goodsOrderDao.selectOrderByNoComment(userId);
	}

	@Override
	public List<GoodsOrder> getOrderByComplete(String userId) {
		// TODO Auto-generated method stub
		return goodsOrderDao.selectOrderByComplete(userId);
	}



	@Override
	public Message markAsSendOut(String orderId) {
		
		Message message = new Message();
		
		GoodsOrder goodsOrder = goodsOrderDao.selectById(orderId);
		
		if (goodsOrder == null) {
			message.setCode(Message.ORDER_NOT_EXIST);
			message.setMessage("订单不存在，操作终止！");
		}
		else {
			goodsOrder.setGoods_order_deliver_status(1);
			goodsOrderDao.update(goodsOrder);
			message.setCode(Message.ORDER_STATUS_TURN_TO_DELIVER);
			message.setMessage("操作成功！");
		}
		return message;
	}



	@Override
	public void save(GoodsOrder goodsOrder) {
		// TODO Auto-generated method stub
		goodsOrderDao.save(goodsOrder);
	}
	
	
}
