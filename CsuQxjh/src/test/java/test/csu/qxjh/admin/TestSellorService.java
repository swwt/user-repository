package test.csu.qxjh.admin;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.eclipse.jdt.internal.compiler.batch.Main;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;

import com.csu.qxjh.sellor.dao.SellorDao;
import com.csu.qxjh.sellor.pojo.Sellor;
import com.csu.qxjh.sellor.service.SellorService;
import com.csu.qxjh.user.dao.GoodsOrderDao;
import com.csu.qxjh.user.pojo.GoodsOrder;
import com.csu.qxjh.user.pojo.User;
import com.csu.qxjh.user.service.GoodsOrderSerice;
import com.csu.qxjh.user.service.UserService;
import com.csu.qxjh.util.DateUtil;
import com.csu.qxjh.util.MD5Util;
import com.fasterxml.jackson.annotation.JsonTypeInfo.Id;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:spring-config.xml" })
@Transactional
@TransactionConfiguration(transactionManager = "transactionManager", defaultRollback = false)
public class TestSellorService {

	@Autowired
	SellorDao sellorDao;

	@Autowired
	SellorService sellorService;

	@Autowired
	GoodsOrderSerice goodsOrderService;

	@Autowired
	UserService userService;
	
	@Autowired
	GoodsOrderDao goodsOrderDao;

	@Test
	public void testInsert() {

		Sellor sellor = new Sellor();

		sellor.setSellor_name("钢铁侠");
		sellor.setSellor_real_name("Helawdafalo man");
		sellor.setSellor_nickname("susdafaw hero");
		sellor.setSellor_login_name("adasd");
		sellor.setSellor_password(MD5Util.MD5("xxxxxx"));
		sellor.setSellor_sex(0);

		sellorDao.insert(sellor);
		System.out.println(sellor.getId());

		/*
		 * for (int i = 1; i < +20; i++) { Sellor sellor = new Sellor();
		 * sellor.setSellor_name("卖家name" + i); sellor.setSellor_login_name(
		 * "卖家login name" + i); sellor.setSellor_nickname("卖家nick name" + i);
		 * sellor.setSellor_real_name("卖家real name" + i);
		 * sellorDao.insert(sellor); }
		 */
	}

	@Test
	public void testGet() {
		Sellor sellor = sellorDao.selectById("297e8373540e65fe01540e6607420000");
		System.out.println(sellor.getSellor_login_name());
	}

	@Test
	public void testFuzzyPageQuery() {
		Map<String, Object> map = sellorService.fuzzyPageQuery(3, null);
		List<Sellor> sellors = (List<Sellor>) map.get("sellors");
		for (Sellor sellor : sellors) {
			System.out.println(sellor.getSellor_login_name());
		}
		Map<String, Integer> startAndEnd = (Map<String, Integer>) map.get("startAndEnd");
		System.err.println("start->" + startAndEnd.get("start"));
		System.err.println("end->" + startAndEnd.get("end"));
		System.out.println("pageIndex->" + map.get("pageIndex"));
		System.out.println("pageCounts->" + map.get("pageCounts"));
		System.out.println("key->" + map.get("key"));
	}

	@Test
	public void testInsertGoodsOrder() {

		Map<String, Object> data = userService.fuzzyPageQuery(1, null);
		
		List<User> users = (List<User>) data.get("users");
		
//		for(int i=0;i<5;i++){
			GoodsOrder goodsOrder = new GoodsOrder();
			goodsOrder.setUser(users.get((int) (Math.random() * 8)));
			goodsOrder.setSellor(sellorDao.selectById("297e83735417970d0154179714260000"));
			goodsOrder.setGoods_order_create_time(DateUtil.getDate());
			
			int payment_status = (int)(Math.random()*2);
			
			int deliver_status = -1;
			if(payment_status == 1)deliver_status = (int)(Math.random()*2);
			
			int gain_status = -1;
			if(deliver_status == 1)gain_status = (int)(Math.random()*2);
			
			goodsOrder.setGoods_order_payment_status(payment_status);
			goodsOrder.setGoods_order_deliver_status(deliver_status);
			goodsOrder.setGoods_order_gain_status(gain_status);

			goodsOrder.setGoods_order_amount((int) (Math.random() * 10));

			goodsOrderService.insert(goodsOrder);
//		}
		
		
	}

	@Test
	public void testQueryGoodsorderByStatus() {
		Map<String, Object> data = goodsOrderService.fuzzyPageQuery(1, null, -1, -1, -1,"297e837354178e330154178e3ba30000");
		List<GoodsOrder> goodsOrders = (List<GoodsOrder>) data.get("goodsOrders");
		for (GoodsOrder goodsOrder : goodsOrders) {
			System.out.println(goodsOrder.getSellor().getId());
			System.out.println(goodsOrder.getGoods_order_create_time());
//			System.out.println(goodsOrder.getGoods_order_deliver_status());
//			System.out.println(goodsOrder.getGoods_order_gain_status());
			System.out.println("--------");
		}
	}
	
	@Test
	public void testOrderConditions() {
		String[] orderConditions = {"goods_order_create_time"};
		Map<String, String> conditions = new HashMap<>();
		conditions.put("sellor_id", "297e837354178e330154178e3ba30000");
		List<GoodsOrder> goodsOrders = goodsOrderDao.pageQuery(GoodsOrder.class, conditions, 1, 8, orderConditions, true);
		for (GoodsOrder goodsOrder : goodsOrders) {
			System.out.println(goodsOrder.getSellor().getId());
			System.out.println(goodsOrder.getGoods_order_create_time());
			System.out.println("--------");
		}
	}
	
}
