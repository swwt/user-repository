package com.csu.qxjh.user.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.csu.qxjh.user.dao.ShoppingCartDao;
import com.csu.qxjh.user.pojo.ShoppingCart;
import com.csu.qxjh.user.service.ShoppingCartService;
@Transactional(propagation = Propagation.REQUIRED)
@Service
public class ShoppingCartServiceImpl implements ShoppingCartService{
	@Resource
	private ShoppingCartDao shoppingDao;
	@Override
	public void addShoppongCart(ShoppingCart shoppingCart) {
		// TODO Auto-generated method stub
		shoppingDao.insert(shoppingCart);
	}

}
