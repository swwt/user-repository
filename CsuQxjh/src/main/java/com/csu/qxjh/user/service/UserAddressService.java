package com.csu.qxjh.user.service;

import java.util.List;

import org.apache.tomcat.jni.Address;

import com.csu.qxjh.user.pojo.UserAddress;

public interface UserAddressService {
	void addAddress(UserAddress userAddress);
	List<UserAddress> getAllAddress(String userId);
	void setAddressDefault(UserAddress userAddress);
	void updateAddress(UserAddress userAddress);
	UserAddress getDefaultAddress(String userId);//获取用户默认的收货地址
	List<UserAddress> getByNotDefaultByUserId(String userId);//获取用户除默认地址外所有的收货地址
}
