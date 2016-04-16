package com.csu.qxjh.user.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.tomcat.jni.Address;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.csu.qxjh.user.dao.UserAddressDao;
import com.csu.qxjh.user.pojo.UserAddress;
import com.csu.qxjh.user.service.UserAddressService;
import com.csu.qxjh.util.DateUtil;

@Transactional(propagation = Propagation.REQUIRED)
@Service
public class UserAddressServiceImpl implements UserAddressService{
	@Resource
	private UserAddressDao userAddressDao;
	@Override
	public void addAddress(UserAddress userAddress) {
		// TODO Auto-generated method stub
		userAddress.setUser_address_change_time(DateUtil.getDate());
		userAddressDao.insert(userAddress);
	}
	@Override
	public List<UserAddress> getAllAddress(String userId) {
		// TODO Auto-generated method stub
		return userAddressDao.selectAllByUserId(userId);
	}
	@Override
	public void setAddressDefault(UserAddress userAddress) {
		// TODO Auto-generated method stub
		UserAddress userAddressDefault=userAddressDao.getByDefaultByUserId(userAddress.getUser().getId());
		userAddressDefault.setUser_address_type(0);
		userAddressDao.update(userAddressDefault);
		userAddressDefault.setUser_address_change_time(DateUtil.getDate());
		userAddress.setUser_address_change_time(DateUtil.getDate());
		userAddress.setUser_address_type(1);
		userAddressDao.update(userAddress);
	}
	@Override
	public void updateAddress(UserAddress userAddress) {
		// TODO Auto-generated method stub
		userAddress.setUser_address_change_time(DateUtil.getDate());
		userAddressDao.update(userAddress);
	}
	@Override
	public UserAddress getDefaultAddress(String userId) {
		// TODO Auto-generated method stub
		return userAddressDao.getByDefaultByUserId(userId);
	}
	@Override
	public List<UserAddress> getByNotDefaultByUserId(String userId) {
		// TODO Auto-generated method stub
		return userAddressDao.getByNotDefaultByUserId(userId);
	}

}
