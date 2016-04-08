package com.csu.qxjh.goods.dao;

import com.csu.qxjh.goods.pojo.Goods;

public interface GoodsDao {
	Goods selectById(int id);//根据id查询商品
	Goods selectByGoodsCatagory2(int goodsCatagoryId);//根据二级分类id查询所有商品
	void insert(Goods goods);//新加一条商品
}
