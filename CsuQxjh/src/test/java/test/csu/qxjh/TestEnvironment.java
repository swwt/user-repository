package test.csu.qxjh;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;

import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;

import com.csu.qxjh.goods.dao.OfferPromotionFullcutproductsDao;
import com.csu.qxjh.goods.pojo.Goods;
import com.csu.qxjh.goods.pojo.GoodsCatagory1;
import com.csu.qxjh.goods.pojo.GoodsCatagory2;
import com.csu.qxjh.goods.pojo.OfferPromotionFullcutproducts;
import com.csu.qxjh.goods.service.GoodsCatagory1Service;
import com.csu.qxjh.goods.service.GoodsCatagory2Service;
import com.csu.qxjh.goods.service.GoodsService;
import com.csu.qxjh.sellor.dao.SellorDao;
import com.csu.qxjh.sellor.pojo.Sellor;
import com.csu.qxjh.user.dao.CollectionDao;
import com.csu.qxjh.user.dao.GoodsOrderDao;
import com.csu.qxjh.user.pojo.Collection;
import com.csu.qxjh.user.pojo.GoodsOrder;
import com.csu.qxjh.user.pojo.User;
import com.csu.qxjh.user.service.UserService;


//测试方法，以下几个注解都是必须的！
@Transactional
@TransactionConfiguration(transactionManager = "transactionManager", defaultRollback = false)  
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:spring-config.xml"})
public class TestEnvironment {
	@Resource
	private UserService userService;
    @Resource
	private GoodsCatagory1Service goodsCatagory1Service;
    @Resource
	private GoodsCatagory2Service goodsCatagory2Service;
    @Resource
    private SessionFactory sessionFactory;
    @Resource 
    private GoodsService goodsService;
    @Resource
    private OfferPromotionFullcutproductsDao offerPromotionFullcutproductsDao;
    @Resource
    private CollectionDao collectionDao;
    @Resource
    private SellorDao sellorDao;
    @Resource
    private GoodsOrderDao goodsOrderDao;
    @Test
    public void test12(){
//    	GoodsOrder goodsOrder=new GoodsOrder();
//    	goodsOrder.setUser(userService.getUserById("402881e853dcd3ae0153dcd3b1680000"));
//    	goodsOrder.setGoods(goodsService.getById(1));
//    	goodsOrderDao.insert(goodsOrder);
    	for(int i=0;i<3;i++){
    		GoodsOrder goodsOrder=new GoodsOrder();
        	goodsOrder.setUser(userService.getUserById("402881e853dcd3ae0153dcd3b1680000"));
        	goodsOrder.setGoods(goodsService.getById(3));
        	goodsOrderDao.insert(goodsOrder);
    	}
    }
    @Test 
    public void test11(){
    	Collection collection=new Collection();
    	collection.setUser(userService.getUserById("402881e853dcd3ae0153dcd3b1680000"));
//    	Set<Goods> goodsList=new HashSet<>();
//    	goodsList.add(goodsService.getById(1));
//    	goodsList.add(goodsService.getById(2));
//    	collection.setGoodsList(goodsList);
    	Set <Sellor> sellorList=new HashSet<>();
    	sellorList.add(sellorDao.selectById("wefh3298fu3932h98h"));
    	collection.setSellorList(sellorList);
    	collectionDao.insert(collection);
    }
    @Test
    public void test10(){
    	List<Goods> goodsList=goodsService.getByCatagory2Id(10);
    	System.out.println(goodsList.size());
    }
    @Test
    public void test9(){
    	Goods goods =goodsService.getById(1);
    	OfferPromotionFullcutproducts offerPromotionFullcutproducts=new OfferPromotionFullcutproducts();
    	offerPromotionFullcutproducts.setOffer_promotion_fullcutproducts_remark("测试");
    	offerPromotionFullcutproducts.setGoods(goods);
    	offerPromotionFullcutproductsDao.insert(offerPromotionFullcutproducts);
    	//    	Goods goods=new Goods();
//    	GoodsCatagory2 goodsCatagory2=goodsCatagory2Service.getById(10);
//    	goods.setGoodsCatagory2(goodsCatagory2);
//    	goods.setGoods_name("菠菜");
//    	goodsService.addGoods(goods);
    }
    @Test
    public void test8(){
    	User user=(User)sessionFactory.getCurrentSession().createQuery("From User where id=?").setString(0, "402881e853dcd3ae0153dcd3b1680000").uniqueResult();
    	user.setUser_login_name("swwt");
    	System.out.println(user.getUser_login_name());
    }
    @Test
    public void test7(){
    	goodsCatagory2Service.getSpecialCatagory2();
    }
    @Test
    public void test6(){
    	List<GoodsCatagory1> list=goodsCatagory1Service.getAll();
//		for(int i=0;i<list.size();i++){
//			//System.out.println(list.get(i).getGoodsCatagory2List().size());
//			list.get(i).setGoodsCatagory2List(null);
//		}
    }
    
    @Test
    public void test5(){
    	GoodsCatagory2 goodsCatagory2=new GoodsCatagory2();
    	GoodsCatagory1 goodsCatagory1=new GoodsCatagory1();
    	goodsCatagory1.setId(6);
    	goodsCatagory2.setGoods_catagory_2_name("瓜子");
    	goodsCatagory2.setGoodsCatagory1(goodsCatagory1);
    	goodsCatagory2Service.add(goodsCatagory2);
    }
    @Test
    public void test4(){
 //   	GoodsCatagory1 goodsCatagory1=new GoodsCatagory1();
//    	goodsCatagory1.setId(5);
 //   	goodsCatagory1.setGoods_catagory1_name("特色肉类");
//    	goodsCatagory1.setGoods_catagory1_remark("修改");
 //   	goodsCatagory1Service.add(goodsCatagory1);
//    	goodsCatagory1Service.update(goodsCatagory1);
    	
    	GoodsCatagory1 goodsCatagory1=goodsCatagory1Service.getById(5);
    	System.out.println(goodsCatagory1.getGoodsCatagory2List());
//    	System.out.println(goodsCatagory2Service.getAll().size());
    }
	@Test
	public void test3(){
		System.out.println(userService.getByNamePassword("swwt", "123456"));
	}
	@Test
	public void test2(){
		System.out.println(userService.getUserById("402881e853dccb070153dccb0a220000"));
	}
	@Test
	public void test1(){
		User user=new User();
		//user.setId("d1r12dwq12");
		user.setUser_login_name("swwt");
		user.setUser_password("123456");
		userService.insert(user);
	}
}
