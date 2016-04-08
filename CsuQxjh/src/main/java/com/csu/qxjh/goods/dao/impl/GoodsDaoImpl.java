package com.csu.qxjh.goods.dao.impl;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.csu.qxjh.goods.dao.GoodsDao;
import com.csu.qxjh.goods.pojo.Goods;

@Repository
public class GoodsDaoImpl implements GoodsDao{
	@Autowired
	private SessionFactory sessionFactory;
	
	public Session getSession(){
		return sessionFactory.getCurrentSession();
	}
	@Override
	public Goods selectById(int id) {
		// TODO Auto-generated method stub
		String hql="From Goods where id=?";
		Query query=getSession().createQuery(hql).setInteger(0, id);
		Goods goods=(Goods)query.uniqueResult();
		return goods;
	}

	@Override
	public Goods selectByGoodsCatagory2(int goodsCatagoryId) {
		// TODO Auto-generated method stub
		String hql="From Goods where goods_catagory_2_id=?";
		Query query=getSession().createQuery(hql).setInteger(0, goodsCatagoryId);
		Goods goods=(Goods)query.uniqueResult();
		return goods;
	}
	@Override
	public void insert(Goods goods) {
		// TODO Auto-generated method stub
		getSession().save(goods);
	}

}
