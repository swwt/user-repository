package com.csu.qxjh.user.pojo;

import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.csu.qxjh.goods.pojo.Goods;
import com.csu.qxjh.sellor.pojo.Sellor;
import com.fasterxml.jackson.annotation.JsonIgnore;

/*
 * 我的收藏（该收藏包括商品和店铺，该表中每条数据中只能有商品数据或者店铺数据，不能两者同时拥有）
 */
@Entity
@Table(name="collection")
public class Collection {
	private int id;//主键
	private User user;//所属用户
	private Goods goods;//收藏的商品
	private Sellor sellor;//收藏的店铺，通过卖家信息可获得店铺信息(因为一个卖家只有一个店铺)
	public Collection() {
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
	@ManyToOne
	@JoinColumn(name="goods_id")
	public Goods getGoods() {
		return goods;
	}
	public void setGoods(Goods goods) {
		this.goods = goods;
	}
	@ManyToOne
	@JoinColumn(name="sellor_id")
	public Sellor getSellor() {
		return sellor;
	}
	public void setSellor(Sellor sellor) {
		this.sellor = sellor;
	}
}
