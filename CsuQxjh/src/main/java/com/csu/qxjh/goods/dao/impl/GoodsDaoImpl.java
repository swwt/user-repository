package com.csu.qxjh.goods.dao.impl;

import java.util.List;

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
	public List<Goods> selectByGoodsCatagory2(int goodsCatagoryId) {
		// TODO Auto-generated method stub
		String hql="From Goods where goods_catagory_2_id=?";
		Query query=getSession().createQuery(hql).setInteger(0, goodsCatagoryId);
		List<Goods> goodsList=(List<Goods>)query.list();
		return goodsList;
	}
	@Override
	public void insert(Goods goods) {
		// TODO Auto-generated method stub
		getSession().save(goods);
	}
	@Override
	public List<Goods> selectByGoodsCatagory2ByPrice(int goodsCatagoryId, int sequence) {
		// TODO Auto-generated method stub
		String hql="";
		if(sequence==0){//降序
			hql="From Goods s where s.goodsCatagory2.id=? order by s.goodsDetail.goods_detail_now_price DESC";
		}else if(sequence==1){//升序
			hql="From Goods s where s.goodsCatagory2.id=? order by s.goodsDetail.goods_detail_now_price";
		}
		Query query=getSession().createQuery(hql).setInteger(0, goodsCatagoryId);
		List<Goods>goodsList=query.list();
		return goodsList;
	}
	@Override
	public List<Goods> selectByGoodsCatagory2BySells(int goodsCatagoryId) {
		// TODO Auto-generated method stub
		String hql="From Goods s where s.goodsCatagory2.id=? order by s.goodsOrders.size DESC";
		Query query=getSession().createQuery(hql).setInteger(0, goodsCatagoryId);
		List<Goods>goodsList=query.list();
		return goodsList;
	}
	@Override
	public List<Goods> selectByNameOrderByPrice(String name, int sequence) {
		// TODO Auto-generated method stub
		String hql="";
		if(sequence==0){//降序
			hql="From Goods s where s.goods_name like ? order by s.goodsDetail.goods_detail_now_price DESC";
		}else if(sequence==1){//升序
			hql="From Goods s where s.goods_name like ? order by s.goodsDetail.goods_detail_now_price";
		}
		Query query=getSession().createQuery(hql).setString(0, "%"+name+"%");
		List<Goods>goodsList=query.list();
		return goodsList;
	}
	@Override
	public List<Goods> selectByNameOrderBySells(String name) {
		// TODO Auto-generated method stub
		String hql="From Goods s where s.goods_name like ? order by s.goodsOrders.size DESC";
		Query query=getSession().createQuery(hql).setString(0, "%"+name+"%");
		List<Goods>goodsList=query.list();
		return goodsList;
	}
	@Override
	public List<Goods> selectByName(String name) {
		// TODO Auto-generated method stub
		String hql="From Goods s where s.goods_name like ?";
		Query query=getSession().createQuery(hql).setString(0, "%"+name+"%");
		List<Goods>goodsList=query.list();
		return goodsList;
	}
	


}
