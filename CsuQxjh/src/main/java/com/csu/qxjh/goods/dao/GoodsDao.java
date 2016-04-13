package com.csu.qxjh.goods.dao;

import java.util.List;

import com.csu.qxjh.goods.pojo.Goods;

public interface GoodsDao {
	Goods selectById(int id);//根据id查询商品
	List<Goods> selectByGoodsCatagory2(int goodsCatagoryId);//根据二级分类id查询所有商品
	List<Goods> selectByName(String name);//根据名称进行模糊搜索
	void insert(Goods goods);//新加一条商品
	//根据二级分类id查询所有商品,并按价格排序,squence=0代表降序，squence=1代表升序
	List<Goods> selectByGoodsCatagory2ByPrice(int goodsCatagoryId,int sequence);
	List<Goods> selectByGoodsCatagory2BySells(int goodsCatagoryId);//按销量排序（降序）
	
	List<Goods> selectByNameOrderByPrice(String name,int sequence);//根据商品名称进行模糊搜索,并将结果进行价格排序，squence=0代表降序，squence=1代表升序
	List<Goods> selectByNameOrderBySells(String name);//根据商品名称进行模糊搜索,并将结果进行按销量排序
}
