package com.csu.qxjh.sellor.pojo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

/*
 * 卖家
 */
@Entity
@Table(name="sellor")
public class Sellor {
	private String id;//	编号
	private String sellor_name;//	用户名
	private String sellor_real_name;//	真实姓名
	private String sellor_login_name;//	登录名
	private String sellor_nickname;//	昵称
	private int sellor_sex;//	性别
	private String sellor_main;//	卖家主营人
	private String sellor_address;//	联系地址
	private String sellor_phone;//	电话
	private String sellor_email;//	邮箱
	private String sellor_head_image;//	卖家头像
	private String sellor_store_id;//店铺编号
	private String sellor_password;//	密码
	private int sellor_services_index;//	店铺服务指数
	private int sellor_evaluation_index;//	商品评价指数
	private int sellor_logistic_index;//	物流速度
	private String sellor_qr_code;//	店铺二维码
	private String sellor_introduction;//	店铺简介
	private String sellor_company;//	公司名称
	private String sellor_company_address;//	所在地区
	private String sellor_store_time;//	开店时间
	public Sellor() {
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
	@Column
	public String getSellor_name() {
		return sellor_name;
	}
	public void setSellor_name(String sellor_name) {
		this.sellor_name = sellor_name;
	}
	@Column
	public String getSellor_real_name() {
		return sellor_real_name;
	}
	public void setSellor_real_name(String sellor_real_name) {
		this.sellor_real_name = sellor_real_name;
	}
	@Column
	public String getSellor_login_name() {
		return sellor_login_name;
	}
	public void setSellor_login_name(String sellor_login_name) {
		this.sellor_login_name = sellor_login_name;
	}
	@Column
	public String getSellor_nickname() {
		return sellor_nickname;
	}
	public void setSellor_nickname(String sellor_nickname) {
		this.sellor_nickname = sellor_nickname;
	}
	@Column
	public int getSellor_sex() {
		return sellor_sex;
	}
	public void setSellor_sex(int sellor_sex) {
		this.sellor_sex = sellor_sex;
	}
	@Column
	public String getSellor_main() {
		return sellor_main;
	}
	public void setSellor_main(String sellor_main) {
		this.sellor_main = sellor_main;
	}
	@Column
	public String getSellor_address() {
		return sellor_address;
	}
	public void setSellor_address(String sellor_address) {
		this.sellor_address = sellor_address;
	}
	@Column
	public String getSellor_phone() {
		return sellor_phone;
	}
	public void setSellor_phone(String sellor_phone) {
		this.sellor_phone = sellor_phone;
	}
	@Column
	public String getSellor_email() {
		return sellor_email;
	}
	public void setSellor_email(String sellor_email) {
		this.sellor_email = sellor_email;
	}
	@Column
	public String getSellor_head_image() {
		return sellor_head_image;
	}
	public void setSellor_head_image(String sellor_head_image) {
		this.sellor_head_image = sellor_head_image;
	}
	@Column
	public String getSellor_store_id() {
		return sellor_store_id;
	}
	public void setSellor_store_id(String sellor_store_id) {
		this.sellor_store_id = sellor_store_id;
	}
	@Column
	public String getSellor_password() {
		return sellor_password;
	}
	public void setSellor_password(String sellor_password) {
		this.sellor_password = sellor_password;
	}
	@Column
	public int getSellor_services_index() {
		return sellor_services_index;
	}
	public void setSellor_services_index(int sellor_services_index) {
		this.sellor_services_index = sellor_services_index;
	}
	@Column
	public int getSellor_evaluation_index() {
		return sellor_evaluation_index;
	}
	public void setSellor_evaluation_index(int sellor_evaluation_index) {
		this.sellor_evaluation_index = sellor_evaluation_index;
	}
	@Column
	public int getSellor_logistic_index() {
		return sellor_logistic_index;
	}
	public void setSellor_logistic_index(int sellor_logistic_index) {
		this.sellor_logistic_index = sellor_logistic_index;
	}
	@Column
	public String getSellor_qr_code() {
		return sellor_qr_code;
	}
	public void setSellor_qr_code(String sellor_qr_code) {
		this.sellor_qr_code = sellor_qr_code;
	}
	@Column
	public String getSellor_introduction() {
		return sellor_introduction;
	}
	public void setSellor_introduction(String sellor_introduction) {
		this.sellor_introduction = sellor_introduction;
	}
	@Column
	public String getSellor_company() {
		return sellor_company;
	}
	public void setSellor_company(String sellor_company) {
		this.sellor_company = sellor_company;
	}
	@Column
	public String getSellor_company_address() {
		return sellor_company_address;
	}
	public void setSellor_company_address(String sellor_company_address) {
		this.sellor_company_address = sellor_company_address;
	}
	@Column
	public String getSellor_store_time() {
		return sellor_store_time;
	}
	public void setSellor_store_time(String sellor_store_time) {
		this.sellor_store_time = sellor_store_time;
	}

	
}
