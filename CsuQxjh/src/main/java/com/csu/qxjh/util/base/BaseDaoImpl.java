package com.csu.qxjh.util.base;

import java.io.Serializable;
import java.lang.annotation.Annotation;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.persistence.Table;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Repository
public class BaseDaoImpl<T> implements BaseDao<T> {

	@Autowired
	private SessionFactory sessionFactiry;

	private SessionFactory getSessionFactory() {
		return sessionFactiry;
	}

	@Override
	public T get(Class<T> entityClass, Serializable id) {
		Session session = getSessionFactory().getCurrentSession();
		T result = (T) session.get(entityClass, id);
		session.close();
		return result;
	}

	@Override
	public Serializable save(T entity) {
		Session session = getSessionFactory().getCurrentSession();
//		Transaction transaction = session.beginTransaction();
		Serializable result = session.save(entity);
//		transaction.commit();
//		session.close();
		return result;
	}

	@Override
	public void update(T entity) {
		Session session = getSessionFactory().getCurrentSession();
//		Transaction transaction = session.beginTransaction();
		session.update(entity);
//		transaction.commit();
//		session.close();
	}

	@Override
	public void delete(T entity) {
		Session session = getSessionFactory().getCurrentSession();
//		Transaction transaction = session.beginTransaction();
		session.delete(entity);
//		transaction.commit();
//		session.close();
	}

	@Override
	public void delete(Class<T> entityClass, Serializable id) {

		Session session = getSessionFactory().getCurrentSession();

		T t = (T) session.get(entityClass, id);
		if (t != null) {
//			Transaction transaction = session.beginTransaction();
			session.delete(t);
//			transaction.commit();
		} else {
			System.out.println("数据不存在，删除不成功！");
		}
//		session.close();
	}

	@Override
	public List<T> findAll(Class<T> entityClass) {
		List<T> tList = null;
		Session session = getSessionFactory().openSession();
		Table annotation = entityClass.getAnnotation(Table.class);
		if (annotation != null) {
			StringBuffer hql = new StringBuffer("From ");
			/* 获取实体类映射的表名 */
			hql.append(annotation.name() + " ");
			Query query = session.createQuery(hql.toString());
			tList = query.list();
		} else {
			System.out.println("找不到实体类所映射的表名，查询失败！");
		}
//		session.close();
		return tList;
	}

	@Override
	public int findCount(Class<T> entityClass) {
		int result = -1;
		Session session = getSessionFactory().openSession();
		Table annotation = entityClass.getAnnotation(Table.class);
		if (annotation != null) {
			StringBuffer hql = new StringBuffer("From ");
			/* 获取实体类映射的表名 */
			hql.append(annotation.name() + " ");
			Query query = session.createQuery(hql.toString());
			result = Integer.parseInt(query.uniqueResult().toString());
		} else {
			System.out.println("找不到实体类所映射的表名，查询失败！");
		}
//		session.close();
		return result;
	}

	@Override
	public List<T> pageQuery(Class<T> entityClass, Map<String, String> conditions, int start, int length,
			String[] orderConditions ,boolean isDesc) {

		List<T> tList = null;

		Session session = getSessionFactory().openSession();
		Table annotation = entityClass.getAnnotation(Table.class);
		if (annotation != null) {
			String hql = getHQL(entityClass, conditions, isDesc, false, false,orderConditions);
			// System.out.println(hql);
			Query query = session.createQuery(hql.toString());
			query.setFirstResult((start - 1) * length);
			query.setMaxResults(length);
			tList = query.list();
		} else {
			System.out.println("找不到实体类所映射的表名，查询失败！");
		}

//		session.close();
		return tList;
	}

	@Override
	public int pageQueryCounts(Class<T> entityClass, Map<String, String> conditions) {

		int result = -1;

		Session session = getSessionFactory().openSession();
		Table annotation = entityClass.getAnnotation(Table.class);
		if (annotation != null) {
			String hql = getHQL(entityClass, conditions, false, false, true,null);

			Query query = session.createQuery(hql.toString());

			result = Integer.parseInt(query.uniqueResult().toString());
		} else {
			System.out.println("找不到实体类所映射的表名，查询失败！");
		}

//		session.close();
		return result;
	}

	@Override
	public List<T> pageFuzzyQuery(Class<T> entityClass, Map<String, String> conditions, int start, int length,
			String[] orderConditions ,boolean isDesc) {
		List<T> tList = null;

		Session session = getSessionFactory().openSession();
		Table annotation = entityClass.getAnnotation(Table.class);

		String hql = getHQL(entityClass, conditions, isDesc, true, false,orderConditions);
		// System.out.println(hql.toString());
		Query query = session.createQuery(hql.toString());
		
		query.setFirstResult((start - 1) * length);
		query.setMaxResults(length);
		
		tList = query.list();
//		session.close();

		return tList;
	}

	@Override
	public int pageFuzzyQueryCounts(Class<T> entityClass, Map<String, String> conditions) {
		// TODO Auto-generated method stub
		int result = -1;

		Session session = getSessionFactory().openSession();
		Table annotation = entityClass.getAnnotation(Table.class);

		String hql = getHQL(entityClass, conditions, false, true, true,null);
		// System.out.println(hql.toString());
		Query query = session.createQuery(hql.toString());
		result = Integer.parseInt(query.uniqueResult().toString());
//		session.close();

		return result;
	}

	private String getHQL(Class<T> entityClass, Map<String, String> conditions, boolean isDesc, boolean isFuzzy,
			boolean isCount,String[] orderConditions) {

		StringBuffer hql = new StringBuffer();

		if (isCount) {
			hql.append("select count(id) ");
		}

		hql.append(" from ");
		/* 获取实体类映射的表名 */
		hql.append(entityClass.getName() + " ");
		/* 如果查询的条件存在 */
		if (conditions != null && conditions.size() > 0) {
			hql.append("where ");
			Set<String> fields = conditions.keySet();
			Iterator<String> iterator = fields.iterator();

			while (iterator.hasNext()) {
				String field = iterator.next();
				hql.append(field);
				/* 是否为模糊查询 */
				if (isFuzzy) {
					hql.append(" like ");
					hql.append("'%" + conditions.get(field) + "%'");
				} else {
					hql.append("=");
					hql.append("'" + conditions.get(field) + "'");
				}
				if (iterator.hasNext()) {
					hql.append(" and ");
				}
			}
		}

		if (orderConditions!=null && orderConditions.length>0) {
			hql.append(" order by ");
			for(int i=0; i< orderConditions.length; i++){
				hql.append(orderConditions[i]);
				if (i!=orderConditions.length-1) {
					hql.append(",");
				}
			}
		}
		
		if (isDesc) {
			hql.append(" desc");
		}
		System.out.println(hql);
		return hql.toString();
	}
}
