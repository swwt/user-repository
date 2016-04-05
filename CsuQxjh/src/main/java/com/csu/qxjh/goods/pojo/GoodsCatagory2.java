package com.csu.qxjh.goods.pojo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.csu.qxjh.admin.pojo.Admin;

/*
 * 商品二级分类
 */
@Entity
@Table(name="goods_catagory_2")
public class GoodsCatagory2 {
	private int id;//主键
	private GoodsCatagory1 goodsCatagory1;//商品一级分类（商品一级分类与二级分类一对多）
	private String goods_catagory_2_name;//分类名称
	private String goods_catagory_2_icon;//分类对应的一张图片
	private String goods_catagory_2_time_last_update;//该分类最后修改时间
	private String goods_catagory_2_remark;//备注
	private int  goods_catagory_2_type;//分类的类型(分类的类型，0代表普通分类，1代表专场分类，2代表热门分类)--》对应的是推荐分类的那一栏
	private Admin admin;//该分类最后修改管理员（管理员与该分类一对多）
	public GoodsCatagory2() {
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
	
	@ManyToOne()
	//　　---> ManyToOne指定了多对一的关系，fetch=FetchType.LAZY属性表示在多的那一方通过延迟加载的方式加载对象(默认不是延迟加载)
	@JoinColumn(name="goods_catagory_1_id")
	//　　--->　　通过 JoinColumn 的name属性指定了外键的名称 rid　(注意：如果我们不通过JoinColum来指定外键的名称，系统会给我们声明一个名称)
	public GoodsCatagory1 getGoodsCatagory1() {
		return goodsCatagory1;
	}
	public void setGoodsCatagory1(GoodsCatagory1 goodsCatagory1) {
		this.goodsCatagory1 = goodsCatagory1;
	}
	@Column
	public String getGoods_catagory_2_name() {
		return goods_catagory_2_name;
	}
	public void setGoods_catagory_2_name(String goods_catagory_2_name) {
		this.goods_catagory_2_name = goods_catagory_2_name;
	}
	@Column
	public String getGoods_catagory_2_icon() {
		return goods_catagory_2_icon;
	}
	public void setGoods_catagory_2_icon(String goods_catagory_2_icon) {
		this.goods_catagory_2_icon = goods_catagory_2_icon;
	}
	@Column
	public String getGoods_catagory_2_time_last_update() {
		return goods_catagory_2_time_last_update;
	}
	public void setGoods_catagory_2_time_last_update(String goods_catagory_2_time_last_update) {
		this.goods_catagory_2_time_last_update = goods_catagory_2_time_last_update;
	}
	@Column
	public String getGoods_catagory_2_remark() {
		return goods_catagory_2_remark;
	}
	public void setGoods_catagory_2_remark(String goods_catagory_2_remark) {
		this.goods_catagory_2_remark = goods_catagory_2_remark;
	}
	@Column
	public int getGoods_catagory_2_type() {
		return goods_catagory_2_type;
	}
	public void setGoods_catagory_2_type(int goods_catagory_2_type) {
		this.goods_catagory_2_type = goods_catagory_2_type;
	}
	//@Transient
	@ManyToOne
	@JoinColumn(name="admin_id")
	public Admin getAdmin() {
		return admin;
	}
	public void setAdmin(Admin admin) {
		this.admin = admin;
	}
	
	
}
