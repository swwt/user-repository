package com.csu.qxjh.sellor.dao;

import com.csu.qxjh.sellor.pojo.Sellor;

public interface SellorDao {
	Sellor selectById(String id);//根据主键获取对应的卖家信息
}
