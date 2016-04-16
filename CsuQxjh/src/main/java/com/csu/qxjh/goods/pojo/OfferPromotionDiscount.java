package com.csu.qxjh.goods.pojo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

/*
 * 优惠促销（折扣类的）
 */
@Entity
@Table(name="offer_promotion_discount")
public class OfferPromotionDiscount {
	private int id;//主键
	private Goods goods;//所属商品
	private String offer_promotion_discount_time_start;//开始时间
	private String offer_promotion_discount_time_end;//结束时间
	private String offer_promotion_discount_time_publish;//发布时间
	private double offer_promotion_discount_amount;//折扣是多少
	public OfferPromotionDiscount() {
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
	public String getOffer_promotion_discount_time_start() {
		return offer_promotion_discount_time_start;
	}
	public void setOffer_promotion_discount_time_start(String offer_promotion_discount_time_start) {
		this.offer_promotion_discount_time_start = offer_promotion_discount_time_start;
	}
	@Column
	public String getOffer_promotion_discount_time_end() {
		return offer_promotion_discount_time_end;
	}
	public void setOffer_promotion_discount_time_end(String offer_promotion_discount_time_end) {
		this.offer_promotion_discount_time_end = offer_promotion_discount_time_end;
	}
	@Column
	public String getOffer_promotion_discount_time_publish() {
		return offer_promotion_discount_time_publish;
	}
	public void setOffer_promotion_discount_time_publish(String offer_promotion_discount_time_publish) {
		this.offer_promotion_discount_time_publish = offer_promotion_discount_time_publish;
	}
	@Column
	public double getOffer_promotion_discount_amount() {
		return offer_promotion_discount_amount;
	}
	public void setOffer_promotion_discount_amount(double offer_promotion_discount_amount) {
		this.offer_promotion_discount_amount = offer_promotion_discount_amount;
	}
	@ManyToOne(fetch=FetchType.LAZY)//实际是一对一
	@JoinColumn(name="goods_id")
	@JsonIgnore
	public Goods getGoods() {
		return goods;
	}
	public void setGoods(Goods goods) {
		this.goods = goods;
	}
	



}
