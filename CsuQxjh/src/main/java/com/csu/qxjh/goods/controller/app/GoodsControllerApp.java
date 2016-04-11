package com.csu.qxjh.goods.controller.app;

import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.csu.qxjh.goods.pojo.Goods;
import com.csu.qxjh.goods.pojo.GoodsComment;
import com.csu.qxjh.goods.service.GoodsService;
import com.csu.qxjh.util.pojo.Message;

/*
 * webapp控制层
 */
@RequestMapping("/goods")
@Controller
public class GoodsControllerApp {
	@Resource
	private GoodsService goodsService;
	/*
	 * ------根据二级分类获取对应的商品-------
	 */
	@ResponseBody
	@RequestMapping("/getByCatagory2Id")
	public Message getByCatagory2Id(@RequestParam(value="catagory2Id")String catagory2Id){
		Message message=new Message();		
		List<Goods> goodsList=goodsService.getByCatagory2Id(Integer.parseInt(catagory2Id));
		for(int i=0;i<goodsList.size();i++){
			Goods goods=goodsList.get(i);
			goods.setGoodsCommentNumber(goods.getGoodsComments().size());
			goods.setGoodsSells(goods.getGoodsOrders().size());
			goods.setGoodsComments(null);
			goods.setGoodsOrders(null);
		}
		message.setCode(1);
		message.setMessage("获取成功");
		message.setResult(goodsList);
		return message;
	}
	
	@ResponseBody
	@RequestMapping("/getByCatagory2ZongHe")//获取综合排序的商品
	public Message getByCatagory2ZongHe(@RequestParam(value="catagory2Id")Integer  catagory2Id){
		//System.out.println("getByCatagory2ZongHe-------"+catagory2Id);
		Message message=new Message();		
		List<Goods> goodsList=goodsService.getByCatagory2ZongHe(catagory2Id);
		for(int i=0;i<goodsList.size();i++){
			Goods goods=goodsList.get(i);
			goods.setGoodsCommentNumber(goods.getGoodsComments().size());
			goods.setGoodsSells(goods.getGoodsOrders().size());
			goods.setGoodsComments(null);
			goods.setGoodsOrders(null);
		}
		message.setCode(1);
		message.setMessage("获取成功");
		message.setResult(goodsList);
		return message;
	}
	@ResponseBody
	@RequestMapping("/getByCatagory2Sellors")//获取按销量排序的商品
	public Message getByCatagory2Sellors(@RequestParam(value="catagory2Id")Integer  catagory2Id){
		Message message=new Message();		
		List<Goods> goodsList=goodsService.getByCatagory2Sellors(catagory2Id);
		for(int i=0;i<goodsList.size();i++){
			Goods goods=goodsList.get(i);
			goods.setGoodsCommentNumber(goods.getGoodsComments().size());
			goods.setGoodsSells(goods.getGoodsOrders().size());
			goods.setGoodsComments(null);
			goods.setGoodsOrders(null);
		}
		message.setCode(1);
		message.setMessage("获取成功");
		message.setResult(goodsList);
		return message;
	}
	@ResponseBody
	@RequestMapping("/getByCatagory2PriceDown")//获取按价格从高到低排序的商品
	public Message getByCatagory2PriceDown(@RequestParam(value="catagory2Id")Integer  catagory2Id){
		Message message=new Message();		
		List<Goods> goodsList=goodsService.getByCatagory2PriceDown(catagory2Id);
		for(int i=0;i<goodsList.size();i++){
			Goods goods=goodsList.get(i);
			goods.setGoodsCommentNumber(goods.getGoodsComments().size());
			goods.setGoodsSells(goods.getGoodsOrders().size());
			goods.setGoodsComments(null);
			goods.setGoodsOrders(null);
		}
		message.setCode(1);
		message.setMessage("获取成功");
		message.setResult(goodsList);
		return message;
	}
	@ResponseBody
	@RequestMapping("/getByCatagory2PriceUp")//获取按价格从低到高排序的商品
	public Message getByCatagory2PriceUp(@RequestParam(value="catagory2Id")Integer  catagory2Id){
		Message message=new Message();		
		List<Goods> goodsList=goodsService.getByCatagory2PriceUp(catagory2Id);
		for(int i=0;i<goodsList.size();i++){
			Goods goods=goodsList.get(i);
			goods.setGoodsCommentNumber(goods.getGoodsComments().size());
			goods.setGoodsSells(goods.getGoodsOrders().size());
			goods.setGoodsComments(null);
			goods.setGoodsOrders(null);
		}
		message.setCode(1);
		message.setMessage("获取成功");
		message.setResult(goodsList);
		return message;
	}
	/*
	 * ------根据商品id获取对应的商品-------
	 */
	@ResponseBody
	@RequestMapping("/getGoodsById")
	public Message getGoodsById(@RequestParam(value="goodsId")Integer  goodsId){
		//System.out.println("---getGoodsById-----"+goodsId);
		Message message=new Message();		
		Goods goods=goodsService.getById(goodsId);
		//System.out.println("=============="+goods.getImages().size());
		Set<GoodsComment> goodsComments=goods.getGoodsComments();
		Iterator<GoodsComment> iterator=goodsComments.iterator();
		while(iterator.hasNext()){
			GoodsComment goodsComment=iterator.next();
			goodsComment.getUser().setGoodsOrders(null);
			goodsComment.getUser().setGoodsComments(null);
			goodsComment.getUser().setCollections(null);
		}
		message.setCode(1);
		message.setMessage("获取成功");
		message.setResult(goods);
		return message;
	}
}











