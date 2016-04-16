package com.csu.qxjh.user.pojo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.csu.qxjh.goods.pojo.Goods;
import com.fasterxml.jackson.annotation.JsonIgnore;

/*
 * 购物车
 */
@Entity
@Table(name="shopping_cart")
public class ShoppingCart {
	private int id;//主键
	private User user;//用户
	private Goods goods;//商品
	private int shopping_cart_amount;//该商品对应的数量
	private String shopping_cart_time;//添加时间
	private double shopping_cart_price;//此字段的需要是应为一个商品有多种价格形式
	private String shopping_cart_price_description;//对上面的价格进行描述
	public ShoppingCart() {
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
	@JoinColumn(name="user_id")
	@JsonIgnore
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="goods_id")
	public Goods getGoods() {
		return goods;
	}
	public void setGoods(Goods goods) {
		this.goods = goods;
	}
	@Column
	public int getShopping_cart_amount() {
		return shopping_cart_amount;
	}
	public void setShopping_cart_amount(int shopping_cart_amount) {
		this.shopping_cart_amount = shopping_cart_amount;
	}
	@Column
	public String getShopping_cart_time() {
		return shopping_cart_time;
	}
	public void setShopping_cart_time(String shopping_cart_time) {
		this.shopping_cart_time = shopping_cart_time;
	}
	@Column
	public double getShopping_cart_price() {
		return shopping_cart_price;
	}
	public void setShopping_cart_price(double shopping_cart_price) {
		this.shopping_cart_price = shopping_cart_price;
	}
	@Column
	public String getShopping_cart_price_description() {
		return shopping_cart_price_description;
	}
	public void setShopping_cart_price_description(String shopping_cart_price_description) {
		this.shopping_cart_price_description = shopping_cart_price_description;
	}

	



	
}
