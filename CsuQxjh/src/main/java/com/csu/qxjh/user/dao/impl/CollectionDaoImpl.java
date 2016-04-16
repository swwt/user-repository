package com.csu.qxjh.user.dao.impl;



import org.hibernate.Query;
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
	@Override
	public Collection selectById(int id) {
		// TODO Auto-generated method stub
		String hql="From Collection coll where coll.id=?";
		Query query=getSession().createQuery(hql).setInteger(0, id);
		Collection collection=(Collection)query.uniqueResult();
		return collection;
	}
	
	
}
