package com.csu.qxjh.news.dao.impl;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.csu.qxjh.news.dao.NewsCommentDao;
import com.csu.qxjh.news.pojo.NewsComment;

@Repository
public class NewsCommentDaoOImpl implements NewsCommentDao {
	@Autowired
	private SessionFactory sessionFactory;
	
	public Session getSession(){
		return sessionFactory.getCurrentSession();
	}
	@Override
	public void insert(NewsComment newsComment) {
		// TODO Auto-generated method stub
		getSession().save(newsComment);
	}

}
