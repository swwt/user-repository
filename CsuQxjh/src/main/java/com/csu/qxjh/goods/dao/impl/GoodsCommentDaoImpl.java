package com.csu.qxjh.goods.dao.impl;

import java.util.List;

import org.hibernate.Query;
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
	
//	@Override
//	public List<GoodsComment> selectByGoodsId(int goodsId) {
//		//String hql="From GoodsComment"
//		// TODO Auto-generated method stub
//		return null;
//	}

	@Override
	public int selectGrade(int goodsId, int start, int end) {
		// TODO Auto-generated method stub
		String hql="select count(*) From GoodsComment com where com.goods.id=? and com.goods_comment_grade between ? and ?";
		Query query=getSession().createQuery(hql).setInteger(0, goodsId).setInteger(1, start).setInteger(2, end);
		int amount=(int)((Long)query.uniqueResult()).longValue();		
		return amount;
	}

	@Override
	public void insert(GoodsComment goodsComment) {
		// TODO Auto-generated method stub
		getSession().save(goodsComment);
	}

	@Override
	public GoodsComment selectById(int id) {
		// TODO Auto-generated method stub
		String hql="From GoodsComment com where com.id=?";
		Query query=getSession().createQuery(hql).setInteger(0, id);
		GoodsComment goodsComment=(GoodsComment)query.uniqueResult();	
		return goodsComment;
	}

	@Override
	public void update(GoodsComment goodsComment) {
		// TODO Auto-generated method stub
		getSession().update(goodsComment);
	}



	
}
