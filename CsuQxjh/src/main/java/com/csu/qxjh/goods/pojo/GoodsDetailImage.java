package com.csu.qxjh.goods.pojo;

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

import com.fasterxml.jackson.annotation.JsonIgnore;

/*
 * 商品详情对应的图片
 */
@Entity
@Table(name="goods_detail_image")
public class GoodsDetailImage {
	private int id;//主键
	private GoodsDetail goodsDetail;//所属的商品详情
	private String goods_detail_image_src;//图片路径
	private String goods_detail_image_time;//图片上传时间
	public GoodsDetailImage() {
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
	@JoinColumn(name="goods_detail_id")
	@JsonIgnore
	public GoodsDetail getGoodsDetail() {
		return goodsDetail;
	}
	public void setGoodsDetail(GoodsDetail goodsDetail) {
		this.goodsDetail = goodsDetail;
	}
	@Column
	public String getGoods_detail_image_src() {
		return goods_detail_image_src;
	}
	public void setGoods_detail_image_src(String goods_detail_image_src) {
		this.goods_detail_image_src = goods_detail_image_src;
	}
	@Column
	public String getGoods_detail_image_time() {
		return goods_detail_image_time;
	}
	public void setGoods_detail_image_time(String goods_detail_image_time) {
		this.goods_detail_image_time = goods_detail_image_time;
	}
	
}
