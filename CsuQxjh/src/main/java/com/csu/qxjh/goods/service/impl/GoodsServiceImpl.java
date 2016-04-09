package com.csu.qxjh.goods.service.impl;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.csu.qxjh.goods.dao.GoodsCommentDao;
import com.csu.qxjh.goods.dao.GoodsDao;
import com.csu.qxjh.goods.pojo.Goods;
import com.csu.qxjh.goods.pojo.GoodsComment;
import com.csu.qxjh.goods.service.GoodsService;

@Transactional(propagation=Propagation.REQUIRED)
@Service
public class GoodsServiceImpl implements GoodsService{
	@Resource
	private GoodsDao goodsDao;
	@Resource
	private GoodsCommentDao goodsCommentDao;
	@Override
	public Goods getById(int id) {
		// TODO Auto-generated method stub
		return goodsDao.selectById(id);
	}

	@Override
	public List<Goods> getByCatagory2Id(int catagoryId) {
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

	@Override
	public List<Goods> getByCatagory2Sellors(int catagoryId) {
		// TODO Auto-generated method stub
		return goodsDao.selectByGoodsCatagory2BySells(catagoryId);
	}

	@Override
	public List<Goods> getByCatagory2PriceDown(int catagoryId) {
		// TODO Auto-generated method stub
		return goodsDao.selectByGoodsCatagory2ByPrice(catagoryId, 0);
	}

	@Override
	public List<Goods> getByCatagory2PriceUp(int catagoryId) {
		// TODO Auto-generated method stub
		return goodsDao.selectByGoodsCatagory2ByPrice(catagoryId, 1);
	}

	@Override
	public List<Goods> getByCatagory2ZongHe(int catagoryId) {//综合排序，按照销量和好评率
		// TODO Auto-generated method stub
		List<Goods> goodsList=goodsDao.selectByGoodsCatagory2(catagoryId);
		Map<Double,Goods> map=new TreeMap<>(new MapKeyComparator());
		List<Goods> goodsListNew=new ArrayList<>();
		for(int i=0;i<goodsList.size();i++){
			Goods goods=goodsList.get(i);
			List<GoodsComment> goodsComments=goodsCommentDao.selectByGoodsId(goods.getId());
			int total=0;
			for(int j=0;j<goodsComments.size();j++){
				total=total+goodsComments.get(i).getGoods_comment_grade();
			}
			goods.setGoods_grade(total/goodsList.size());
			map.put((goods.getGoods_grade()/5.00)*goods.getGoodsOrders().size(), goods);
		}
		Iterator i=map.values().iterator();
		while(i.hasNext()){
			goodsListNew.add((Goods)i.next());
		}
		return goodsListNew;
	}

}
class MapKeyComparator implements Comparator<Double>{

	@Override
	public int compare(Double o1, Double o2) {
		// TODO Auto-generated method stub
		return o1.compareTo(o2);
	}
	
}