package com.csu.qxjh.goods.controller.app;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.csu.qxjh.goods.pojo.GoodsCatagory1;
import com.csu.qxjh.goods.pojo.GoodsCatagory2;
import com.csu.qxjh.goods.service.GoodsCatagory1Service;
import com.csu.qxjh.goods.service.GoodsCatagory2Service;
import com.csu.qxjh.util.pojo.Message;




/*
 * 商品分类控制层
 */
@RequestMapping("/catagory")
@Controller
public class GoodsCatagoryControllerApp {
	@Resource
	private GoodsCatagory2Service goodsCatagory2Service;
	@Resource
	private GoodsCatagory1Service goodsCatagory1Service;
	
	@ResponseBody
	@RequestMapping("/getCatagory1All")//返回一级分类所有信息
	public Message getCatagory1All(){
		System.out.println("get--------");
		Message message=new Message();
		List<GoodsCatagory1> list=goodsCatagory1Service.getAll();
		for(int i=0;i<list.size();i++){
			list.get(i).setGoodsCatagory2List(null);
		}
		message.setCode(1);
		message.setMessage("获取成功");
		message.setResult(list);
		return message;
	}
	
	@ResponseBody
	@RequestMapping("getCatagory2ByCatagory1Id")//根据一级分类id返回对应所有二级分类信息
	public Message getCatagory2ByCatagory1Id(int id){
		Message message=new Message();
		List<GoodsCatagory2> list=goodsCatagory2Service.getByCatagory1Id(id);
		message.setCode(1);
		message.setMessage("获取成功");
		message.setResult(list);
		return message;
	}
	
	@ResponseBody
	@RequestMapping("getSpecialHotCatagory2")//获取二级分类中所有的专场分类和热门分类
	public Message getCatagory2ByType(){
		Message message=new Message();
		Map<String,List<GoodsCatagory2>> map=new HashMap();
		List<GoodsCatagory2> specialList=goodsCatagory2Service.getSpecialCatagory2();//专场分类
		List<GoodsCatagory2> hotList=goodsCatagory2Service.getHotCatagory2();//热门分类
		map.put("special", specialList);
		map.put("hot", hotList);
		message.setCode(1);
		message.setMessage("获取成功");
		message.setResult(map);
		return message;
	}

}





