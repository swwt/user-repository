package com.csu.qxjh.news.pojo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.csu.qxjh.user.pojo.User;
import com.fasterxml.jackson.annotation.JsonIgnore;

/*
 * 公益评价
 */
@Entity
@Table(name="news_comment")
public class NewsComment {
	private int id;//主键
	private News news;//所属新闻
	private String news_comment_content;//评价内容
	private String news_comment_time;//评价时间
	private User user;//用户编号
	private int news_comment_type;//是否匿名 0表示匿名，1表示不匿名
	public NewsComment() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Id
	@GeneratedValue
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="news_id")
	@JsonIgnore
	public News getNews() {
		return news;
	}
	public void setNews(News news) {
		this.news = news;
	}
	@Column
	public String getNews_comment_content() {
		return news_comment_content;
	}
	public void setNews_comment_content(String news_comment_content) {
		this.news_comment_content = news_comment_content;
	}
	@Column
	public String getNews_comment_time() {
		return news_comment_time;
	}
	public void setNews_comment_time(String news_comment_time) {
		this.news_comment_time = news_comment_time;
	}
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="user_id")
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	@Column
	public int getNews_comment_type() {
		return news_comment_type;
	}
	public void setNews_comment_type(int news_comment_type) {
		this.news_comment_type = news_comment_type;
	}
	
}
