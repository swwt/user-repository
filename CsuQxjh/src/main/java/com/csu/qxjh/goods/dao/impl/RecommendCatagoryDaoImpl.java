package com.csu.qxjh.goods.dao.impl;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.csu.qxjh.goods.dao.RecommendCatagoryDao;
import com.csu.qxjh.goods.pojo.RecommendCatagory;

@Repository
public class RecommendCatagoryDaoImpl implements RecommendCatagoryDao{

	
	@Autowired
	private SessionFactory sessionFactory;
	
	private Session getSession(){
		return sessionFactory.getCurrentSession();
	} 
	
	@Override
	public RecommendCatagory select() {
		// TODO Auto-generated method stub
		String hql="From RecommendCatagory";
		Query query=getSession().createQuery(hql);
		RecommendCatagory recommendCatagory=(RecommendCatagory)query.uniqueResult();
		return recommendCatagory;
	}

}
