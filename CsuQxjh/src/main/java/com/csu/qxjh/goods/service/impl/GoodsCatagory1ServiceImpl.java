package com.csu.qxjh.goods.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Hibernate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.csu.qxjh.goods.dao.GoodsCatagory1Dao;
import com.csu.qxjh.goods.pojo.GoodsCatagory1;
import com.csu.qxjh.goods.pojo.GoodsCatagory2;
import com.csu.qxjh.goods.service.GoodsCatagory1Service;

//如果有事务,那么加入事务,没有的话新建一个
@Transactional(propagation=Propagation.REQUIRED)
@Service
public class GoodsCatagory1ServiceImpl implements GoodsCatagory1Service{

	@Resource
	private GoodsCatagory1Dao goodsCatagory1Dao;
	@Override
	public void add(GoodsCatagory1 goodsCatagory1) {
		// TODO Auto-generated method stub
		goodsCatagory1Dao.insert(goodsCatagory1);
	}

	@Override
	public GoodsCatagory1 getById(int id) {
		// TODO Auto-generated method stub
		return goodsCatagory1Dao.selectById(id);
	}

	@Override
	public void update(GoodsCatagory1 goodsCatagory1) {
		// TODO Auto-generated method stub
		goodsCatagory1Dao.update(goodsCatagory1);
	}

	@Override
	public List<GoodsCatagory1> getAll() {
		// TODO Auto-generated method stub
		List<GoodsCatagory1> catagory1list=goodsCatagory1Dao.selectAll();
		for(int i=0;i<catagory1list.size();i++){
			Hibernate.initialize(catagory1list.get(i).getGoodsCatagory2List());//手动加载
		}
		return catagory1list;
	}

}
