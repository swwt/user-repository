package com.csu.qxjh.goods.dao;

import java.util.List;

import com.csu.qxjh.goods.pojo.GoodsComment;

public interface GoodsCommentDao {
	List<GoodsComment> selectByGoodsId(int goodsId);//查询某商品的评论，按时间排序
	int selectGrade(int id);//根据评价的几颗星查询对应的评价数量
}
