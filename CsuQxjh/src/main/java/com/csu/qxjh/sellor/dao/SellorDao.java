package com.csu.qxjh.sellor.dao;

import com.csu.qxjh.sellor.pojo.Sellor;
import com.csu.qxjh.util.base.BaseDao;

public interface SellorDao extends BaseDao<Sellor> {
	Sellor selectById(String id);//根据主键获取对应的卖家信息
	
	/**保存卖家信息
	 * @param sellor 卖家实例对象
	 */
	public void insert(Sellor sellor);
	
	public boolean isLoginNameExist(String sellor_login_name);
	
	public Sellor sellorLogin(String sellor_login_name,String sellor_password);
}
