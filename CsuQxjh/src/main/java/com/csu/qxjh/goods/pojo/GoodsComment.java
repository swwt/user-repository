package com.csu.qxjh.goods.pojo;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.csu.qxjh.user.pojo.User;
import com.fasterxml.jackson.annotation.JsonIgnore;

/*
 * 商品购买后的评价
 */
@Entity
@Table(name="goods_comment")
public class GoodsComment {
	private int id;//主键
	private Goods goods;//所属商品
//	private Goods goods_order_id;//
	private User user;//所属用户
	private String goods_comment_content;//评价内容
	private String goods_comment_time;//评价时间
//	private int goods_comment_description_match;//描述相符（5颗星）
//	private int goods_comment_service_attitude;//服务态度（5颗星）
//	private int goods_comment_logistics_speed;//物流速度（5颗星）
	private int goods_comment_grade;//评价等级（五颗星，0,1颗星代表差评，2，3颗星代表好评，,4,5颗星代表好评）
	private int goods_comment_view_status;//查看状态
	private int goods_comment_anonymous;//是否匿名,0代表匿名,1代表不匿名显示
	private Set<GoodsCommentImage> images;//评价信息附带的图片
	public GoodsComment() {
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
	@ManyToOne
	@JoinColumn(name="user_id")
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	@Column
	public String getGoods_comment_content() {
		return goods_comment_content;
	}
	public void setGoods_comment_content(String goods_comment_content) {
		this.goods_comment_content = goods_comment_content;
	}
	@Column
	public String getGoods_comment_time() {
		return goods_comment_time;
	}
	public void setGoods_comment_time(String goods_comment_time) {
		this.goods_comment_time = goods_comment_time;
	}
//	@Column
//	public int getGoods_comment_description_match() {
//		return goods_comment_description_match;
//	}
//	public void setGoods_comment_description_match(int goods_comment_description_match) {
//		this.goods_comment_description_match = goods_comment_description_match;
//	}
//	@Column
//	public int getGoods_comment_service_attitude() {
//		return goods_comment_service_attitude;
//	}
//	public void setGoods_comment_service_attitude(int goods_comment_service_attitude) {
//		this.goods_comment_service_attitude = goods_comment_service_attitude;
//	}
//	@Column
//	public int getGoods_comment_logistics_speed() {
//		return goods_comment_logistics_speed;
//	}
//	public void setGoods_comment_logistics_speed(int goods_comment_logistics_speed) {
//		this.goods_comment_logistics_speed = goods_comment_logistics_speed;
//	}
	@Column
	public int getGoods_comment_grade() {
		return goods_comment_grade;
	}
	public void setGoods_comment_grade(int goods_comment_grade) {
		this.goods_comment_grade = goods_comment_grade;
	}
	@Column
	public int getGoods_comment_view_status() {
		return goods_comment_view_status;
	}
	public void setGoods_comment_view_status(int goods_comment_view_status) {
		this.goods_comment_view_status = goods_comment_view_status;
	}
	@Column
	public int getGoods_comment_anonymous() {
		return goods_comment_anonymous;
	}
	public void setGoods_comment_anonymous(int goods_comment_anonymous) {
		this.goods_comment_anonymous = goods_comment_anonymous;
	}
	@ManyToOne
	@JoinColumn(name="goods_id")
	@JsonIgnore
	public Goods getGoods() {
		return goods;
	}
	public void setGoods(Goods goods) {
		this.goods = goods;
	}
	@OneToMany(fetch=FetchType.EAGER,mappedBy="goodsComment")
	public Set<GoodsCommentImage> getImages() {
		return images;
	}
	public void setImages(Set<GoodsCommentImage> images) {
		this.images = images;
	}
	
}
