package com.csu.qxjh.user.dao;

import com.csu.qxjh.user.pojo.GoodsOrder;

public interface GoodsOrderDao {
	void insert(GoodsOrder goodsOrder);//新加一条订单信息
	void uddate(GoodsOrder goodsOrder);//修改订单信息
	GoodsOrder selectById(String id);//根据主键查询订单信息
}
