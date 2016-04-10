package com.csu.qxjh.goods.pojo;

import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.csu.qxjh.sellor.pojo.Sellor;
import com.csu.qxjh.user.pojo.Collection;
import com.csu.qxjh.user.pojo.GoodsOrder;
import com.fasterxml.jackson.annotation.JsonIgnore;

/*
 * 商品
 */
@Entity
@Table(name="goods")
public class Goods {
	private int id;//主键编号
	private GoodsCatagory2 goodsCatagory2;//与商品二级分类多对一
	private Sellor sellor;//与卖家多对一
	private String goods_name;//商品名字
	private String goods_introduction;//商品简介
	private String goods_remark;//备注
	private String goods_time_last_update;//该商品最后修改时间
	private int goods_number;//该商品库存
	private int goods_check_status;//该商品审核状态，0代表未审核，1代表审核
	private int goods_on_sale_status;//该商品上架状态，-1代表下架，0代表未上架，1代表上架
	private Set<GoodsComment> goodsComments;//与商品评价表一对多
	private int goods_promotion_type;//该商品是否有促销活动，0代表没有，1代表有
	private OfferPromotionFullsendproducts offerPromotionFullsendproducts;//与优惠促销 （满赠类的）一对一
	private OfferPromotionDiscount offerPromotionDiscount;//与优惠促销（折扣类的）一对一
	private OfferPromotionFullcutproducts OfferPromotionFullcutproducts;//与优惠促销（满减类的）一对一
	private Map<String,Double> goods_grade;//该商品评价率(三个键对应的是good（好评），medium（中评），bad（差评）)---通过计算而得（不存数据库）(两位小数)
	private Set<GoodsImage> images;//商品图片
	private Set<GoodsOrder> goodsOrders;//对应的订单
	private Set<Collection> collections;//对应我的收藏
	private GoodsDetail goodsDetail;//商品详情
	public Goods() {
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
	@ManyToOne()//EAGER，表示取出这条数据时，它关联的数据也同时取出放入内存中(防止延迟加载异常)
	//　　---> ManyToOne指定了多对一的关系，fetch=FetchType.LAZY属性表示在多的那一方通过延迟加载的方式加载对象(默认不是延迟加载)
	@JoinColumn(name="goods_catagory_2_id")
	//　　--->　　通过 JoinColumn 的name属性指定了外键的名称 rid　(注意：如果我们不通过JoinColum来指定外键的名称，系统会给我们声明一个名称)
	@JsonIgnore
	public GoodsCatagory2 getGoodsCatagory2() {
		return goodsCatagory2;
	}
	public void setGoodsCatagory2(GoodsCatagory2 goodsCatagory2) {
		this.goodsCatagory2 = goodsCatagory2;
	}
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="sellor_id")
	@JsonIgnore
	public Sellor getSellor() {
		return sellor;
	}
	public void setSellor(Sellor sellor) {
		this.sellor = sellor;
	}
	@Column
	public String getGoods_name() {
		return goods_name;
	}
	public void setGoods_name(String goods_name) {
		this.goods_name = goods_name;
	}
	@Column
	public String getGoods_introduction() {
		return goods_introduction;
	}
	public void setGoods_introduction(String goods_introduction) {
		this.goods_introduction = goods_introduction;
	}
	@Column
	public String getGoods_remark() {
		return goods_remark;
	}
	public void setGoods_remark(String goods_remark) {
		this.goods_remark = goods_remark;
	}
	@Column
	public String getGoods_time_last_update() {
		return goods_time_last_update;
	}
	public void setGoods_time_last_update(String goods_time_last_update) {
		this.goods_time_last_update = goods_time_last_update;
	}
	@Column
	public int getGoods_number() {
		return goods_number;
	}
	public void setGoods_number(int goods_number) {
		this.goods_number = goods_number;
	}
	@Column
	public int getGoods_promotion_type() {
		return goods_promotion_type;
	}
	public void setGoods_promotion_type(int goods_promotion_type) {
		this.goods_promotion_type = goods_promotion_type;
	}
	@OneToOne(fetch=FetchType.EAGER,mappedBy="goods")
	@JsonIgnore
	public OfferPromotionFullsendproducts getOfferPromotionFullsendproducts() {
		return offerPromotionFullsendproducts;
	}
	public void setOfferPromotionFullsendproducts(OfferPromotionFullsendproducts offerPromotionFullsendproducts) {
		this.offerPromotionFullsendproducts = offerPromotionFullsendproducts;
	}
	@OneToOne(fetch=FetchType.EAGER ,mappedBy="goods")
	@JsonIgnore
	public OfferPromotionDiscount getOfferPromotionDiscount() {
		return offerPromotionDiscount;
	}
	public void setOfferPromotionDiscount(OfferPromotionDiscount offerPromotionDiscount) {
		this.offerPromotionDiscount = offerPromotionDiscount;
	}
	
	
	@OneToOne(mappedBy="goods")
	@JsonIgnore
	public OfferPromotionFullcutproducts getOfferPromotionFullcutproducts() {
		return OfferPromotionFullcutproducts;
	}
	public void setOfferPromotionFullcutproducts(OfferPromotionFullcutproducts offerPromotionFullcutproducts) {
		OfferPromotionFullcutproducts = offerPromotionFullcutproducts;
	}
	@Column
	public int getGoods_check_status() {
		return goods_check_status;
	}
	public void setGoods_check_status(int goods_check_status) {
		this.goods_check_status = goods_check_status;
	}
	@Column
	public int getGoods_on_sale_status() {
		return goods_on_sale_status;
	}
	public void setGoods_on_sale_status(int goods_on_sale_status) {
		this.goods_on_sale_status = goods_on_sale_status;
	}
	@OneToMany(fetch=FetchType.EAGER ,mappedBy="goods")	
	public Set<GoodsComment> getGoodsComments() {
		return goodsComments;
	}
	public void setGoodsComments(Set<GoodsComment> goodsComments) {
		this.goodsComments = goodsComments;
	}

	
	
	@OneToMany(fetch=FetchType.EAGER,mappedBy="goods")
	public Set<GoodsImage> getImages() {
		return images;
	}
	
	@Transient
	public Map<String, Double> getGoods_grade() {
		return goods_grade;
	}
	public void setGoods_grade(Map<String, Double> goods_grade) {
		this.goods_grade = goods_grade;
	}
	public void setImages(Set<GoodsImage> images) {
		this.images = images;
	}
	@OneToMany(fetch=FetchType.EAGER,mappedBy="goods")	
	public Set<GoodsOrder> getGoodsOrders() {
		return goodsOrders;
	}
	public void setGoodsOrders(Set<GoodsOrder> goodsOrders) {
		this.goodsOrders = goodsOrders;
	}
	
	@ManyToMany(mappedBy="goodsList")
	@JsonIgnore
	public Set<Collection> getCollections() {
		return collections;
	}
	public void setCollections(Set<Collection> collections) {
		this.collections = collections;
	}
	@OneToOne(fetch=FetchType.EAGER,mappedBy="goods")	
	public GoodsDetail getGoodsDetail() {
		return goodsDetail;
	}
	public void setGoodsDetail(GoodsDetail goodsDetail) {
		this.goodsDetail = goodsDetail;
	}
	
	
	
}
