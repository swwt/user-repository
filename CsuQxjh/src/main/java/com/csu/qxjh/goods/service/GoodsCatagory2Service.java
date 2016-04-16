package com.csu.qxjh.goods.service;

import java.util.List;

import com.csu.qxjh.goods.pojo.GoodsCatagory1;
import com.csu.qxjh.goods.pojo.GoodsCatagory2;
/*
 * 二级分类服务层
 */
public interface GoodsCatagory2Service {
	void add(GoodsCatagory2 goodsCatagory2);//插入一条一级分类信息
	GoodsCatagory2 getById(int id);//根据主键查询一级分类信息
	void update(GoodsCatagory2 goodsCatagory2);//更新二级分类信息
	List<GoodsCatagory2> getAll();//获取所有二级分类的信息
	List<GoodsCatagory2> getByCatagory1Id(int id);//获取所有二级分类的信息
	List<GoodsCatagory2> getSpecialCatagory2();//获取专场分类
	List<GoodsCatagory2> getHotCatagory2();//获取热门分类
	String getRecommendCatagoryImage();//获取推荐分类对应的标志性的图片
}
