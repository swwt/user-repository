package com.csu.qxjh.goods.service;

import com.csu.qxjh.goods.pojo.GoodsCatagory1;
import com.csu.qxjh.goods.pojo.GoodsCatagory2;

public interface GoodsCatagory2Service {
	void add(GoodsCatagory2 goodsCatagory2);//插入一条一级分类信息
	GoodsCatagory2 getById(int id);//根据主键查询一级分类信息
	void update(GoodsCatagory2 goodsCatagory2);//更新二级分类信息
}
