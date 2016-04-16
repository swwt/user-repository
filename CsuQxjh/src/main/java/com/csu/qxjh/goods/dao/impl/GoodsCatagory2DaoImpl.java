package com.csu.qxjh.goods.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.csu.qxjh.goods.dao.GoodsCatagory2Dao;
import com.csu.qxjh.goods.pojo.GoodsCatagory1;
import com.csu.qxjh.goods.pojo.GoodsCatagory2;

@Repository
public class GoodsCatagory2DaoImpl implements GoodsCatagory2Dao{
	@Autowired
	private SessionFactory sessionFactory;
	
	private Session getSession(){
		return sessionFactory.getCurrentSession();
	}
	@Override
	public void insert(GoodsCatagory2 goodsCatagory2) {
		// TODO Auto-generated method stub
		getSession().save(goodsCatagory2);
	}

	@Override
	public GoodsCatagory2 selectById(int id) {
		// TODO Auto-generated method stub
		String hql="From GoodsCatagory2 where id=?";
		Query query=getSession().createQuery(hql).setInteger(0, id);
		GoodsCatagory2 goodsCatagory2=(GoodsCatagory2)query.uniqueResult();
		// TODO Auto-generated method stub
		return goodsCatagory2;
	}
	@Override
	public void update(GoodsCatagory2 goodsCatagory2) {
		// TODO Auto-generated method stub
		getSession().update(goodsCatagory2);
	}
	@Override
	public List<GoodsCatagory2> selectAll() {
		// TODO Auto-generated method stub
		String hql="From GoodsCatagory2";
		Query query=getSession().createQuery(hql);
		List<GoodsCatagory2> catagory2_list=query.list();
		return catagory2_list;
	}
	@Override
	public List<GoodsCatagory2> selectByCatagory1Id(int id) {
		// TODO Auto-generated method stub
		String hql="From GoodsCatagory2 where goods_catagory_1_id=?";
		Query query=getSession().createQuery(hql).setInteger(0, id);
		List<GoodsCatagory2> catagory2_list=query.list();
		return catagory2_list;
	}
	@Override
	public List<GoodsCatagory2> selectByType(int type) {
		// TODO Auto-generated method stub
		String hql="From GoodsCatagory2 where goods_catagory_2_type=?";
		Query query=getSession().createQuery(hql).setInteger(0, type);
		List<GoodsCatagory2> catagory2_list=query.list();
		return catagory2_list;
	}
}
