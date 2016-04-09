package com.csu.qxjh.goods.service;

import java.util.List;

import com.csu.qxjh.goods.pojo.Goods;

public interface GoodsService {
	Goods getById(int id);
	List<Goods> getByCatagory2Id(int catagoryId);
	void addGoods(Goods goods);
}
