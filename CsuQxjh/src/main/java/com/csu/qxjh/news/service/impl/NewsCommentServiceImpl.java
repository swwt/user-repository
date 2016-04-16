package com.csu.qxjh.news.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.csu.qxjh.news.dao.NewsCommentDao;
import com.csu.qxjh.news.pojo.NewsComment;
import com.csu.qxjh.news.service.NewsCommentService;
import com.csu.qxjh.util.DateUtil;
@Transactional(propagation=Propagation.REQUIRED)
@Service
public class NewsCommentServiceImpl implements NewsCommentService {
	@Resource
	private NewsCommentDao newsCommentDao;
	@Override
	public void insert(NewsComment newsComment) {
		newsComment.setNews_comment_time(DateUtil.getDate());//评论设置时间
		newsCommentDao.insert(newsComment);		
	}

}
