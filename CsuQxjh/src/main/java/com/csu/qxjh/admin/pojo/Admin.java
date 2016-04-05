package com.csu.qxjh.admin.pojo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

/*
 * 管理员
 */
@Entity
@Table(name="admin")
public class Admin {
	private String id;//主键
	private String admin_name;//管理员用户名(值与主键相同)
	private String admin_real_name;//真实名字
	private String admin_login_name;//登录名
	private String admin_password;//密码
	private int admin_sex;//性别（0：男;1：女）
	private String admin_phone;//联系电话
	private String admin_email;//邮箱
	private String admin_address;//联系地址
	private int admin_degree;//管理员级别
	private String admin_time;//管理员信息最后修改时间
	public Admin() {
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
	public String getAdmin_name() {
		return admin_name;
	}
	public void setAdmin_name(String admin_name) {
		this.admin_name = admin_name;
	}
	@Column
	public String getAdmin_real_name() {
		return admin_real_name;
	}
	public void setAdmin_real_name(String admin_real_name) {
		this.admin_real_name = admin_real_name;
	}
	@Column
	public String getAdmin_login_name() {
		return admin_login_name;
	}
	public void setAdmin_login_name(String admin_login_name) {
		this.admin_login_name = admin_login_name;
	}
	@Column
	public String getAdmin_password() {
		return admin_password;
	}
	public void setAdmin_password(String admin_password) {
		this.admin_password = admin_password;
	}
	@Column
	public int getAdmin_sex() {
		return admin_sex;
	}
	public void setAdmin_sex(int admin_sex) {
		this.admin_sex = admin_sex;
	}
	@Column
	public String getAdmin_phone() {
		return admin_phone;
	}
	public void setAdmin_phone(String admin_phone) {
		this.admin_phone = admin_phone;
	}
	@Column
	public String getAdmin_email() {
		return admin_email;
	}
	public void setAdmin_email(String admin_email) {
		this.admin_email = admin_email;
	}
	@Column
	public String getAdmin_address() {
		return admin_address;
	}
	public void setAdmin_address(String admin_address) {
		this.admin_address = admin_address;
	}
	@Column
	public int getAdmin_degree() {
		return admin_degree;
	}
	public void setAdmin_degree(int admin_degree) {
		this.admin_degree = admin_degree;
	}
	@Column
	public String getAdmin_time() {
		return admin_time;
	}
	public void setAdmin_time(String admin_time) {
		this.admin_time = admin_time;
	}
	
	
}
