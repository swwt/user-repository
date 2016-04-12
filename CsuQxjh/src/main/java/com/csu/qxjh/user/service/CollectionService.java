package com.csu.qxjh.user.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.csu.qxjh.user.pojo.Collection;

public interface CollectionService {
	Collection getById(int id);
}
