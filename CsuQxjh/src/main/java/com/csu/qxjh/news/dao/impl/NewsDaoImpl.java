package com.csu.qxjh.news.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.csu.qxjh.news.dao.NewsDao;
import com.csu.qxjh.news.pojo.News;

@Repository
public class NewsDaoImpl implements NewsDao {
	@Autowired
	private SessionFactory sessionFactory;
	
	public Session getSession(){
		return sessionFactory.getCurrentSession();
	}
	@Override
	public List<News> selectAll() {
		// TODO Auto-generated method stub
		String hql="From News";
		Query query=(Query)getSession().createQuery(hql);
		List<News> newsList=query.list();
		return newsList;
	}

	@Override
	public News selectById(int id) {
		// TODO Auto-generated method stub
		String hql="From News news where news.id=?";
		News news=(News)getSession().createQuery(hql).setInteger(0, id).uniqueResult();
		return news;
	}
	@Override
	public void update(News news) {
		// TODO Auto-generated method stub
		getSession().update(news);
	}

}
