package com.csu.qxjh.news.pojo;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.csu.qxjh.admin.pojo.Admin;
import com.fasterxml.jackson.annotation.JsonIgnore;

/*
 * 公益
 */
@Entity
@Table(name="news")
public class News {
		private int id;//主键
		private String news_title;//项目主题
		private String news_introduction;//项目简介
		private String news_time;//项目发起时间
		private String news_time_end;//项目截止时间
		private String news_content;//项目内容
		private String news_people;//发起人
		private String news_phone;//联系电话
		private String news_image;//项目图片标识
		private String news_organization;//发起组织，机构，团队
		private int news_check_type;//审核状态
		private String news_check_person;//审核人
		private String news_check_time;//审核时间
		private int news_read_number;//阅读量
		private int news_praise;//赞数量
		private double news_money;//已筹钱数
		private double news_money_goal;//目标金额
		private int news_money_people_number;//已捐人数
		private String news_time_last_update;//项目最后修改时间
		private Admin admin;//项目最后修改管理员
		private Set<NewsComment> newsComments;//该项目所有的评价
		public News() {
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
		@Column
		public String getNews_title() {
			return news_title;
		}
		public void setNews_title(String news_title) {
			this.news_title = news_title;
		}
		@Column
		public String getNews_introduction() {
			return news_introduction;
		}
		public void setNews_introduction(String news_introduction) {
			this.news_introduction = news_introduction;
		}
		@Column
		public String getNews_time() {
			return news_time;
		}
		public void setNews_time(String news_time) {
			this.news_time = news_time;
		}
		@Column
		public String getNews_time_end() {
			return news_time_end;
		}
		public void setNews_time_end(String news_time_end) {
			this.news_time_end = news_time_end;
		}
		@Column
		public String getNews_content() {
			return news_content;
		}
		public void setNews_content(String news_content) {
			this.news_content = news_content;
		}
		@Column
		public String getNews_people() {
			return news_people;
		}
		public void setNews_people(String news_people) {
			this.news_people = news_people;
		}
		@Column
		public String getNews_phone() {
			return news_phone;
		}
		public void setNews_phone(String news_phone) {
			this.news_phone = news_phone;
		}
		@Column
		public String getNews_image() {
			return news_image;
		}
		public void setNews_image(String news_image) {
			this.news_image = news_image;
		}
		@Column
		public String getNews_organization() {
			return news_organization;
		}
		public void setNews_organization(String news_organization) {
			this.news_organization = news_organization;
		}
		@Column
		public int getNews_check_type() {
			return news_check_type;
		}
		public void setNews_check_type(int news_check_type) {
			this.news_check_type = news_check_type;
		}
		@Column
		public String getNews_check_person() {
			return news_check_person;
		}
		public void setNews_check_person(String news_check_person) {
			this.news_check_person = news_check_person;
		}
		@Column
		public String getNews_check_time() {
			return news_check_time;
		}
		public void setNews_check_time(String news_check_time) {
			this.news_check_time = news_check_time;
		}
		@Column
		public int getNews_read_number() {
			return news_read_number;
		}
		public void setNews_read_number(int news_read_number) {
			this.news_read_number = news_read_number;
		}
		@Column
		public int getNews_praise() {
			return news_praise;
		}
		public void setNews_praise(int news_praise) {
			this.news_praise = news_praise;
		}
		@Column
		public double getNews_money() {
			return news_money;
		}
		public void setNews_money(double news_money) {
			this.news_money = news_money;
		}
		@Column
		public double getNews_money_goal() {
			return news_money_goal;
		}
		public void setNews_money_goal(double news_money_goal) {
			this.news_money_goal = news_money_goal;
		}
		@Column
		public int getNews_money_people_number() {
			return news_money_people_number;
		}
		public void setNews_money_people_number(int news_money_people_number) {
			this.news_money_people_number = news_money_people_number;
		}
		@Column
		public String getNews_time_last_update() {
			return news_time_last_update;
		}
		public void setNews_time_last_update(String news_time_last_update) {
			this.news_time_last_update = news_time_last_update;
		}
		@ManyToOne(fetch=FetchType.LAZY)
		@JoinColumn(name="admin_id")
		@JsonIgnore
		public Admin getAdmin() {
			return admin;
		}
		public void setAdmin(Admin admin) {
			this.admin = admin;
		}
		@OneToMany(fetch=FetchType.LAZY,mappedBy="news")		
		public Set<NewsComment> getNewsComments() {
			return newsComments;
		}
		public void setNewsComments(Set<NewsComment> newsComments) {
			this.newsComments = newsComments;
		}
		
}
