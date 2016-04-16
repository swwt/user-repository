package com.csu.qxjh.news.controller.app;

import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;

import org.hibernate.Hibernate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.csu.qxjh.news.dao.NewsCommentDao;
import com.csu.qxjh.news.pojo.News;
import com.csu.qxjh.news.pojo.NewsComment;
import com.csu.qxjh.news.service.NewsCommentService;
import com.csu.qxjh.news.service.NewsService;
import com.csu.qxjh.user.pojo.User;
import com.csu.qxjh.util.pojo.Message;

/*
 * webapp控制层
 */
@RequestMapping("/news")
@Controller
public class NewsControllerApp {
	@Resource
	private NewsService newsService;
	@Resource
	private NewsCommentService newsCommentService;
	
	@ResponseBody//获取所有的公益新闻列表
	@RequestMapping("/getNewsList")
	public Message getNewsList(){
		System.out.println("---news------------");
		Message message=new Message();
		message.setCode(1);
		message.setMessage("获取成功");
		List<News> newsList=newsService.selectAll();//获取所有公益新闻
		for(int i=0;i<newsList.size();i++){
			News news=newsList.get(i);
			news.setNewsComments(null);
		}
		message.setResult(newsList);
		return message;
	}
	
	@ResponseBody//根据Id获取公益新闻
	@RequestMapping("/getNewsListById")
	public Message getNewsListById(@RequestParam(value="newsId")Integer newsId){	
		Message message=new Message();
		message.setCode(1);
		message.setMessage("获取成功");
		News news=newsService.selectById(newsId);
		Set<NewsComment> newsComments=news.getNewsComments();
		Iterator<NewsComment> iterator= newsComments.iterator();
		while(iterator.hasNext()){
			//Hibernate.initialize(newsComments);
			NewsComment newsComment=iterator.next();
			User user=newsComment.getUser();
			user.setGoodsOrders(null);
			user.setCollections(null);
			user.setShoppingCarts(null);
			user.setUserAddresses(null);
		}
		message.setResult(news);
		return message;
	}
	
	@ResponseBody//添加阅读量(加一)
	@RequestMapping("/updateNewsReadNumber")
	public Message updateNewsReadNumber(@RequestParam(value="newsId")Integer newsId){
		Message message=new Message();
		message.setMessage("添加阅读量成功");
		message.setCode(1);
		News news=newsService.selectById(newsId);
		int oldNumber=news.getNews_read_number();
		news.setNews_read_number(oldNumber+1);
		newsService.updateNews(news);
		return message;
	}
	
	@ResponseBody//添加赞数量(加一)
	@RequestMapping("/updateNewsPraiseNumber")
	public Message updateNewsPraiseNumber(@RequestParam(value="newsId")Integer newsId){
		Message message=new Message();
		message.setMessage("添加赞数量成功");
		message.setCode(1);
		News news=newsService.selectById(newsId);
		int oldNumber=news.getNews_praise();
		news.setNews_praise(oldNumber+1);
		newsService.updateNews(news);
		return message;
	}
	

	@ResponseBody//添加该公益项目对应的评价
	@RequestMapping("/addNewsComment")
	public Message addNewsComment(@RequestParam(value="newsId")Integer newsId,
			@RequestParam(value="commentContent")String commentContent,@RequestParam(value="userId") String userId){
		Message message=new Message();
		message.setMessage("评论成功");
		message.setCode(1);
		NewsComment newsComment=new NewsComment();
		newsComment.setNews_comment_content(commentContent);
		User user=new User();
		user.setId(userId);
		News news=new News();
		news.setId(newsId);
		newsComment.setUser(user);
		newsComment.setNews(news);
		newsCommentService.insert(newsComment);
		return message;
	}
}










