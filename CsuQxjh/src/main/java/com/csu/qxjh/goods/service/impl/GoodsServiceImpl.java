package com.csu.qxjh.goods.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.csu.qxjh.goods.dao.GoodsDao;
import com.csu.qxjh.goods.pojo.Goods;
import com.csu.qxjh.goods.service.GoodsService;

@Service
public class GoodsServiceImpl implements GoodsService{
	@Resource
	private GoodsDao goodsDao;
	@Override
	public Goods getById(int id) {
		// TODO Auto-generated method stub
		return goodsDao.selectById(id);
	}

	@Override
	public Goods getByCatagory2Id(int catagoryId) {
		// TODO Auto-generated method stub
		return goodsDao.selectByGoodsCatagory2(catagoryId);
	}

	@Override
	public void addGoods(Goods goods) {
		// TODO Auto-generated method stub
		goods.setGoods_check_status(0);//卖家初次创建,审核状态初始化为0，表示未审核
		goods.setGoods_on_sale_status(0);//卖家初次创建，初始化上下架状态为0
		goodsDao.insert(goods);
	}

}
