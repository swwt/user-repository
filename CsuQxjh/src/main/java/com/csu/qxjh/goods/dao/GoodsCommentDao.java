package com.csu.qxjh.goods.dao;

import java.util.List;

import com.csu.qxjh.goods.pojo.GoodsComment;

public interface GoodsCommentDao {
//	List<GoodsComment> selectByGoodsId(int goodsId);//查询某商品的评论，按时间排序
	int selectGrade(int goodsId, int start,int end);//根据评价大于小于几颗星查询商品对应的评价数量,包括start和end
	void insert(GoodsComment goodsComment);//新加一条评价信息
	GoodsComment selectById(int id);//根据主键查询评价信息
	void update(GoodsComment goodsComment);//更新某条评价的信息
}
