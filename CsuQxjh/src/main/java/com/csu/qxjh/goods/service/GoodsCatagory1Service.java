package com.csu.qxjh.goods.service;

import com.csu.qxjh.goods.pojo.GoodsCatagory1;

public interface GoodsCatagory1Service {
	void add(GoodsCatagory1 goodsCatagory1);//插入一条一级分类信息
	GoodsCatagory1 getById(int id);//根据主键查询一级分类信息
	void update(GoodsCatagory1 goodsCatagory1);//修改一级分类信息
}
