package com.csu.qxjh.sellor.dao.impl;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.csu.qxjh.sellor.dao.SellorDao;
import com.csu.qxjh.sellor.pojo.Sellor;
import com.csu.qxjh.util.base.BaseDaoImpl;

@Transactional
@Repository
public class SellorDaoImpl extends BaseDaoImpl<Sellor> implements SellorDao{
	@Autowired
	private SessionFactory sessionFactory;
	
	public Session getSession(){
		return sessionFactory.getCurrentSession();
	}
	@Override
	public Sellor selectById(String id) {
		return (Sellor) getSession().get(Sellor.class, id);
	}
	@Override
	public void insert(Sellor sellor) {
		// TODO Auto-generated method stub
		getSession().save(sellor);
	}

}
