package com.csu.qxjh.user.dao.impl;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.csu.qxjh.user.dao.GoodsOrderDao;
import com.csu.qxjh.user.pojo.GoodsOrder;
import com.csu.qxjh.util.base.BaseDaoImpl;

@Repository
public class GoodsOrderDaoImpl extends BaseDaoImpl<GoodsOrder> implements GoodsOrderDao{
	@Autowired
	private SessionFactory sessionFactory;
	
	public Session getSession(){
		return sessionFactory.getCurrentSession();
	}
	@Override
	public void insert(GoodsOrder goodsOrder) {
		// TODO Auto-generated method stub
		getSession().save(goodsOrder);
	}

}
