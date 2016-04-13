package com.csu.qxjh.user.service;

import com.csu.qxjh.user.pojo.GoodsOrder;

public interface GoodsOrderSerice {
	void insert(GoodsOrder goodsOrder);//添加一条订单信息
	void deleteGoodsUserType(GoodsOrder goodsOrder);//用户删除订单信息（注意不是真正删除数据库数据，只是修改数据）
	GoodsOrder getById(String id);
}
