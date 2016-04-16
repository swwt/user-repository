package com.csu.qxjh.user.dao.impl;

import java.util.List;

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

	@Override
	public List<UserAddress> selectAllByUserId(String userId) {
		// TODO Auto-generated method stub
		String hql="From UserAddress address where address.user.id=?";
		List<UserAddress> userAddresses=getSession().createQuery(hql).setString(0, userId).list();
		return userAddresses;
	}

	@Override
	public void update(UserAddress userAddress) {
		// TODO Auto-generated method stub
		getSession().update(userAddress);
	}

	@Override
	public UserAddress getByDefaultByUserId(String userId) {
		// TODO Auto-generated method stub
		String hql="From UserAddress address where address.user.id=? and user_address_type=1";
		UserAddress userAddress=(UserAddress)getSession().createQuery(hql).setString(0, userId).uniqueResult();
		return userAddress;
	}
}
