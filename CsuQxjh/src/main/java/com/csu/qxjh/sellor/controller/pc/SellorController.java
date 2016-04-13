package com.csu.qxjh.sellor.controller.pc;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.csu.qxjh.sellor.service.SellorService;

/*
 * pc端控制层
 */
@RequestMapping("/pc_sellor")
@Controller
public class SellorController {
	
	@Resource
	private SellorService sellorService;
	
	@Autowired
	HttpServletRequest request;
	
	@RequestMapping("/pageQuerySellors")
	public String pageQueryUsers(@RequestParam(value = "targetPageIndex",defaultValue="1") int targetPageIndex,
			@RequestParam(value = "key",defaultValue="") String key) {

		final String basePath = "/pc_sellor/pageQuerySellors";
		
		Map<String, Object> data = sellorService.fuzzyPageQuery(targetPageIndex, key);
		request.setAttribute("data", data);
		request.setAttribute("basePath", basePath);
		if (request == null) {
			System.out.println("request is null");
		}
		return "/web_page/administrator/seller-manager";
	}
}
