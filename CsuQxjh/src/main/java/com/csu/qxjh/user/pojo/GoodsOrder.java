package com.csu.qxjh.user.pojo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

import com.csu.qxjh.goods.pojo.Goods;
import com.csu.qxjh.goods.pojo.PromotionGifs;
import com.fasterxml.jackson.annotation.JsonIgnore;

/*
 * 商品订单
 */
@Entity
@Table(name="goods_order")
public class GoodsOrder {
	private String id;//主键
	private Goods goods;//所属商品
	private User user;//所属用户
	private int goods_order_amount;//商品数量
	private String goods_order_unit;//商品单位
	private double goods_order_shipping_costs;//运费
	private double goods_order_price;//商品总价
//	private UserAddress address;//收货地址
	private String goods_order_create_time;//下单时间
	private int goods_order_deliver_status;//发货状态，0代表未发货，1代表已发货
	private int goods_order_gain_status;//收货状态，0代表未收货，1代表已收货
	private String goods_order_remark;//备注，买家留言
	private int goods_order_evaluate_status;//是否评价，0代表已评价，1代表已收货
	private int goods_order_payment_status;//是否付款，0代表已付款，1代表未付款
	private int goods_order_gift_type;//是否有赠品，0代表有，1代表没有
//	private PromotionGifs promotionGifs;//赠品
	private int promotion_gifs_amount;//赠品数量
	private String promotion_name;//促销类型内容（对应的是offer_promotion_type中的优惠促销的中文表格名）
	private String goods_order_pay_way;//支付方式
	private String goods_order_send_way;//收货方式
	private int goods_order_user_use;//用户是否保留该订单记录，0代表不保留，1代表保留
	public GoodsOrder() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Id//指定主键UUID生成
	@GenericGenerator(name="systemUUID",strategy="uuid")
	@GeneratedValue(generator="systemUUID")
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	@ManyToOne
	@JoinColumn(name="goods_id")
	@JsonIgnore
	public Goods getGoods() {
		return goods;
	}
	public void setGoods(Goods goods) {
		this.goods = goods;
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
	@Column
	public int getGoods_order_amount() {
		return goods_order_amount;
	}
	public void setGoods_order_amount(int goods_order_amount) {
		this.goods_order_amount = goods_order_amount;
	}
	@Column
	public String getGoods_order_unit() {
		return goods_order_unit;
	}
	public void setGoods_order_unit(String goods_order_unit) {
		this.goods_order_unit = goods_order_unit;
	}
	@Column
	public double getGoods_order_shipping_costs() {
		return goods_order_shipping_costs;
	}
	public void setGoods_order_shipping_costs(double goods_order_shipping_costs) {
		this.goods_order_shipping_costs = goods_order_shipping_costs;
	}
	@Column
	public double getGoods_order_price() {
		return goods_order_price;
	}
	public void setGoods_order_price(double goods_order_price) {
		this.goods_order_price = goods_order_price;
	}
//	public UserAddress getAddress() {
//		return address;
//	}
//	public void setAddress(UserAddress address) {
//		this.address = address;
//	}
	@Column
	public String getGoods_order_create_time() {
		return goods_order_create_time;
	}
	public void setGoods_order_create_time(String goods_order_create_time) {
		this.goods_order_create_time = goods_order_create_time;
	}
	@Column
	public int getGoods_order_deliver_status() {
		return goods_order_deliver_status;
	}
	public void setGoods_order_deliver_status(int goods_order_deliver_status) {
		this.goods_order_deliver_status = goods_order_deliver_status;
	}
	@Column
	public int getGoods_order_gain_status() {
		return goods_order_gain_status;
	}
	public void setGoods_order_gain_status(int goods_order_gain_status) {
		this.goods_order_gain_status = goods_order_gain_status;
	}
	@Column
	public String getGoods_order_remark() {
		return goods_order_remark;
	}
	public void setGoods_order_remark(String goods_order_remark) {
		this.goods_order_remark = goods_order_remark;
	}
	@Column
	public int getGoods_order_evaluate_status() {
		return goods_order_evaluate_status;
	}
	public void setGoods_order_evaluate_status(int goods_order_evaluate_status) {
		this.goods_order_evaluate_status = goods_order_evaluate_status;
	}
	@Column
	public int getGoods_order_payment_status() {
		return goods_order_payment_status;
	}
	public void setGoods_order_payment_status(int goods_order_payment_status) {
		this.goods_order_payment_status = goods_order_payment_status;
	}
	@Column
	public int getGoods_order_gift_type() {
		return goods_order_gift_type;
	}
	public void setGoods_order_gift_type(int goods_order_gift_type) {
		this.goods_order_gift_type = goods_order_gift_type;
	}
//	public PromotionGifs getPromotionGifs() {
//		return promotionGifs;
//	}
//	public void setPromotionGifs(PromotionGifs promotionGifs) {
//		this.promotionGifs = promotionGifs;
//	}
	@Column
	public int getPromotion_gifs_amount() {
		return promotion_gifs_amount;
	}
	public void setPromotion_gifs_amount(int promotion_gifs_amount) {
		this.promotion_gifs_amount = promotion_gifs_amount;
	}
	@Column
	public String getPromotion_name() {
		return promotion_name;
	}
	public void setPromotion_name(String promotion_name) {
		this.promotion_name = promotion_name;
	}
	@Column
	public String getGoods_order_pay_way() {
		return goods_order_pay_way;
	}
	public void setGoods_order_pay_way(String goods_order_pay_way) {
		this.goods_order_pay_way = goods_order_pay_way;
	}
	@Column
	public String getGoods_order_send_way() {
		return goods_order_send_way;
	}
	public void setGoods_order_send_way(String goods_order_send_way) {
		this.goods_order_send_way = goods_order_send_way;
	}
	@Column
	public int getGoods_order_user_use() {
		return goods_order_user_use;
	}
	public void setGoods_order_user_use(int goods_order_user_use) {
		this.goods_order_user_use = goods_order_user_use;
	}

	
}
