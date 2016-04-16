package com.csu.qxjh.goods.service;

import java.util.List;

import com.csu.qxjh.goods.pojo.GoodsCatagory1;



public interface GoodsCatagory1Service {
	void add(GoodsCatagory1 goodsCatagory1);//插入一条一级分类信息
	GoodsCatagory1 getById(int id);//根据主键查询一级分类信息
	void update(GoodsCatagory1 goodsCatagory1);//修改一级分类信息
	List<GoodsCatagory1> getAll();//获取所有一级分类的信息
}
