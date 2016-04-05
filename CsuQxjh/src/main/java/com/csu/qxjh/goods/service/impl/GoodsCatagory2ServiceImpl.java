package com.csu.qxjh.goods.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.mvc.method.annotation.RequestResponseBodyMethodProcessor;

import com.csu.qxjh.goods.dao.GoodsCatagory2Dao;
import com.csu.qxjh.goods.pojo.GoodsCatagory1;
import com.csu.qxjh.goods.pojo.GoodsCatagory2;
import com.csu.qxjh.goods.service.GoodsCatagory2Service;

@Service
public class GoodsCatagory2ServiceImpl implements GoodsCatagory2Service{
	@Resource
	private GoodsCatagory2Dao goodsCatagory2Dao;
	
	@Override
	public void add(GoodsCatagory2 goodsCatagory2) {
		// TODO Auto-generated method stub
		goodsCatagory2Dao.insert(goodsCatagory2);
	}

	@Override
	public GoodsCatagory2 getById(int id) {
		// TODO Auto-generated method stub
		return goodsCatagory2Dao.selectById(id);
	}

	@Override
	public void update(GoodsCatagory2 goodsCatagory2) {
		// TODO Auto-generated method stub
		goodsCatagory2Dao.update(goodsCatagory2);
	}

}
