package com.csu.qxjh.user.dao.impl;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.csu.qxjh.user.dao.UserAddressDao;
import com.csu.qxjh.user.pojo.UserAddress;

@Repository
public class UserAddressDaoImpl implements UserAddressDao{
	@Autowired
	private SessionFactory sessionFactory;
	
	public Session getSession(){
		return sessionFactory.getCurrentSession();
	}

	@Override
	public void insert(UserAddress userAddress) {
		// TODO Auto-generated method stub
		getSession().save(userAddress);
	}
}
