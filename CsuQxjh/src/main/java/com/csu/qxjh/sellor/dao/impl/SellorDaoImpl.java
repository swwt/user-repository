package com.csu.qxjh.sellor.dao.impl;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.csu.qxjh.sellor.dao.SellorDao;
import com.csu.qxjh.sellor.pojo.Sellor;

@Repository
public class SellorDaoImpl implements SellorDao{
	@Autowired
	private SessionFactory sessionFactory;
	
	public Session getSession(){
		return sessionFactory.getCurrentSession();
	}
	@Override
	public Sellor selectById(String id) {
		// TODO Auto-generated method stub
		String hql="From Sellor where id=?";
		Query query=getSession().createQuery(hql).setString(0, id);
		Sellor sellor=(Sellor)query.uniqueResult();
		return sellor;
	}

}
