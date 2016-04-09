package com.csu.qxjh.goods.controller.app;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.csu.qxjh.goods.pojo.Goods;
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
	
	@ResponseBody
	@RequestMapping("/getByCatagory2Id")
	public Message getByCatagory2Id(int catagory2Id){
		Message message=new Message();		
		List<Goods> goodsList=goodsService.getByCatagory2Id(catagory2Id);
		message.setCode(1);
		message.setResult(goodsList);
		return message;
	}
}











