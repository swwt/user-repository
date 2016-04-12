package com.csu.qxjh.news.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.csu.qxjh.news.dao.NewsDao;
import com.csu.qxjh.news.pojo.News;
import com.csu.qxjh.news.service.NewsService;

@Service
public class NewsServiceImpl implements NewsService{
	@Resource
	private NewsDao newsDao;
	@Override
	public List<News> selectAll() {
		// TODO Auto-generated method stub
		return newsDao.selectAll();
	}

	@Override
	public News selectById(int id) {
		// TODO Auto-generated method stub
		return newsDao.selectById(id);
	}

}
