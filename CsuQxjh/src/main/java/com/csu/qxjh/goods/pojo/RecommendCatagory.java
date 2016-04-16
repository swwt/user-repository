package com.csu.qxjh.goods.pojo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/*
 * 推荐分类对应的信息，现在暂时只有图片信息，即对应webapp推荐分类对应的第一张图片的显示
 */
@Entity
@Table(name="recommend_catagory")
public class RecommendCatagory {
	private int id;//主键id
	private String recommend_catagory_image;//推荐分类对应的图片路径
	
	
	public RecommendCatagory() {
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
	public String getRecommend_catagory_image() {
		return recommend_catagory_image;
	}
	public void setRecommend_catagory_image(String recommend_catagory_image) {
		this.recommend_catagory_image = recommend_catagory_image;
	}
	
}
