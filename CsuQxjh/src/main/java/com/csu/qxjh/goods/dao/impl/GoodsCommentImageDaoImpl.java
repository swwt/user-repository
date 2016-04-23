package com.csu.qxjh.goods.dao.impl;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.csu.qxjh.goods.dao.GoodsCommentImageDao;
import com.csu.qxjh.goods.pojo.GoodsCommentImage;


@Repository
public class GoodsCommentImageDaoImpl implements GoodsCommentImageDao{
	@Autowired
	private SessionFactory sessionFactory;
	
	public Session getSession(){
		return sessionFactory.getCurrentSession();
	}
	@Override
	public void insert(GoodsCommentImage goodsCommentImage) {
		// TODO Auto-generated method stub
		getSession().save(goodsCommentImage);
	}

}
