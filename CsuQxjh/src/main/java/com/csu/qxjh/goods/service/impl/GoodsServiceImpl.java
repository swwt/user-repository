package com.csu.qxjh.goods.service.impl;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;

import javax.annotation.Resource;
import javax.swing.plaf.synth.SynthStyle;

import org.hibernate.engine.jdbc.spi.ResultSetReturn;
import org.hibernate.engine.transaction.jta.platform.internal.SynchronizationRegistryBasedSynchronizationStrategy;
import org.hibernate.id.SelectGenerator.SelectGeneratorDelegate;
import org.hibernate.loader.custom.Return;
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
	
	public List<Goods> setGrade(List<Goods> goodsList){//设置商品的好评，差评，中评率
		List<Goods> goodsListNew=new ArrayList<>();
		//System.out.println(goodsList.size());
		for(int i=0;i<goodsList.size();i++){
			Goods goods=goodsList.get(i);
			int badAmount=goodsCommentDao.selectGrade(goods.getId(),0, 1);
			int mediumAmount=goodsCommentDao.selectGrade(goods.getId(),2, 3);
			int goodAmount=goodsCommentDao.selectGrade(goods.getId(),4, 5);
			double total=badAmount+mediumAmount+goodAmount;
			Map<String ,Double> map=new HashMap<>();
			if(total!=0){				
				map.put("bad", Double.valueOf(badAmount/total));
				map.put("good", Double.valueOf(goodAmount/total));
				map.put("medium", Double.valueOf(mediumAmount/total));
			}else{
				map.put("bad", Double.valueOf(0.33));
				map.put("good", Double.valueOf(0.33));
				map.put("medium", Double.valueOf(0.33));
			}
			
			goods.setGoods_grade(map);
			goodsListNew.add(goods);
			//System.out.println("--------------------"+goodsList.size()+"---------------------------------");
		}
		return goodsListNew;
	}
	
	@Override
	public List<Goods> getByCatagory2Sellors(int catagoryId) {
		// TODO Auto-generated method stub
		List<Goods> goodsList=goodsDao.selectByGoodsCatagory2BySells(catagoryId);
		goodsList=this.setGrade(goodsList);
		return goodsList;
	}

	@Override
	public List<Goods> getByCatagory2PriceDown(int catagoryId) {
		// TODO Auto-generated method stub
		List<Goods> goodsList= goodsDao.selectByGoodsCatagory2ByPrice(catagoryId, 0);
		goodsList=this.setGrade(goodsList);
		return goodsList;
	}

	@Override
	public List<Goods> getByCatagory2PriceUp(int catagoryId) {
		// TODO Auto-generated method stub
		List<Goods> goodsList= goodsDao.selectByGoodsCatagory2ByPrice(catagoryId, 1);
		goodsList=this.setGrade(goodsList);
		return goodsList;
	}

	@Override
	public List<Goods> getByCatagory2ZongHe(int catagoryId) {//综合排序，按照销量和好评率
		// TODO Auto-generated method stub
		List<Goods> goodsList=goodsDao.selectByGoodsCatagory2(catagoryId);
		goodsList=this.setGrade(goodsList);
		Map<Double,Goods> map=new TreeMap<>(new MapKeyComparator());
		List<Goods> goodsListNew=new ArrayList<>();		
		for(int i=0;i<goodsList.size();i++){
			Goods goods=goodsList.get(i);
			//System.out.println(goods.getId()+":"+goods.getGoods_grade());
			double weight=(goods.getGoods_grade().get("good")+goods.getGoods_grade().get("medium"))*(goods.getGoodsOrders().size());
			//System.out.println(goods.getId()+":"+weight);
			Goods goods_old=map.get(weight);
			if(goods_old!=null){
					//System.out.println(goods_old.getId());
					weight=weight+0.00001;
					while(true){						
						if(map.get(weight)==null){
							break;
						}
						weight=weight+0.00001;
					}
					map.put(weight, goods);
			}else{
				map.put(weight, goods);
			}
			
		}
		//System.out.println(map.size());
		Iterator i=map.values().iterator();
		while(i.hasNext()){
			Goods goods=(Goods)i.next();
//			System.out.println(goods.getId());
			goodsListNew.add(goods);
		}
		return goodsListNew;
	}

}
class MapKeyComparator implements Comparator<Double>{

	@Override
	public int compare(Double o1, Double o2) {
		// TODO Auto-generated method stub
		return -o1.compareTo(o2);
	}
	
}