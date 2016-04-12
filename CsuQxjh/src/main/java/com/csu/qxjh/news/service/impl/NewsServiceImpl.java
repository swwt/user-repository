package com.csu.qxjh.news.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Hibernate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.csu.qxjh.news.dao.NewsDao;
import com.csu.qxjh.news.pojo.News;
import com.csu.qxjh.news.service.NewsService;

@Transactional(propagation=Propagation.REQUIRED)
@Service
public class NewsServiceImpl implements NewsService{
	@Resource
	private NewsDao newsDao;
	@Override
	public List<News> selectAll() {
		// TODO Auto-generated method stub
		List<News> newsList=newsDao.selectAll();
		for(int i=0;i<newsList.size();i++){
			News news=newsList.get(i);
			news.setNewsComments(null);
		}
		return newsList;
	}

	@Override
	public News selectById(int id) {
		// TODO Auto-generated method stub
		News news=newsDao.selectById(id);
		Hibernate.initialize(news.getNewsComments());
		return news;
	}

}
