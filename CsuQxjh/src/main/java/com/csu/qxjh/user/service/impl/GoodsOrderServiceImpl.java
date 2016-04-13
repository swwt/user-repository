package com.csu.qxjh.user.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.csu.qxjh.user.dao.GoodsOrderDao;
import com.csu.qxjh.user.pojo.GoodsOrder;
import com.csu.qxjh.user.service.GoodsOrderSerice;
import com.csu.qxjh.util.DateUtil;

@Transactional(propagation=Propagation.REQUIRED)
@Service
public class GoodsOrderServiceImpl implements GoodsOrderSerice{
	
	@Resource
	private GoodsOrderDao goodsOrderDao;
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
