package com.csu.qxjh.user.pojo;

import java.beans.Transient;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

import com.csu.qxjh.goods.pojo.GoodsComment;
import com.csu.qxjh.news.pojo.NewsComment;
import com.fasterxml.jackson.annotation.JsonIgnore;

/*
 * 用户（买家）
 */
@Entity
@Table(name="user")
public class User {
	
	private String id;//主键
	private String user_name;//用户名(值与主键相同)
	private String user_login_name;//登录名(用户登陆所使用的登录名,登录名在此限制为不能是纯数字)
	private String user_real_name;//真实姓名
	private String user_nickname;//昵称
	private String user_home_address;//联系地址
	private String user_phone;//联系电话（手机号）
	private int user_sex;//性别（0：男;1：女）
	private String user_password;//密码
	private String user_birthday;//出生年月
	private String user_head_image;//头像
	private String user_email;//邮箱
	private String user_type;//用户类型（老师or学生）
	private String user_number;//学工号
	private String user_college;//学院
	private Set<GoodsOrder> goodsOrders;//对应的订单（用户删除订单，只是修改订单中用户是否保存的状态，但是并不实际删除数据表中的订单记录）
	private Set<Collection> collections;//用户的收藏表
//	private Set<GoodsComment> goodsComments;//该用户评论过的商品
//	private Set<NewsComment> newsComments;//该用户参加过的所有公益项目的评价
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Id//指定主键UUID生成
	@GenericGenerator(name="systemUUID",strategy="uuid")
	@GeneratedValue(generator="systemUUID")
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	@Column
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	@Column
	public String getUser_login_name() {
		return user_login_name;
	}
	public void setUser_login_name(String user_login_name) {
		this.user_login_name = user_login_name;
	}
	@Column
	public String getUser_real_name() {
		return user_real_name;
	}
	public void setUser_real_name(String user_real_name) {
		this.user_real_name = user_real_name;
	}
	@Column
	public String getUser_nickname() {
		return user_nickname;
	}
	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}
	@Column
	public String getUser_home_address() {
		return user_home_address;
	}
	public void setUser_home_address(String user_home_address) {
		this.user_home_address = user_home_address;
	}
	@Column
	public String getUser_phone() {
		return user_phone;
	}
	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}
	@Column
	public int getUser_sex() {
		return user_sex;
	}
	public void setUser_sex(int user_sex) {
		this.user_sex = user_sex;
	}
	@Column
	public String getUser_password() {
		return user_password;
	}
	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}
	@Column
	public String getUser_birthday() {
		return user_birthday;
	}
	public void setUser_birthday(String user_birthday) {
		this.user_birthday = user_birthday;
	}
	@Column
	public String getUser_head_image() {
		return user_head_image;
	}
	public void setUser_head_image(String user_head_image) {
		this.user_head_image = user_head_image;
	}
	@Column
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	@Column
	public String getUser_type() {
		return user_type;
	}
	public void setUser_type(String user_type) {
		this.user_type = user_type;
	}
	@Column
	public String getUser_number() {
		return user_number;
	}
	public void setUser_number(String user_number) {
		this.user_number = user_number;
	}
	@Column
	public String getUser_college() {
		return user_college;
	}
	public void setUser_college(String user_college) {
		this.user_college = user_college;
	}
	@OneToMany(fetch=FetchType.LAZY,mappedBy="user")
	public Set<GoodsOrder> getGoodsOrders() {
		return goodsOrders;
	}
	public void setGoodsOrders(Set<GoodsOrder> goodsOrders) {
		this.goodsOrders = goodsOrders;
	}
	@OneToMany(fetch=FetchType.LAZY,mappedBy="user")
	public Set<Collection> getCollections() {
		return collections;
	}
	public void setCollections(Set<Collection> collections) {
		this.collections = collections;
	}
//	@OneToMany(fetch=FetchType.LAZY,mappedBy="user")
//	@JsonIgnore
//	public Set<GoodsComment> getGoodsComments() {
//		return goodsComments;
//	}
//	public void setGoodsComments(Set<GoodsComment> goodsComments) {
//		this.goodsComments = goodsComments;
//	}
//	@OneToMany(fetch=FetchType.LAZY,mappedBy="user")
//	@JsonIgnore
//	public Set<NewsComment> getNewsComments() {
//		return newsComments;
//	}
//	public void setNewsComments(Set<NewsComment> newsComments) {
//		this.newsComments = newsComments;
//	}
	
	

	
	
}
