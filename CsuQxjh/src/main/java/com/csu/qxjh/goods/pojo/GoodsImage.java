package com.csu.qxjh.goods.pojo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

/*
 * 商品对应的图片
 */
@Entity
@Table(name="goods_image")
public class GoodsImage {
	private int id;//主键
	private Goods goods;//所属商品
	private String goods_image_src;//图片路径
	private String goods_image_time;//上传时间
	public GoodsImage() {
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
	@Column
	public String getGoods_image_src() {
		return goods_image_src;
	}
	public void setGoods_image_src(String goods_image_src) {
		this.goods_image_src = goods_image_src;
	}
	@Column
	public String getGoods_image_time() {
		return goods_image_time;
	}
	public void setGoods_image_time(String goods_image_time) {
		this.goods_image_time = goods_image_time;
	}
	
}
