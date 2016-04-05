package com.csu.qxjh.goods.dao;

import java.util.List;

import com.csu.qxjh.goods.pojo.GoodsCatagory1;



public interface GoodsCatagory1Dao {
	void insert(GoodsCatagory1 goodsCatagory1);//插入一条一级分类信息
	GoodsCatagory1 selectById(int id);//根据主键查询一级分类信息
	void update(GoodsCatagory1 goodsCatagory1);//更新一级分类信息
	List selectAll();//查询所有的一级分类信息
}
