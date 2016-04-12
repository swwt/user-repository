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
 * 评价表对应的图片
 */
@Entity
@Table(name="goods_comment_image")
public class GoodsCommentImage {
	private int id;//主键
	private GoodsComment goodsComment;//所属的评价
	private String goods_comment_image_src;//图片路径
	private String goods_comment_time;//上传时间，一般和评价信息对应
	public GoodsCommentImage() {
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
	@JoinColumn(name="goods_comment_id")
	@JsonIgnore
	public GoodsComment getGoodsComment() {
		return goodsComment;
	}
	
	public void setGoodsComment(GoodsComment goodsComment) {
		this.goodsComment = goodsComment;
	}
	@Column
	public String getGoods_comment_image_src() {
		return goods_comment_image_src;
	}

	public void setGoods_comment_image_src(String goods_comment_image_src) {
		this.goods_comment_image_src = goods_comment_image_src;
	}
	@Column
	public String getGoods_comment_time() {
		return goods_comment_time;
	}
	public void setGoods_comment_time(String goods_comment_time) {
		this.goods_comment_time = goods_comment_time;
	}
	
}
