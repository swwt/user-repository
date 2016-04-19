package com.csu.qxjh.goods.service;

import java.util.List;

import com.csu.qxjh.goods.pojo.Goods;

public interface GoodsService {
	Goods getById(int id);
	List<Goods> getByCatagory2Id(int catagoryId);
	void addGoods(Goods goods);
	List<Goods> getByCatagory2Sellors(int catagoryId);//按销量降序排列
	List<Goods> getByCatagory2PriceDown(int catagoryId);//按价格降序排列
	List<Goods> getByCatagory2PriceUp(int catagoryId);//按价格升序排列
	List<Goods> getByCatagory2ZongHe(int catagoryId);//按综合降序排列
	
	List<Goods> getByNameOrderBySellors(String name);//根据商品名称进行模糊搜索,并将结果进行按销量排序
	List<Goods> getByNameOrderByPriceDown(String name);//根据商品名称进行模糊搜索,并将结果进行按价格降序排列
	List<Goods> getByNameOrderByPriceUp(String name);//根据商品名称进行模糊搜索,并将结果进行按价格升序排列
	List<Goods> getByNameOrderByZongHe(String name);//根据商品名称进行模糊搜索,并将结果进行按综合降序排列
	String getSellorIdByGoodsId(int id);//通过商品id获取卖家id
}
