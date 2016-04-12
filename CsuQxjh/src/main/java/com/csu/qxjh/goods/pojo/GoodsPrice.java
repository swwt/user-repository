package com.csu.qxjh.goods.pojo;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

/*
 * 商品对应的所有价格种类
 */
@Entity
@Table(name="goods_price")
public class GoodsPrice {
	private int id;//主键
	private Goods goods;//所属的商品
	private double goods_price_specific;//具体的价格
	private String goods_price_description;//对应的商品描述
	private String goods_price_time;//最后修改时间
	
	public GoodsPrice() {
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
	@JoinColumn(name="goods_id")
	@JsonIgnore
	public Goods getGoods() {
		return goods;
	}
	public void setGoods(Goods goods) {
		this.goods = goods;
	}
	public double getGoods_price_specific() {
		return goods_price_specific;
	}
	public void setGoods_price_specific(double goods_price_specific) {
		this.goods_price_specific = goods_price_specific;
	}
	public String getGoods_price_description() {
		return goods_price_description;
	}
	public void setGoods_price_description(String goods_price_description) {
		this.goods_price_description = goods_price_description;
	}
	public String getGoods_price_time() {
		return goods_price_time;
	}
	public void setGoods_price_time(String goods_price_time) {
		this.goods_price_time = goods_price_time;
	}
	
}
