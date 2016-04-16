package test.csu.qxjh;

import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import java.util.Set;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;

import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;

import com.csu.qxjh.goods.dao.GoodsCommentDao;
import com.csu.qxjh.goods.dao.GoodsDao;
import com.csu.qxjh.goods.dao.GoodsDetailDao;
import com.csu.qxjh.goods.dao.OfferPromotionFullcutproductsDao;
import com.csu.qxjh.goods.pojo.Goods;
import com.csu.qxjh.goods.pojo.GoodsCatagory1;
import com.csu.qxjh.goods.pojo.GoodsCatagory2;
import com.csu.qxjh.goods.pojo.GoodsComment;
import com.csu.qxjh.goods.pojo.GoodsDetail;
import com.csu.qxjh.goods.pojo.OfferPromotionFullcutproducts;
import com.csu.qxjh.goods.service.GoodsCatagory1Service;
import com.csu.qxjh.goods.service.GoodsCatagory2Service;
import com.csu.qxjh.goods.service.GoodsService;
import com.csu.qxjh.news.dao.NewsCommentDao;
import com.csu.qxjh.news.dao.NewsDao;
import com.csu.qxjh.news.pojo.News;
import com.csu.qxjh.news.pojo.NewsComment;
import com.csu.qxjh.news.service.NewsCommentService;
import com.csu.qxjh.news.service.NewsService;
import com.csu.qxjh.news.service.impl.NewsServiceImpl;
import com.csu.qxjh.sellor.dao.SellorDao;
import com.csu.qxjh.sellor.pojo.Sellor;
import com.csu.qxjh.user.dao.CollectionDao;
import com.csu.qxjh.user.dao.GoodsOrderDao;
import com.csu.qxjh.user.dao.UserDao;
import com.csu.qxjh.user.pojo.Collection;
import com.csu.qxjh.user.pojo.GoodsOrder;
import com.csu.qxjh.user.pojo.ShoppingCart;
import com.csu.qxjh.user.pojo.User;
import com.csu.qxjh.user.service.GoodsOrderSerice;
import com.csu.qxjh.user.service.ShoppingCartService;
import com.csu.qxjh.user.service.UserService;
import com.csu.qxjh.util.DateUtil;
import com.csu.qxjh.util.MD5Util;


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
    @Resource 
    private GoodsDetailDao goodsDetailDao;
    @Resource
    private GoodsDao goodsDao;
    @Resource
    private GoodsCommentDao goodsCommentDao;
    @Resource
    private NewsDao newsDao;
    @Resource
    private NewsService newsService;
    @Resource
    private NewsCommentService newsCommentService;
    @Resource
    private ShoppingCartService shoppingCartService; 
    @Resource
    private GoodsOrderSerice goodsOrderSerice;
    @Test
    public void test31(){
    	shoppingCartService.getShoppingCart("402881e853dcd3ae0153dcd3b1680000");
    }
    @Test
    public void test30(){
    	Goods goods=goodsService.getById(1);
    	
    }
    @Test
    public void test29(){
    	Goods goods=goodsService.getById(1);
    	System.out.println(goods.getGoodsPrices());
    }
    @Test
    public void test28(){
    	GoodsOrder goodsOrder = goodsOrderSerice.getById("402881e853fad5e50153fad5e9e50000");
    	System.out.println(goodsOrder);
    }
    @Test
    public void test27(){
    	shoppingCartService.getShoppingCart("402881e853dcd3ae0153dcd3b1680000");
    }
    @Test
    public void test26(){
    	ShoppingCart shoppingCart=new ShoppingCart();
    	shoppingCart.setUser(userService.getUserById("402881e853dcd3ae0153dcd3b1680000"));
    	shoppingCart.setGoods(goodsService.getById(1));
    	shoppingCartService.addShoppongCart(shoppingCart);
    }
    @Test
    public void test25(){
    	NewsComment newsComment=new NewsComment();
    	newsComment.setNews_comment_content("测试");
    	News news=new News();
    	news.setId(1);
    	newsComment.setNews(news);
    	newsCommentService.insert(newsComment);
    }
    @Test
    public void test24(){
//    	List<Goods> goodsList=goodsService.getByNameOrderBySellors("白菜");
    	List<Goods> goodsList=goodsService.getByNameOrderByPriceUp("白菜");
    	for(int i=0;i<goodsList.size();i++){
//    		System.out.println(goodsList.get(i).getGoods_name()+":"+goodsList.get(i).getGoodsSells());
    		System.out.println(goodsList.get(i).getGoods_name()+":"+goodsList.get(i).getGoodsDetail().getGoods_detail_now_price());
//    		System.out.println(goodsList.get(i).getGoods_name()+":"+goodsList.get(i).getGoodsSells());
    	}
    }
    @Test
    public void test23(){
    	newsService.selectById(1);
    }
