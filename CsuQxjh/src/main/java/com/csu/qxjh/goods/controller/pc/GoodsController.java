package com.csu.qxjh.goods.controller.pc;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSONObject;
import com.csu.qxjh.goods.dao.GoodsCatagory1Dao;
import com.csu.qxjh.goods.dao.GoodsCatagory2Dao;
import com.csu.qxjh.goods.pojo.GoodsCatagory1;
import com.csu.qxjh.goods.pojo.GoodsCatagory2;
import com.csu.qxjh.util.MD5Util;
import com.csu.qxjh.util.pojo.Message;

/*
 * pc端控制层
 */
@RequestMapping("/pc_goods")
@Controller
public class GoodsController {

	@Autowired
	GoodsCatagory1Dao goodsCatagory1Dao;
	@Autowired
	GoodsCatagory2Dao goodsCatagory2Dao;

	@RequestMapping("/turn_to_goods_release")
	public String turnToGoodsRelease() {
		return "/web_page/seller/goods_release";
	}

	@ResponseBody
	@RequestMapping("/get_goods_catagory_info")
	public String getGoodsCatagoryInfo() {

		List<GoodsCatagory1> goodsCatagory1s = goodsCatagory1Dao.selectAll();

		JSONObject jsonObject = new JSONObject();
		jsonObject.put("goodsCatagory1s", goodsCatagory1s);
		return jsonObject.toJSONString();
	}

	@ResponseBody
	@RequestMapping("/release_goods_info")
	public Message releaseGoods(@RequestParam(value="files")MultipartFile[] multipartFiles) {
		Message message = new Message();
		
		System.out.println(multipartFiles.length);
		
		return message;
	}

}
