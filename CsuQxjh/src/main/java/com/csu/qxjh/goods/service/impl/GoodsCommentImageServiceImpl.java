package com.csu.qxjh.goods.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.csu.qxjh.goods.dao.GoodsCommentImageDao;
import com.csu.qxjh.goods.pojo.GoodsCommentImage;
import com.csu.qxjh.goods.service.GoodsCommentImageService;
import com.csu.qxjh.util.DateUtil;

@Transactional(propagation=Propagation.REQUIRED)
@Service
public class GoodsCommentImageServiceImpl implements GoodsCommentImageService{
	@Resource
	private GoodsCommentImageDao goodsCommentImageDao;

	@Override
	public void addCommentImage(GoodsCommentImage goodsCommentImage) {
		// TODO Auto-generated method stub
		goodsCommentImage.setGoods_comment_time(DateUtil.getDate());
		goodsCommentImageDao.insert(goodsCommentImage);
	}
	
}
