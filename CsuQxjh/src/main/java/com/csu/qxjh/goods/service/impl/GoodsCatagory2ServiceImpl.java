package com.csu.qxjh.goods.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.mvc.method.annotation.RequestResponseBodyMethodProcessor;

import com.csu.qxjh.goods.dao.GoodsCatagory2Dao;
import com.csu.qxjh.goods.dao.RecommendCatagoryDao;
import com.csu.qxjh.goods.pojo.GoodsCatagory1;
import com.csu.qxjh.goods.pojo.GoodsCatagory2;
import com.csu.qxjh.goods.service.GoodsCatagory2Service;

//如果有事务,那么加入事务,没有的话新建一个
@Transactional(propagation=Propagation.REQUIRED)
@Service
public class GoodsCatagory2ServiceImpl implements GoodsCatagory2Service{
	@Resource
	private GoodsCatagory2Dao goodsCatagory2Dao;
	@Resource
	private RecommendCatagoryDao recommendCatagoryDao;
	@Override
	public void add(GoodsCatagory2 goodsCatagory2) {
		// TODO Auto-generated method stub
		goodsCatagory2.setGoods_catagory_2_type(0);//初始化为0，即代表普通类
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

	@Override
	public List<GoodsCatagory2> getAll() {
		// TODO Auto-generated method stub
		return goodsCatagory2Dao.selectAll();
	}

	@Override
	public List<GoodsCatagory2> getByCatagory1Id(int id) {
		List<GoodsCatagory2> list=goodsCatagory2Dao.selectByCatagory1Id(id);
		return list;
	}

	@Override
	public List<GoodsCatagory2> getSpecialCatagory2() {
		// TODO Auto-generated method stub
		List<GoodsCatagory2> specialList=goodsCatagory2Dao.selectByType(1);
		return specialList;
	}

	@Override
	public List<GoodsCatagory2> getHotCatagory2() {
		// TODO Auto-generated method stub
		List<GoodsCatagory2> hotList=goodsCatagory2Dao.selectByType(2);
		return hotList;
	}

	@Override
	public String getRecommendCatagoryImage() {
		// TODO Auto-generated method stub
		return recommendCatagoryDao.select().getRecommend_catagory_image();
	}
	
}
