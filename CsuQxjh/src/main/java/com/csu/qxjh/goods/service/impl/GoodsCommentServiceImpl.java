package com.csu.qxjh.goods.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.csu.qxjh.goods.dao.GoodsCommentDao;
import com.csu.qxjh.goods.pojo.GoodsComment;
import com.csu.qxjh.goods.service.GoodsCommentService;
import com.csu.qxjh.util.DateUtil;
@Transactional(propagation=Propagation.REQUIRED)
@Service
public class GoodsCommentServiceImpl implements GoodsCommentService{
	@Resource
	private GoodsCommentDao goodsCommentDao;

	@Override
	public void addComment(GoodsComment goodsComment) {
		// TODO Auto-generated method stub
		goodsComment.setGoods_comment_time(DateUtil.getDate());
		goodsCommentDao.insert(goodsComment);
	}
	
	
}
