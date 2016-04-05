package com.csu.qxjh.goods.dao;

import com.csu.qxjh.goods.pojo.GoodsCatagory1;
import com.csu.qxjh.goods.pojo.GoodsCatagory2;

public interface GoodsCatagory2Dao {
	void insert(GoodsCatagory2 goodsCatagory2);//插入一条二级分类信息
	GoodsCatagory2 selectById(int id);//根据主键查询二级分类信息
	void update(GoodsCatagory2 goodsCatagory2);//更新二级分类信息
}
