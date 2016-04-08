package com.csu.qxjh.util.base;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

public interface BaseDao<T> {
	/**
	 * 根据javaBean映射数据库表的id，查找该条数据
	 * 
	 * @param entityClass
	 * @param id
	 * @return
	 */
	T get(Class<T> entityClass, Serializable id);

	/**
	 * 持久化javaBean
	 * 
	 * @param entity
	 * @return
	 */
	Serializable save(T entity);

	/**
	 * 更新javaBean
	 * 
	 * @param entity
	 */
	void update(T entity);

	/**
	 * 删除JavaBean在数据库中对应的记录
	 * 
	 * @param entity
	 */
	void delete(T entity);

	/**
	 * 根据id删除javaBean在数据库中的记录
	 * 
	 * @param entity
	 * @param id
	 */
	void delete(Class<T> entityClass, Serializable id);

	/**
	 * 查找javaBean在数据库中的所有记录
	 * 
	 * @param entityClass
	 * @return TODO
	 */
	List<T> findAll(Class<T> entityClass);

	/**
	 * 查找javaBean在数据库中所有记录的个数
	 * 
	 * @param entityClass
	 */
	int findCount(Class<T> entityClass);

	/**
	 * 条件分页查询
	 * 
	 * @param entityClass实体类
	 * @param fields条件字段
	 * @param values条件值
	 * @param start起始页
	 * @param length页长
	 * @param isDesc是否逆序
	 * @return实体类数组
	 */
	List<T> pageQuery(Class<T> entityClass, Map<String, String> conditions, int start, int length, boolean isDesc);

	/**条件查询结果记录的个数
	 * @param entityClass实体类
	 * @param fields条件字段
	 * @param values字段值
	 * @return查询结果个数
	 */
	int pageQueryCounts(Class<T> entityClass, Map<String, String> conditions);
	
	/**根据某个条件分页模糊查询
	 * @param entityClass实体类
	 * @param field查询字段
	 * @param value字段模糊值
	 * @param start起始页
	 * @param length页长
	 * @param isDesc是否逆序
	 * @return实体类数组
	 */
	List<T> pageFuzzyQuery(Class<T> entityClass, Map<String, String> conditions, int start, int length, boolean isDesc);

	/**模糊模糊查询记录的个数
	 * @param entityClass
	 * @param field
	 * @param value
	 * @return
	 */
	int pageFuzzyQueryCounts(Class<T> entityClass, Map<String, String> conditions);
	
}
