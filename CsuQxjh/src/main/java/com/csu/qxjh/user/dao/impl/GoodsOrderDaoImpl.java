package com.csu.qxjh.user.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.csu.qxjh.user.dao.GoodsOrderDao;
import com.csu.qxjh.user.pojo.GoodsOrder;
import com.csu.qxjh.util.base.BaseDaoImpl;

@Repository
public class GoodsOrderDaoImpl extends BaseDaoImpl<GoodsOrder> implements GoodsOrderDao{
	@Autowired
	private SessionFactory sessionFactory;
	
	public Session getSession(){
		return sessionFactory.getCurrentSession();
	}
	@Override
	public void insert(GoodsOrder goodsOrder) {
		// TODO Auto-generated method stub
		getSession().save(goodsOrder);
	}
	@Override
	public void uddate(GoodsOrder goodsOrder) {
		// TODO Auto-generated method stub
		getSession().update(goodsOrder);
	}
	@Override
	public GoodsOrder selectById(String id) {
		// TODO Auto-generated method stub
		String hql="From GoodsOrder goodsOrder where goodsOrder.id=?";
		GoodsOrder goodsOrder=(GoodsOrder)getSession().createQuery(hql).setString(0, id).uniqueResult();
		return goodsOrder;
	}
	@Override
	public List<GoodsOrder> selectOrderByNoPay(String userId) {
		// TODO Auto-generated method stub
		String hql="From GoodsOrder goodsOrder where goodsOrder.goods_order_payment_status=? and goodsOrder.user.id=?";
		List<GoodsOrder> goodsOrders=
				getSession().createQuery(hql).setInteger(0, 0).setString(0, userId).list();
		return goodsOrders;
	}
	@Override
	public List<GoodsOrder> selectOrderByNoGet(String userId) {
		// TODO Auto-generated method stub
		String hql="From GoodsOrder goodsOrder where goodsOrder.goods_order_gain_status=? and goodsOrder.user.id=?";
		List<GoodsOrder> goodsOrders=
				getSession().createQuery(hql).setInteger(0, 0).setString(0, userId).list();
		return goodsOrders;
	}
	@Override 
	public List<GoodsOrder> selectOrderByNoComment(String userId) {
		// TODO Auto-generated method stub
		String hql="From GoodsOrder goodsOrder where goodsOrder.goods_order_evaluate_status=? and goodsOrder.user.id=?";
		List<GoodsOrder> goodsOrders=
				getSession().createQuery(hql).setInteger(0, 0).setString(0, userId).list();
		return goodsOrders;
	}
	@Override
	public List<GoodsOrder> selectOrderByComplete(String userId) {
		// TODO Auto-generated method stub
		String hql="From GoodsOrder goodsOrder where "+
		"goodsOrder.goods_order_evaluate_status=? and goodsOrder.goods_order_payment_status=? "+
				"and goodsOrder.goods_order_gain_status=? and goodsOrder.user.id=?";
		List<GoodsOrder> goodsOrders=
				getSession().createQuery(hql).setInteger(0, 1)
				.setInteger(1, 1)
				.setInteger(2, 1)
				.setString(3, userId).list();
		return goodsOrders;
	}

}
