package com.csu.qxjh.goods.service.impl;

import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;

import javax.annotation.Resource;
import javax.swing.plaf.synth.SynthStyle;

import org.hibernate.Hibernate;
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
import com.csu.qxjh.util.StringUtil;

@Transactional(propagation=Propagation.REQUIRED)
@Service
public class GoodsServiceImpl implements GoodsService{
	@Resource
	private GoodsDao goodsDao;
	@Resource
	private GoodsCommentDao goodsCommentDao;
	
	public Set<GoodsComment> getCommentByTime(Set<GoodsComment> goodsComments){//将评价按时间来排序
		Set<GoodsComment> goodsCommentList=new LinkedHashSet<>();
		TreeMap<Long, GoodsComment> map=new TreeMap<>(new MapKeyTimeComparator());
		Iterator<GoodsComment> iterator1=goodsComments.iterator();
		while(iterator1.hasNext()){
			GoodsComment goodsComment=iterator1.next();
			String time=goodsComment.getGoods_comment_time();
			String timeNew=StringUtil.dealDateString(time);
			map.put(Long.parseLong(timeNew), goodsComment);
		}
		Iterator<GoodsComment> iterator2=map.values().iterator();
		while(iterator2.hasNext()){
			goodsCommentList.add(iterator2.next());
		}
		return goodsCommentList;
	}
	
	@Override
	public Goods getById(int id) {
		// TODO Auto-generated method stub
		Goods goods=goodsDao.selectById(id);
		Set<GoodsComment> goodsComments=getCommentByTime(goods.getGoodsComments());
		goods.setGoodsComments(goodsComments);
		List<Goods>goodsList=new ArrayList<>();
		goodsList.add(goods);
		goodsList=this.setGrade(goodsList);
		goods.setGoodsCommentNumber(goods.getGoodsComments().size());
		goods.setGoodsSells(goods.getGoodsOrders().size());
		goods.setGoodsOrders(null);
		//Hibernate.initialize(goods.getGoodsComments());
		Hibernate.initialize(goods.getImages());
		Hibernate.initialize(goods.getGoodsPrices());
		return goods;
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
		NumberFormat nFormat=NumberFormat.getNumberInstance(); 
		nFormat.setMaximumFractionDigits(0);
		List<Goods> goodsListNew=new ArrayList<>();
		//System.out.println(goodsList.size());
		for(int i=0;i<goodsList.size();i++){
			Goods goods=goodsList.get(i);
			int badAmount=goodsCommentDao.selectGrade(goods.getId(),0, 1);
			int mediumAmount=goodsCommentDao.selectGrade(goods.getId(),2, 3);
			int goodAmount=goodsCommentDao.selectGrade(goods.getId(),4, 5);
			double total=badAmount+mediumAmount+goodAmount;
			Map<String ,Integer> map=new HashMap<>();
			if(total!=0){				
				map.put("bad", Integer.parseInt(nFormat.format(badAmount/total*100)));
				System.out.println(nFormat.format(badAmount/total));
				map.put("good",Integer.parseInt(nFormat.format(goodAmount/total*100)));
				map.put("medium", Integer.parseInt(nFormat.format(mediumAmount/total*100)));
			}else{
				map.put("bad", 33);
				map.put("good", 33);
				map.put("medium",34);
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
		for(int j=0;j<goodsList.size();j++){
			Goods goods=goodsList.get(j);
			goods.setGoodsCommentNumber(goods.getGoodsComments().size());
			goods.setGoodsSells(goods.getGoodsOrders().size());
			goods.setGoodsComments(null);
			goods.setGoodsOrders(null);
			Hibernate.initialize(goods.getImages());
			Hibernate.initialize(goods.getGoodsPrices());
		}
		return goodsList;
	}

	@Override
	public List<Goods> getByCatagory2PriceDown(int catagoryId) {
		// TODO Auto-generated method stub
		List<Goods> goodsList= goodsDao.selectByGoodsCatagory2ByPrice(catagoryId, 0);
		goodsList=this.setGrade(goodsList);
		for(int j=0;j<goodsList.size();j++){
			Goods goods=goodsList.get(j);
			goods.setGoodsCommentNumber(goods.getGoodsComments().size());
			goods.setGoodsSells(goods.getGoodsOrders().size());
			goods.setGoodsComments(null);
			goods.setGoodsOrders(null);
			Hibernate.initialize(goods.getImages());
			Hibernate.initialize(goods.getGoodsPrices());
		}
		return goodsList;
	}

	@Override
	public List<Goods> getByCatagory2PriceUp(int catagoryId) {
		// TODO Auto-generated method stub
		List<Goods> goodsList= goodsDao.selectByGoodsCatagory2ByPrice(catagoryId, 1);
		goodsList=this.setGrade(goodsList);
		for(int j=0;j<goodsList.size();j++){
			Goods goods=goodsList.get(j);
			goods.setGoodsCommentNumber(goods.getGoodsComments().size());
			goods.setGoodsSells(goods.getGoodsOrders().size());
			goods.setGoodsComments(null);
			goods.setGoodsOrders(null);
			Hibernate.initialize(goods.getImages());
			Hibernate.initialize(goods.getGoodsPrices());
		}
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
		for(int j=0;j<goodsListNew.size();j++){
			Goods goods=goodsListNew.get(j);
			goods.setGoodsCommentNumber(goods.getGoodsComments().size());
			goods.setGoodsSells(goods.getGoodsOrders().size());
			goods.setGoodsComments(null);
			goods.setGoodsOrders(null);
			Hibernate.initialize(goods.getImages());
			Hibernate.initialize(goods.getGoodsPrices());
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
class MapKeyTimeComparator implements Comparator<Long>{

	@Override
	public int compare(Long o1, Long o2) {
		// TODO Auto-generated method stub
		return -o1.compareTo(o2);
	}
	
}