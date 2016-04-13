package com.csu.qxjh.sellor.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.csu.qxjh.sellor.dao.SellorDao;
import com.csu.qxjh.sellor.pojo.Sellor;
import com.csu.qxjh.sellor.service.SellorService;
import com.csu.qxjh.user.pojo.User;
import com.csu.qxjh.util.PageUtils;
import com.csu.qxjh.util.PropertiesUtils;

//如果有事务,那么加入事务,没有的话新建一个
@Transactional(propagation = Propagation.REQUIRED)
@Service
public class SellorServiceImpl implements SellorService{

	/**
	 * 商家管理界面最多显示的记录的个数
	 */
	private static final int page_size_in_sellor_manager = Integer
			.parseInt(PropertiesUtils.get("page_size_in_sellor_manager"));
	
	@Resource
	private SellorDao sellorDao;
	
	@Override
	public Map<String, Object> fuzzyPageQuery(int param_targetPageIndex, String param_key) {
		
		/* 模糊查询的字段名称 */
		final String field_name = "sellor_login_name";
		
		Map<String, Object> result = new HashMap<>();

		int pageSize = page_size_in_sellor_manager;

		Map<String, Integer> startAndEnd;
		Integer pageIndex = param_targetPageIndex;
		Integer pageCounts = null;
		String key = param_key;
		List<Sellor> sellors = null;

		int recordCounts = -1;

		/* 如果查询关键为空 */
		if (key == null || key.equals("")) {
			sellors = sellorDao.pageQuery(Sellor.class, null, pageIndex, pageSize, true);
			recordCounts = sellorDao.pageQueryCounts(Sellor.class, null);
		} else {
			Map<String, String> conditions = new HashMap<>();
			conditions.put(field_name, key);
			sellors = sellorDao.pageFuzzyQuery(Sellor.class, conditions, pageIndex, pageSize, true);
			recordCounts = sellorDao.pageFuzzyQueryCounts(Sellor.class, conditions);
		}

		pageCounts = recordCounts / pageSize;
		if (recordCounts % pageSize != 0 && recordCounts > 0) {
			pageCounts++;
		}

		startAndEnd = PageUtils.getStartAndEnd(pageIndex, pageCounts);

		result.put("startAndEnd", startAndEnd);
		result.put("pageIndex", pageIndex);
		result.put("pageCounts", pageCounts);
		result.put("key", key);
		result.put("sellors", sellors);

		return result;
	}

}
