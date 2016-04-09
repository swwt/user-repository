package com.csu.qxjh.user.dao.impl;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.csu.qxjh.user.dao.CollectionDao;
import com.csu.qxjh.user.pojo.Collection;

@Repository
public class CollectionDaoImpl implements CollectionDao{
	@Autowired
	private SessionFactory sessionFactory;
	
	private Session getSession(){
		return sessionFactory.getCurrentSession();
	}
	@Override
	public void insert(Collection collection) {
		// TODO Auto-generated method stub
		getSession().save(collection);
	}

}
