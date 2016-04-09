package com.csu.qxjh.goods.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.csu.qxjh.goods.dao.GoodsCommentDao;
import com.csu.qxjh.goods.pojo.GoodsComment;

@Repository
public class GoodsCommentDaoImpl implements GoodsCommentDao{

	@Autowired
	private SessionFactory sessionFactory;
	
	public Session getSession(){
		return sessionFactory.getCurrentSession();
	}
	
	@Override
	public List<GoodsComment> selectByGoodsId(int goodsId) {
		//String hql="From GoodsComment"
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int selectGrade(int id) {
		// TODO Auto-generated method stub
		return 0;
	}

}
