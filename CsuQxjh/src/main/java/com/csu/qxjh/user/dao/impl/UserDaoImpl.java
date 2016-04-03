package com.csu.qxjh.user.dao.impl;




import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.csu.qxjh.user.dao.UserDao;
import com.csu.qxjh.user.pojo.User;

@Transactional
@Repository
public class UserDaoImpl implements UserDao{

	@Autowired
	private SessionFactory sessionFactory;
	
	private Session getSession(){
		return sessionFactory.getCurrentSession();
	}
	public void insert(User user){
		getSession().save(user);
	}
	
	public User getById(String id) {
		// TODO Auto-generated method stub
		String hql="From User where id=?";
		Query query=getSession().createQuery(hql).setString(0,id);
		User user=(User)query.uniqueResult();
		return user;
	}

}
