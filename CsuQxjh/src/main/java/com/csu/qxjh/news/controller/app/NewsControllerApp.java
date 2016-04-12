package com.csu.qxjh.news.controller.app;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.csu.qxjh.news.pojo.News;
import com.csu.qxjh.news.service.NewsService;
import com.csu.qxjh.util.pojo.Message;

/*
 * webapp控制层
 */
@RequestMapping("/news")
@Controller
public class NewsControllerApp {
	@Resource
	private NewsService newsService;
	
	@ResponseBody//获取所有的公益新闻列表
	@RequestMapping("/getNewsList")
	public Message getNewsList(){
		System.out.println("---news------------");
		Message message=new Message();
		message.setCode(1);
		message.setMessage("获取成功");
		List<News>newList=newsService.selectAll();//获取所有公益新闻
		message.setResult(newList);
		return message;
	}
	
	@ResponseBody//根据Id获取公益新闻
	@RequestMapping("/getNewsListById")
	public Message getNewsListById(@RequestParam(value="newsId")Integer newsId){
		Message message=new Message();
		message.setCode(1);
		message.setMessage("获取成功");
		News news=newsService.selectById(newsId);
		message.setResult(news);
		return message;
	}
	
	
}
