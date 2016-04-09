package com.csu.qxjh.user.pojo;

import java.util.Set;

import javax.persistence.Entity;
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
	private Set<Goods> goodsList;//收藏的商品（商品与收藏多对多）
	private Set<Sellor> sellorList;//收藏的店铺，通过卖家信息可获得店铺信息（因为一个卖家只有一个店铺）（店铺与收藏多对多）
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
	@ManyToOne
	@JoinColumn(name="user_id")
	@JsonIgnore
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	@ManyToMany
	@JoinTable(name = "collection_goods",
	   joinColumns = @JoinColumn(name = "collection_id"),
	   inverseJoinColumns = @JoinColumn(name = "goods_id"))
	public Set<Goods> getGoodsList() {
		return goodsList;
	}
	public void setGoodsList(Set<Goods> goodsList) {
		this.goodsList = goodsList;
	}
	@ManyToMany
	@JoinTable(name = "collection_store",
	   joinColumns = @JoinColumn(name = "collection_id"),
	   inverseJoinColumns = @JoinColumn(name = "sellor_id"))
	public Set<Sellor> getSellorList() {
		return sellorList;
	}
	public void setSellorList(Set<Sellor> sellorList) {
		this.sellorList = sellorList;
	}
//	

	
	
}
