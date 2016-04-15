package com.csu.qxjh.sellor.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.csu.qxjh.admin.pojo.Admin;
import com.csu.qxjh.sellor.dao.SellorDao;
import com.csu.qxjh.sellor.pojo.Sellor;
import com.csu.qxjh.util.base.BaseDaoImpl;

@Transactional
@Repository
public class SellorDaoImpl extends BaseDaoImpl<Sellor> implements SellorDao {

	private static final String SELLER_LOGIN_NAME = "sellor_login_name";
	private static final String SELLOR_PASSWORD = "sellor_password";

	@Autowired
	private SessionFactory sessionFactory;

	public Session getSession() {
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

	@Override
	public boolean isLoginNameExist(String sellor_login_name) {
		// TODO Auto-generated method stub

		Map<String, String> conditions = new HashMap<>();
		String[] orderConditions = { "id" };
		List<Sellor> sellors = pageQuery(Sellor.class, conditions, 1, 1,null, false);
		if (sellors.size() != 1) {
			return false;
		} else {
			return true;
		}
	}

	@Override
	public Sellor sellorLogin(String sellor_login_name, String sellor_password) {
		// TODO Auto-generated method stub

		Map<String, String> conditions = new HashMap<>();
		conditions.put(this.SELLER_LOGIN_NAME, sellor_login_name);
		conditions.put(this.SELLOR_PASSWORD, sellor_password);
		List<Sellor> sellors = pageQuery(Sellor.class, conditions, 1, 1, null,false);
		if (sellors.size() != 1) {
			return null;
		} else {
			return sellors.get(0);
		}
	}

}
