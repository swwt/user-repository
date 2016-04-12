package com.csu.qxjh.user.service.impl;
import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.csu.qxjh.user.dao.CollectionDao;
import com.csu.qxjh.user.pojo.Collection;
import com.csu.qxjh.user.service.CollectionService;

@Transactional(propagation=Propagation.REQUIRED)
@Service
public class CollectionServiceImpl implements CollectionService{
	@Resource
	private CollectionDao collection;
	@Override
	public Collection getById(int id) {
		// TODO Auto-generated method stub
		return collection.selectById(id);
	}

}
