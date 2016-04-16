package com.csu.qxjh.news.dao;

import java.util.List;

import com.csu.qxjh.news.pojo.News;

public interface NewsDao {
	List<News> selectAll();//查询所有的公益项目信息
	News selectById(int id);//根据主键查询对应的公益项目信息
	void update(News news);//更新新闻信息
}
