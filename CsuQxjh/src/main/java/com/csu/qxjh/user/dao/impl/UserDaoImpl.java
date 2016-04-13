package com.csu.qxjh.user.dao.impl;




import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.csu.qxjh.user.dao.UserDao;
import com.csu.qxjh.user.pojo.User;
import com.csu.qxjh.util.base.BaseDaoImpl;

@Transactional
@Repository
public class UserDaoImpl extends BaseDaoImpl<User> implements UserDao{

	@Autowired
	private SessionFactory sessionFactory;
	
	private Session getSession(){
		return sessionFactory.getCurrentSession();
	}
	
	public void insert(User user){
		getSession().save(user);
	}
	
	public void update(User user){
		getSession().update(user);
	}
	
	public User getById(String id) {
		// TODO Auto-generated method stub
		String hql="From User where id=?";
		Query query=getSession().createQuery(hql).setString(0,id);
		User user=(User)query.uniqueResult();
		return user;
	}
	public User getByNamePassword(String user_login_name, String user_password) {
		String hql="From User where user_login_name=? and user_password=?";
		Query query=getSession().createQuery(hql).setString(0, user_login_name).setString(1, user_password);
		User user=(User)query.uniqueResult();
		return user;
	}
	public User getByName(String user_login_name) {
		// TODO Auto-generated method stub
		String hql="From User where user_login_name=?";
		Query query=getSession().createQuery(hql).setString(0, user_login_name);
		User user=(User)query.uniqueResult();
		return user;
	}

	@Override
	public User getByPhone(String user_phone) {
		// TODO Auto-generated method stub
		String hql="From User where user_phone=?";
		Query query=getSession().createQuery(hql).setString(0, user_phone);
		User user=(User)query.uniqueResult();
		return user;
	}

	@Override
	public User getByPhonePassword(String user_phone, String user_password) {
		// TODO Auto-generated method stub
		String hql="From User where user_phone=? and user_password=?";
		Query query=getSession().createQuery(hql).setString(0, user_phone).setString(1, user_password);
		User user=(User)query.uniqueResult();
		return user;
	}

}
