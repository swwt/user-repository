package com.csu.qxjh.news.service.impl;

import java.util.Comparator;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;
import java.util.TreeMap;

import javax.annotation.Resource;

import org.hibernate.Hibernate;
import org.hibernate.cfg.HbmBinder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.csu.qxjh.goods.pojo.GoodsComment;
import com.csu.qxjh.news.dao.NewsDao;
import com.csu.qxjh.news.pojo.News;
import com.csu.qxjh.news.pojo.NewsComment;
import com.csu.qxjh.news.service.NewsService;
import com.csu.qxjh.user.pojo.User;
import com.csu.qxjh.util.StringUtil;

@Transactional(propagation=Propagation.REQUIRED)
@Service
public class NewsServiceImpl implements NewsService{
	@Resource
	private NewsDao newsDao;
	@Override
	public List<News> selectAll() {
		// TODO Auto-generated method stub
		List<News> newsList=newsDao.selectAll();		
		return newsList;
	}

	@Override
	public News selectById(int id) {
		// TODO Auto-generated method stub
		News news=newsDao.selectById(id);
		//Hibernate.initialize(news.getNewsComments());
		news.setNewsComments(getCommentByTime(news.getNewsComments()));
		return news;
	}
	public Set<NewsComment> getCommentByTime(Set<NewsComment> newsComments){//将评价按时间来排序
		Set<NewsComment> newsCommentList=new LinkedHashSet<>();
		TreeMap<Long, NewsComment> map=new TreeMap<>(new MapKeyTimeComparator());
		Iterator<NewsComment> iterator1=newsComments.iterator();
		while(iterator1.hasNext()){
			NewsComment newsComment=iterator1.next();
			String time=newsComment.getNews_comment_time();
			String timeNew=StringUtil.dealDateString(time);
			map.put(Long.parseLong(timeNew), newsComment);
		}
		Iterator<NewsComment> iterator2=map.values().iterator();
		while(iterator2.hasNext()){
			newsCommentList.add(iterator2.next());
		}
		return newsCommentList;
	}

	@Override
	public void updateNews(News news) {
		// TODO Auto-generated method stub
		newsDao.update(news);
	}

}
class MapKeyTimeComparator implements Comparator<Long>{
	@Override
	public int compare(Long o1, Long o2) {
		// TODO Auto-generated method stub
		return -o1.compareTo(o2);
	}
	
}