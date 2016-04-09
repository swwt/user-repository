package com.csu.qxjh.goods.dao.impl;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.csu.qxjh.goods.dao.OfferPromotionFullcutproductsDao;
import com.csu.qxjh.goods.pojo.OfferPromotionFullcutproducts;

@Repository
public class OfferPromotionFullcutproductsDaoImpl implements OfferPromotionFullcutproductsDao{
	@Autowired
	private SessionFactory sessionFactory;
	
	public Session getSession(){
		return sessionFactory.getCurrentSession();
	}
	@Override
	public void insert(OfferPromotionFullcutproducts offerPromotionFullcutproducts) {
		// TODO Auto-generated method stub
		getSession().save(offerPromotionFullcutproducts);
	}

}
