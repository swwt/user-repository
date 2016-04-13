package com.csu.qxjh.user.dao;

import com.csu.qxjh.user.pojo.GoodsOrder;
import com.csu.qxjh.util.base.BaseDao;

public interface GoodsOrderDao extends BaseDao<GoodsOrder> {
	void insert(GoodsOrder goodsOrder);//新加一条订单信息
}
