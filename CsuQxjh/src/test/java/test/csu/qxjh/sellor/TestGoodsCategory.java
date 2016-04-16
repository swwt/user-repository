package test.csu.qxjh.sellor;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;

import com.csu.qxjh.goods.dao.GoodsCatagory1Dao;
import com.csu.qxjh.goods.dao.GoodsCatagory2Dao;
import com.csu.qxjh.goods.pojo.GoodsCatagory1;
import com.csu.qxjh.goods.pojo.GoodsCatagory2;
import com.csu.qxjh.util.DateUtil;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:spring-config.xml" })
@Transactional
@TransactionConfiguration(transactionManager = "transactionManager", defaultRollback = false)
public class TestGoodsCategory {
	@Autowired
	GoodsCatagory1Dao goodsCatagory1Dao;
	
	@Autowired
	GoodsCatagory2Dao goodsCatagory2Dao;
	
	@Test
	public void testInsertCatagory1(){
		GoodsCatagory1 goodsCatagory1 = new GoodsCatagory1();
		goodsCatagory1.setGoods_catagory1_name("海鲜");
		goodsCatagory1.setGoods_catagory1_remark("没见过的海鲜");
		goodsCatagory1.setGoods_catagory1_time_last_update(DateUtil.getDate());
		goodsCatagory1Dao.insert(goodsCatagory1);
	}
	
	@Test
	public void testInsertCatagory2() {
		GoodsCatagory1 goodsCatagory1 = goodsCatagory1Dao.selectById(1);
		GoodsCatagory2 goodsCatagory2 = new GoodsCatagory2();
		goodsCatagory2.setGoods_catagory_2_name("浆果类");
		goodsCatagory2.setGoods_catagory_2_remark("有草莓，蓝莓，黑莓，桑葚，覆盆子，葡萄，青提，红提，水晶葡萄，马奶子等等");
		goodsCatagory2.setGoods_catagory_2_time_last_update(DateUtil.getDate());
		goodsCatagory2.setGoods_catagory_2_type(0);
		goodsCatagory2.setGoodsCatagory1(goodsCatagory1);
		goodsCatagory2Dao.insert(goodsCatagory2);
	}
	
}
