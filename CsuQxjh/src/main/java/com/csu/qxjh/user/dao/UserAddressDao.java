package com.csu.qxjh.user.dao;

import java.util.List;

import com.csu.qxjh.user.pojo.UserAddress;

public interface UserAddressDao {
	void insert(UserAddress userAddress);//新建一条收货地址
	List<UserAddress> selectAllByUserId(String userId);//获取用户所有的收货地址
	void update(UserAddress userAddress);//更新收货地址
	UserAddress getByDefaultByUserId(String userId);//获取默认的收货地址
	List<UserAddress> getByNotDefaultByUserId(String userId);//获取用户除默认地址外所有的收货地址
}
