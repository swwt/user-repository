package com.csu.qxjh.goods.dao.impl;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.csu.qxjh.goods.dao.GoodsCatagory2Dao;
import com.csu.qxjh.goods.pojo.GoodsCatagory1;
import com.csu.qxjh.goods.pojo.GoodsCatagory2;

@Repository
public class GoodsCatagory2DaoImpl implements GoodsCatagory2Dao{
	@Autowired
	private SessionFactory sessionFactory;
	
	private Session getSession(){
		return sessionFactory.getCurrentSession();
	}
	@Override
	public void insert(GoodsCatagory2 goodsCatagory2) {
		// TODO Auto-generated method stub
		getSession().save(goodsCatagory2);
	}

	@Override
	public GoodsCatagory2 selectById(int id) {
		// TODO Auto-generated method stub
		String hql="From GoodsCatagory2 where id=?";
		Query query=getSession().createQuery(hql).setInteger(0, id);
		GoodsCatagory2 goodsCatagory2=(GoodsCatagory2)query.uniqueResult();
		// TODO Auto-generated method stub
		return goodsCatagory2;
	}
	@Override
	public void update(GoodsCatagory2 goodsCatagory2) {
		// TODO Auto-generated method stub
		getSession().update(goodsCatagory2);
	}

}
