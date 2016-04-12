package com.csu.qxjh.news.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.csu.qxjh.news.service.NewsCommentService;
@Transactional(propagation=Propagation.REQUIRED)
@Service
public class NewsCommentServiceImpl implements NewsCommentService {

}
