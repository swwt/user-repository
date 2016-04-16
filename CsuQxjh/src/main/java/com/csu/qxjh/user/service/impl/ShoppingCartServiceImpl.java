package com.csu.qxjh.user.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Hibernate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.csu.qxjh.user.dao.ShoppingCartDao;
import com.csu.qxjh.user.pojo.ShoppingCart;
import com.csu.qxjh.user.service.ShoppingCartService;
import com.csu.qxjh.util.DateUtil;
@Transactional(propagation = Propagation.REQUIRED)
@Service
public class ShoppingCartServiceImpl implements ShoppingCartService{
	@Resource
	private ShoppingCartDao shoppingDao;
	@Override
	public void addShoppongCart(ShoppingCart shoppingCart) {
		// TODO Auto-generated method stub
		shoppingCart.setShopping_cart_time(DateUtil.getDate());
		shoppingDao.insert(shoppingCart);
	}
	@Override
	public List<ShoppingCart> getShoppingCart(String userId) {
		// TODO Auto-generated method stub
		List<ShoppingCart> shoppingCarts=shoppingDao.selectByUserId(userId);
		for(int i=0;i<shoppingCarts.size();i++){
			ShoppingCart shoppingCart=shoppingCarts.get(i);
			Hibernate.initialize(shoppingCart.getGoods());
		}
		return shoppingCarts;
	}
	@Override
	public List<ShoppingCart> getShoppingCartByGoodsPrice(String userId,int goodsId, double price) {
		// TODO Auto-generated method stub
		return shoppingDao.selectByGoodsPrice(userId,goodsId, price);
	}
	@Override
	public void deleteShoppingCarts(List<ShoppingCart> shoppingCarts) {
		// TODO Auto-generated method stub
		for(int i=0;i<shoppingCarts.size();i++){
			shoppingDao.deleteShoppingCart(shoppingCarts.get(i));
		}
	}
	@Override
	public ShoppingCart getById(int id) {
		// TODO Auto-generated method stub
		return shoppingDao.selectById(id);
	}

}
