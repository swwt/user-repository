package com.csu.qxjh.user.dao;

import java.util.List;

import org.hibernate.sql.Select;

import com.csu.qxjh.user.pojo.ShoppingCart;

public interface ShoppingCartDao {
	void insert(ShoppingCart shoppingCart);//添加一条购物车信息
	List<ShoppingCart> selectByUserId(String userId);//根据用户id查找购物车信息
}
