package com.csu.qxjh.user.dao;

import com.csu.qxjh.user.pojo.Collection;

public interface CollectionDao {
	void insert(Collection collection);//添加收藏表 
	Collection selectById(int id);//根据主键查询收藏的信息
}
