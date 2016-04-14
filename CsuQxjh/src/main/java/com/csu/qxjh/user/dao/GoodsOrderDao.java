package com.csu.qxjh.user.dao;

import java.util.List;

import com.csu.qxjh.user.pojo.GoodsOrder;
import com.csu.qxjh.util.base.BaseDao;

public interface GoodsOrderDao extends BaseDao<GoodsOrder> {
	void insert(GoodsOrder goodsOrder);//新加一条订单信息
	void uddate(GoodsOrder goodsOrder);//修改订单信息
	GoodsOrder selectById(String id);//根据主键查询订单信息
	List<GoodsOrder> selectOrderByNoPay(String userId);//查询用户待付款的订单
	List<GoodsOrder> selectOrderByNoGet(String userId);//查询用户待收获的订单
	List<GoodsOrder> selectOrderByNoComment(String userId);//查询用户待评价的订单
	List<GoodsOrder> selectOrderByComplete(String userId);//查询用户交易完成的订单
}