//    @Test
//    public void test22(){
//    	NewsComment newsComment=new NewsComment();
//    	newsComment.setNews_comment_time("2016-04-10 12:12:12");
//    	newsComment.setNews_comment_content("这是真实的故事2");
//    	newsComment.setUser(userService.getUserById("402881e853dcd3ae0153dcd3b1680000"));
//    	newsComment.setNews(newsDao.selectById(2));
//    	newsCommentDao.insert(newsComment);
//    }
    @Test
    public void test21(){
    	goodsDao.selectByGoodsCatagory2(10);
    }
    @Test
    public void test20(){
    	News news=newsDao.selectById(1);
    	System.out.println(news);
    }
    @Test
    public void test19(){
    	Set<GoodsComment> goodsComments=goodsService.getById(1).getGoodsComments();
    	Iterator<GoodsComment> iterator1=goodsComments.iterator();
		while(iterator1.hasNext()){
			System.out.println(iterator1.next().getGoods_comment_time());
		}
    }
    @Test
    public void test18(){
    	for(int id=1;id<62;id++){
    		try {
				Thread.sleep(1000);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
    		GoodsComment goodsComment=goodsCommentDao.selectById(id);
    		goodsComment.setGoods_comment_time(DateUtil.getDate());
    		//goodsCommentDao.update(goodsComment);
    	}
    	
    }
    @Test
    public void test17(){    	
    	Goods goods=goodsService.getById(2);
    	Set<GoodsComment> goodsComments=goods.getGoodsComments();
		Iterator<GoodsComment> iterator=goodsComments.iterator();
		while(iterator.hasNext()){
			//System.out.println(iterator.next().getUser().getCollections());
			iterator.next().getUser().setGoodsOrders(null);
			
			//iterator.next().getUser().setCollections(null);
		}
    	//System.out.println(goo);
    }
    @Test
    public void test16(){
    	List<Goods> goodsList=goodsService.getByCatagory2ZongHe(10);
    	goodsList=goodsService.getByCatagory2PriceDown(10);
    	for(int i=0;i<goodsList.size();i++){
    		System.out.println(goodsList.get(i).getId()+":"+goodsList.get(i).getGoods_grade());
    	}
    	
    }
    @Test
    public void test15(){
    	for(int i=0;i<30;i++){
    		GoodsComment goodsComment=new GoodsComment();
        	Random rand1 = new Random();
        	int randNum1 = rand1.nextInt(5);
        	goodsComment.setGoods_comment_grade(randNum1);
        	goodsComment.setGoods(goodsService.getById((randNum1+1)%5));
        	goodsCommentDao.insert(goodsComment);
    	}
    	
    }
    @Test
    public void test14(){
    	List <Goods> goodsList = goodsDao.selectByGoodsCatagory2BySells(10);
    	for( int i = 0; i < goodsList.size(); i++ ){
    		System.out.println(goodsList.get(i).getGoodsOrders().size());
    	}
    	
    }
    @Test
    public void test13(){
    	GoodsDetail goodsDetail=new GoodsDetail();
    	goodsDetail.setGoods(goodsService.getById(5));
    	goodsDetail.setGoods_detail_now_price(400.5555);
    	goodsDetailDao.insert(goodsDetail);
    }
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
//    	Set <Sellor> sellorList=new HashSet<>();
//    	sellorList.add(sellorDao.selectById("wefh3298fu3932h98h"));
//    	collection.setSellorList(sellorList);
//    	collectionDao.insert(collection);
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
//		User user=new User();
//		//user.setId("d1r12dwq12");
//		user.setUser_login_name("swwt");
//		user.setUser_password("123456");
//		userService.insert(user);
		User user=userService.getByNamePassword("swwt","123456");
		//System.out.println(user.getGoodsComments());
	}
}
