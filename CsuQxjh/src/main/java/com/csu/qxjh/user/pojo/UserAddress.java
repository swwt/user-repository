package com.csu.qxjh.user.pojo;

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
 * 收货地址
 */
@Entity
@Table(name="user_address")
public class UserAddress {
	private int id;//主键
	private User user;//所属用户
	private String user_address_name;//收货人姓名
	private String user_address_phone;//收货人电话
	private String user_address_province;//省份
	private String user_address_city;//市
	private String user_address_county;//区/县
	private String user_address_street;//街道地址
	private String user_address_remark;//备注
	private String user_address_change_time;//修改时间
	private int user_address_type;//是否默认地址 0代表不是，1代表默认地址
	@Id
	@GeneratedValue
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	@Column
	public String getUser_address_province() {
		return user_address_province;
	}
	public void setUser_address_province(String user_address_province) {
		this.user_address_province = user_address_province;
	}
	@Column
	public String getUser_address_city() {
		return user_address_city;
	}
	public void setUser_address_city(String user_address_city) {
		this.user_address_city = user_address_city;
	}
	@Column
	public String getUser_address_county() {
		return user_address_county;
	}
	public void setUser_address_county(String user_address_county) {
		this.user_address_county = user_address_county;
	}
	@Column
	public String getUser_address_street() {
		return user_address_street;
	}
	public void setUser_address_street(String user_address_street) {
		this.user_address_street = user_address_street;
	}
	@Column
	public String getUser_address_remark() {
		return user_address_remark;
	}
	public void setUser_address_remark(String user_address_remark) {
		this.user_address_remark = user_address_remark;
	}
	@Column
	public String getUser_address_change_time() {
		return user_address_change_time;
	}
	public void setUser_address_change_time(String user_address_change_time) {
		this.user_address_change_time = user_address_change_time;
	}
	@Column
	public int getUser_address_type() {
		return user_address_type;
	}
	public void setUser_address_type(int user_address_type) {
		this.user_address_type = user_address_type;
	}
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="user_id")
	@JsonIgnore
	public User getUser(){
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	@Column
	public String getUser_address_name() {
		return user_address_name;
	}
	public void setUser_address_name(String user_address_name) {
		this.user_address_name = user_address_name;
	}
	@Column
	public String getUser_address_phone() {
		return user_address_phone;
	}
	public void setUser_address_phone(String user_address_phone) {
		this.user_address_phone = user_address_phone;
	}
	
}
