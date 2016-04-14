package com.csu.qxjh.user.service.impl;

import java.util.List;

import javax.annotation.Resource;

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
		return shoppingDao.selectByUserId(userId);
	}

}
