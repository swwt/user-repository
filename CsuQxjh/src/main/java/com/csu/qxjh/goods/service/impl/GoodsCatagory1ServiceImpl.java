package com.csu.qxjh.goods.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.csu.qxjh.goods.dao.GoodsCatagory1Dao;
import com.csu.qxjh.goods.pojo.GoodsCatagory1;
import com.csu.qxjh.goods.service.GoodsCatagory1Service;

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

}
