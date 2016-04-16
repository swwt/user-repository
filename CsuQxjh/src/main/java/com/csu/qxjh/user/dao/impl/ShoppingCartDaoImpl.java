package com.csu.qxjh.user.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.csu.qxjh.user.dao.ShoppingCartDao;
import com.csu.qxjh.user.pojo.ShoppingCart;

@Repository
public class ShoppingCartDaoImpl implements ShoppingCartDao{
	@Autowired
	private SessionFactory sessionFactory;
	
	public Session getSession(){
		return sessionFactory.getCurrentSession();
	}
	@Override
	public void insert(ShoppingCart shoppingCart) {
		// TODO Auto-generated method stub
		getSession().save(shoppingCart);
	}
	@Override
	public List<ShoppingCart> selectByUserId(String userId) {
		// TODO Auto-generated method stub
		String hql="From ShoppingCart shop where shop.user.id=?";
		List<ShoppingCart> list=getSession().createQuery(hql).setString(0, userId).list();
		return list;
	}
	@Override
	public List<ShoppingCart> selectByGoodsPrice(String userId,int goodsId, double price) {
		// TODO Auto-generated method stub
		String hql="From ShoppingCart shop where shop.goods.id=? and shop.shopping_cart_price=? and shop.user.id=?";		
		List<ShoppingCart> shoppingCarts
		=getSession().createQuery(hql)
		.setInteger(0, goodsId).setDouble(1, price)
		.setString(2, userId).list();
		return shoppingCarts;
	}
	@Override
	public void deleteShoppingCart(ShoppingCart shoppingCart) {
		// TODO Auto-generated method stub
		getSession().delete(shoppingCart);
	}
	@Override
	public ShoppingCart selectById(int id) {
		// TODO Auto-generated method stub
		String hql="From ShoppingCart shop where shop.id=?";
		ShoppingCart shoppingCart=(ShoppingCart)getSession().createQuery(hql).setInteger(0, id).uniqueResult();
		return shoppingCart;
	}

}
