package com.csu.qxjh.user.service;

import java.util.List;

import com.csu.qxjh.user.pojo.ShoppingCart;

public interface ShoppingCartService {
	void addShoppongCart(ShoppingCart shoppingCart);
	List<ShoppingCart> getShoppingCart(String userId);
}
