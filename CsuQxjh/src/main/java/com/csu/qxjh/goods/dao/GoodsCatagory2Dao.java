package com.csu.qxjh.goods.dao;

import java.util.List;

import com.csu.qxjh.goods.pojo.GoodsCatagory1;
import com.csu.qxjh.goods.pojo.GoodsCatagory2;

public interface GoodsCatagory2Dao {
	void insert(GoodsCatagory2 goodsCatagory2);//插入一条二级分类信息
	GoodsCatagory2 selectById(int id);//根据主键查询二级分类信息
	void update(GoodsCatagory2 goodsCatagory2);//更新二级分类信息
	List<GoodsCatagory2> selectAll();//查询所有二级分类的信息
	List<GoodsCatagory2> selectByCatagory1Id(int id);//根据一级分类id查询对应二级分类的所有信息
	List<GoodsCatagory2> selectByType(int type);//根据二级分类类型获取对应的信息
}
