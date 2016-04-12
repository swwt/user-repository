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

import com.fasterxml.jackson.annotation.JsonIgnore;

/*
 * 商品详情页
 */
@Entity
@Table(name="goods_detail")
public class GoodsDetail {
	private int id;//主键
	private Goods goods;//所属商品（一对一）
	private double goods_detail_inital_price;//商品原价
	private double goods_detail_now_price;//商品现价
	private String goods_detail_package_sale;//包装售后
	private String goods_detail_color;//商品颜色
	private double goods_detail_shipping_costs;//运费
	private String goods_detail_producttion_place;//产地
	private String goods_detail_shelf_life;//保质期
	private String goods_detail_net_weight;//净含量
	private String goods_detail_production_date;//生产日期
	private String goods_detail_remark;//备注
	private String goods_detail_quantity;//数量
	private String goods_detail_units;//单位
	private String goods_detail_packing;//包装方式
	private String goods_detail_taste;//口味
	private String goods_detail_category;//类别
	private String goods_detail_time_last_update;//商品详情最后修改时间
	private Set<GoodsDetailImage> images;//商品详情的图片
	public GoodsDetail() {
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
	@OneToOne(fetch=FetchType.LAZY)//实际是一对一
	@JoinColumn(name="goods_id")
	@JsonIgnore
	public Goods getGoods() {
		return goods;
	}
	public void setGoods(Goods goods) {
		this.goods = goods;
	}
	@Column
	public double getGoods_detail_inital_price() {
		return goods_detail_inital_price;
	}
	public void setGoods_detail_inital_price(double goods_detail_inital_price) {
		this.goods_detail_inital_price = goods_detail_inital_price;
	}
	@Column
	public double getGoods_detail_now_price() {
		return goods_detail_now_price;
	}
	public void setGoods_detail_now_price(double goods_detail_now_price) {
		this.goods_detail_now_price = goods_detail_now_price;
	}
	@Column
	public String getGoods_detail_package_sale() {
		return goods_detail_package_sale;
	}
	public void setGoods_detail_package_sale(String goods_detail_package_sale) {
		this.goods_detail_package_sale = goods_detail_package_sale;
	}
	@Column
	public String getGoods_detail_color() {
		return goods_detail_color;
	}
	public void setGoods_detail_color(String goods_detail_color) {
		this.goods_detail_color = goods_detail_color;
	}
	@Column
	public double getGoods_detail_shipping_costs() {
		return goods_detail_shipping_costs;
	}
	public void setGoods_detail_shipping_costs(double goods_detail_shipping_costs) {
		this.goods_detail_shipping_costs = goods_detail_shipping_costs;
	}
	@Column
	public String getGoods_detail_producttion_place() {
		return goods_detail_producttion_place;
	}
	public void setGoods_detail_producttion_place(String goods_detail_producttion_place) {
		this.goods_detail_producttion_place = goods_detail_producttion_place;
	}
	@Column
	public String getGoods_detail_shelf_life() {
		return goods_detail_shelf_life;
	}
	public void setGoods_detail_shelf_life(String goods_detail_shelf_life) {
		this.goods_detail_shelf_life = goods_detail_shelf_life;
	}
	@Column
	public String getGoods_detail_net_weight() {
		return goods_detail_net_weight;
	}
	public void setGoods_detail_net_weight(String goods_detail_net_weight) {
		this.goods_detail_net_weight = goods_detail_net_weight;
	}
	@Column
	public String getGoods_detail_production_date() {
		return goods_detail_production_date;
	}
	public void setGoods_detail_production_date(String goods_detail_production_date) {
		this.goods_detail_production_date = goods_detail_production_date;
	}
	@Column
	public String getGoods_detail_remark() {
		return goods_detail_remark;
	}
	public void setGoods_detail_remark(String goods_detail_remark) {
		this.goods_detail_remark = goods_detail_remark;
	}
	@Column
	public String getGoods_detail_quantity() {
		return goods_detail_quantity;
	}
	public void setGoods_detail_quantity(String goods_detail_quantity) {
		this.goods_detail_quantity = goods_detail_quantity;
	}
	@Column
	public String getGoods_detail_units() {
		return goods_detail_units;
	}
	public void setGoods_detail_units(String goods_detail_units) {
		this.goods_detail_units = goods_detail_units;
	}
	@Column
	public String getGoods_detail_packing() {
		return goods_detail_packing;
	}
	public void setGoods_detail_packing(String goods_detail_packing) {
		this.goods_detail_packing = goods_detail_packing;
	}
	@Column
	public String getGoods_detail_taste() {
		return goods_detail_taste;
	}
	public void setGoods_detail_taste(String goods_detail_taste) {
		this.goods_detail_taste = goods_detail_taste;
	}
	@Column
	public String getGoods_detail_category() {
		return goods_detail_category;
	}
	public void setGoods_detail_category(String goods_detail_category) {
		this.goods_detail_category = goods_detail_category;
	}
	@Column
	public String getGoods_detail_time_last_update() {
		return goods_detail_time_last_update;
	}
	public void setGoods_detail_time_last_update(String goods_detail_time_last_update) {
		this.goods_detail_time_last_update = goods_detail_time_last_update;
	}
	@OneToMany(mappedBy="goodsDetail",fetch=FetchType.EAGER)
	public Set<GoodsDetailImage> getImages() {
		return images;
	}
	public void setImages(Set<GoodsDetailImage> images) {
		this.images = images;
	}
	
	
}
