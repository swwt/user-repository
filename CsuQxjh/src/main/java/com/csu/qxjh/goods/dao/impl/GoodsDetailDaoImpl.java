package com.csu.qxjh.goods.dao.impl;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.csu.qxjh.goods.dao.GoodsDetailDao;
import com.csu.qxjh.goods.pojo.GoodsDetail;

@Repository
public class GoodsDetailDaoImpl implements GoodsDetailDao{
	@Autowired
	private SessionFactory sessionFactory;
	
	public Session getSession(){
		return sessionFactory.getCurrentSession();
	}
	@Override
	public void insert(GoodsDetail goodsDetail) {
		// TODO Auto-generated method stub
		getSession().save(goodsDetail);
	}

}
