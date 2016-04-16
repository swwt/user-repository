package com.csu.qxjh.goods.pojo;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.csu.qxjh.admin.pojo.Admin;
import com.fasterxml.jackson.annotation.JsonIgnore;


/*
 * 商品一级分类
 */
@Entity
@Table(name="goods_catagory_1")
public class GoodsCatagory1 {
	private int id;//主键
	private String goods_catagory1_name;//分类名称
	private String goods_catagory1_remark;//备注
	private String goods_catagory1_time_last_update;//该分类最后修改时间
	private String goods_catagory_1_icon;//该分类对应的一张标志性图片
	private Admin admin;//最后修改的管理员（管理员与该分类一对多）
	private List<GoodsCatagory2> goodsCatagory2List;//一级分类与二级分类一对多
	public GoodsCatagory1() {
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
	@Column
	public String getGoods_catagory1_name() {
		return goods_catagory1_name;
	}
	public void setGoods_catagory1_name(String goods_catagory1_name) {
		this.goods_catagory1_name = goods_catagory1_name;
	}
	@Column
	public String getGoods_catagory1_remark() {
		return goods_catagory1_remark;
	}
	public void setGoods_catagory1_remark(String goods_catagory1_remark) {
		this.goods_catagory1_remark = goods_catagory1_remark;
	}
	@Column
	public String getGoods_catagory1_time_last_update() {
		return goods_catagory1_time_last_update;
	}
	public void setGoods_catagory1_time_last_update(String goods_catagory1_time_last_update) {
		this.goods_catagory1_time_last_update = goods_catagory1_time_last_update;
	}
	@Column
	public String getGoods_catagory_1_icon() {
		return goods_catagory_1_icon;
	}
	public void setGoods_catagory_1_icon(String goods_catagory_1_icon) {
		this.goods_catagory_1_icon = goods_catagory_1_icon;
	}
	@ManyToOne
	@JoinColumn(name="admin_id")
	public Admin getAdmin() {
		return admin;
	}
	public void setAdmin(Admin admin) {
		this.admin = admin;
	}
	@OneToMany(mappedBy="goodsCatagory1",fetch=FetchType.LAZY)//指定由谁来维护关联关系
	//@JsonIgnore//------>防止返回json数据造成无限递归
	//@LazyCollection(LazyCollectionOption.EXTRA)
	//　　--->　　LazyCollection属性设置成EXTRA指定了当如果查询数据的个数时候，只会发出一条 count(*)的语句，提高性能
	//此设置易造成延迟加载异常
	public List<GoodsCatagory2> getGoodsCatagory2List() {
		return goodsCatagory2List;
	}
	public void setGoodsCatagory2List(List<GoodsCatagory2> goodsCatagory2List) {
		this.goodsCatagory2List = goodsCatagory2List;
	}
	
	
}
