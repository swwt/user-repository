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

}
