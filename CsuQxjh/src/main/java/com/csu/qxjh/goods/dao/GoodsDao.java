package com.csu.qxjh.goods.dao;

import java.util.List;

import com.csu.qxjh.goods.pojo.Goods;

public interface GoodsDao {
	Goods selectById(int id);//根据id查询商品
	List<Goods> selectByGoodsCatagory2(int goodsCatagoryId);//根据二级分类id查询所有商品
	void insert(Goods goods);//新加一条商品
	//根据二级分类id查询所有商品,并按价格排序,squence=0代表降序，squence=1代表升序
	List<Goods> selectByGoodsCatagory2ByPrice(int goodsCatagoryId,int sequence);
	List<Goods> selectByGoodsCatagory2BySells(int goodsCatagoryId);//按销量排序（降序）
}
