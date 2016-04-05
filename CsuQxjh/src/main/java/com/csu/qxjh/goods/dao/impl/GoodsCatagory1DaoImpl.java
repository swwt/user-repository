package com.csu.qxjh.goods.dao.impl;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.csu.qxjh.goods.dao.GoodsCatagory1Dao;
import com.csu.qxjh.goods.pojo.GoodsCatagory1;

@Repository
public class GoodsCatagory1DaoImpl implements GoodsCatagory1Dao{
	
	@Autowired
	private SessionFactory sessionFactory;
	
	private Session getSession(){
		return sessionFactory.getCurrentSession();
	}
	@Override
	public void insert(GoodsCatagory1 goodsCatagory1) {
		// TODO Auto-generated method stub
		getSession().save(goodsCatagory1);
	}

	@Override
	public GoodsCatagory1 selectById(int id) {
		String hql="From GoodsCatagory1 where id=?";
		Query query=getSession().createQuery(hql).setInteger(0, id);
		GoodsCatagory1 goodsCatagory1=(GoodsCatagory1)query.uniqueResult();
		// TODO Auto-generated method stub
		return goodsCatagory1;
	}
	@Override
	public void update(GoodsCatagory1 goodsCatagory1) {
		// TODO Auto-generated method stub
		getSession().update(goodsCatagory1);
	}

}
