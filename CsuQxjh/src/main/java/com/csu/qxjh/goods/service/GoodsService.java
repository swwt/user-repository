package com.csu.qxjh.goods.service;

import com.csu.qxjh.goods.pojo.Goods;

public interface GoodsService {
	Goods getById(int id);
	Goods getByCatagory2Id(int catagoryId);
	void addGoods(Goods goods);
}
