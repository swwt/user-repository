package com.csu.qxjh.user.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.csu.qxjh.user.dao.UserAddressDao;
import com.csu.qxjh.user.pojo.UserAddress;
import com.csu.qxjh.user.service.UserAddressService;

@Transactional(propagation = Propagation.REQUIRED)
@Service
public class UserAddressServiceImpl implements UserAddressService{
	@Resource
	private UserAddressDao userAddressDao;
	@Override
	public void addAddress(UserAddress userAddress) {
		// TODO Auto-generated method stub
		userAddressDao.insert(userAddress);
	}

}
