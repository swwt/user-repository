package com.csu.qxjh.goods.pojo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/*
 * 优惠促销（满减类的）
 */
@Entity
@Table(name="offer_promotion_fullcutproducts")
public class OfferPromotionFullcutproducts {
	private int id;//主键
	private String offer_promotion_fullcutproducts_name;//优惠促销名称
	private String offer_promotion_fullcutproducts_remark;//优惠促销备注
	private String offer_promotion_fullcutproducts_time_start;//优惠促销开始时间
	private String offer_promotion_fullcutproducts_time_end;//优惠促销截止时间
	private String offer_promotion_fullcutproducts_time_publish;//发布时间
	private double offer_promotion_fullcutproducts_money_full;//满金额
	private double offer_promotion_fullcutproducts_money_reduce;//减金额
	
	public OfferPromotionFullcutproducts() {
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
	public String getOffer_promotion_fullcutproducts_name() {
		return offer_promotion_fullcutproducts_name;
	}
	public void setOffer_promotion_fullcutproducts_name(String offer_promotion_fullcutproducts_name) {
		this.offer_promotion_fullcutproducts_name = offer_promotion_fullcutproducts_name;
	}
	@Column
	public String getOffer_promotion_fullcutproducts_remark() {
		return offer_promotion_fullcutproducts_remark;
	}
	public void setOffer_promotion_fullcutproducts_remark(String offer_promotion_fullcutproducts_remark) {
		this.offer_promotion_fullcutproducts_remark = offer_promotion_fullcutproducts_remark;
	}
	@Column
	public String getOffer_promotion_fullcutproducts_time_start() {
		return offer_promotion_fullcutproducts_time_start;
	}
	public void setOffer_promotion_fullcutproducts_time_start(String offer_promotion_fullcutproducts_time_start) {
		this.offer_promotion_fullcutproducts_time_start = offer_promotion_fullcutproducts_time_start;
	}
	@Column
	public String getOffer_promotion_fullcutproducts_time_end() {
		return offer_promotion_fullcutproducts_time_end;
	}
	public void setOffer_promotion_fullcutproducts_time_end(String offer_promotion_fullcutproducts_time_end) {
		this.offer_promotion_fullcutproducts_time_end = offer_promotion_fullcutproducts_time_end;
	}
	@Column
	public String getOffer_promotion_fullcutproducts_time_publish() {
		return offer_promotion_fullcutproducts_time_publish;
	}
	public void setOffer_promotion_fullcutproducts_time_publish(String offer_promotion_fullcutproducts_time_publish) {
		this.offer_promotion_fullcutproducts_time_publish = offer_promotion_fullcutproducts_time_publish;
	}
	@Column
	public double getOffer_promotion_fullcutproducts_money_full() {
		return offer_promotion_fullcutproducts_money_full;
	}
	public void setOffer_promotion_fullcutproducts_money_full(double offer_promotion_fullcutproducts_money_full) {
		this.offer_promotion_fullcutproducts_money_full = offer_promotion_fullcutproducts_money_full;
	}
	@Column
	public double getOffer_promotion_fullcutproducts_money_reduce() {
		return offer_promotion_fullcutproducts_money_reduce;
	}
	public void setOffer_promotion_fullcutproducts_money_reduce(double offer_promotion_fullcutproducts_money_reduce) {
		this.offer_promotion_fullcutproducts_money_reduce = offer_promotion_fullcutproducts_money_reduce;
	}
	
}
