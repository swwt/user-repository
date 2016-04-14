package com.csu.qxjh.user.controller.app;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import org.springframework.transaction.annotation.Transactional;
import org.hibernate.engine.transaction.jta.platform.internal.SynchronizationRegistryBasedSynchronizationStrategy;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.serializer.CollectionSerializer;
import com.csu.qxjh.goods.pojo.Goods;
import com.csu.qxjh.goods.service.GoodsService;
import com.csu.qxjh.sellor.pojo.Sellor;
import com.csu.qxjh.user.dao.CollectionDao;
import com.csu.qxjh.user.pojo.Collection;
import com.csu.qxjh.user.pojo.GoodsOrder;
import com.csu.qxjh.user.pojo.ShoppingCart;
import com.csu.qxjh.user.pojo.User;
import com.csu.qxjh.user.service.CollectionService;
import com.csu.qxjh.user.service.GoodsOrderSerice;
import com.csu.qxjh.user.service.ShoppingCartService;
import com.csu.qxjh.user.service.UserService;
import com.csu.qxjh.user.service.impl.GoodsOrderServiceImpl;
import com.csu.qxjh.util.StringUtil;
import com.csu.qxjh.util.pojo.Message;

/*
 * 用户（买家）webapp控制层
 */

@RequestMapping("/user")
@Controller
public class UserControllerApp {
	@Resource
	private UserService userService;
	@Resource
	private CollectionService collectionService;
	@Resource
	private GoodsOrderSerice goodsOrderSerice;
	@Resource
	private ShoppingCartService shoppingCartService;
	/*
	 * 买家登陆(用户名或者手机号都可以登录)
	 */
	@ResponseBody
	@RequestMapping("/login") 	
	public Message login(@RequestParam(value="user_login_name")String user_login_name,
			@RequestParam(value="user_password")String user_password,
			HttpSession session){
		System.out.println("------------登陆----------");
		Message message=new Message();
		boolean isPhone=StringUtil.isDigital(user_login_name);
		User user_1=null;
		User user_2=null;
		if(isPhone){
			user_1=userService.getByPhone(user_login_name);			
			user_2=userService.getByPhonePassword(user_login_name, user_password);	
		}else{
			user_1=userService.getByName(user_login_name);	
			user_2=userService.getByNamePassword(user_login_name, user_password);
		}

		if(user_1!=null){
			if(user_2!=null){
				message.setCode(1);
				message.setMessage("登陆成功");
				user_2.setCollections(null);
				user_2.setGoodsOrders(null);
				user_2.setShoppingCarts(null);
				message.setResult(user_2);
				session.setAttribute("user", user_2);//登陆成功放入session
				
			}else{
				message.setCode(0);
				message.setMessage("登陆失败，密码错误");
			}
		}else{
			message.setCode(0);
			message.setMessage("登陆失败，用户名不存在");
		}	
		return message;
	}
	
	@ResponseBody
	@RequestMapping("/addGoodsOrder")//用户添加订单
	public Message addGoodsOrder(@RequestParam(value="goodsId")Integer goodsId,
			@RequestParam(value="userId")String userId,@RequestParam(value="goodsOrder")GoodsOrder goodsOrder){
		Message message=new Message();
		message.setCode(1);
		message.setMessage("添加成功");
		Goods goods=new Goods();
		User user=new User();
		goodsOrder.setUser(user);
		goodsOrder.setGoods(goods);
		goodsOrderSerice.insert(goodsOrder);
		return message;
	}
	
	@ResponseBody
	@RequestMapping("/deleteGoodsOrder")//用户删除订单
	public Message deleteGoodsOrder(@RequestParam(value="goodsOrderId")String goodsOrderId){
		Message message=new Message();
		message.setCode(1);
		message.setMessage("添加成功");
		goodsOrderSerice.deleteGoodsUserType((goodsOrderSerice.getById(goodsOrderId)));
		return message;
	}
	
	@ResponseBody
	@RequestMapping("/addCollectionDianPu")//用户收藏店铺
	public Message addCollectionDianPu(@RequestParam(value="sellorId")String sellorId){
		Message message=new Message();
		message.setCode(1);
		message.setMessage("收藏店铺成功");
		Collection collection=new Collection();
		Sellor sellor=new Sellor();
		sellor.setId(sellorId);
		collection.setSellor(sellor);
		return message;
	}
		
	@ResponseBody
	@RequestMapping("/addCollectionGoods")//用户收藏商品
	public Message addCollectionGoods(@RequestParam(value="goodsId")Integer goodsId){
		Message message=new Message();
		message.setCode(1);
		message.setMessage("收藏店铺成功");
		Collection collection=new Collection();
		Goods goods=new Goods();
		goods.setId(goodsId);
		collection.setGoods(goods);
		return message;
	}
	
	@ResponseBody
	@RequestMapping("/addShoppingCart")//用户添加购物车
	public Message addShoppingCart(@RequestParam(value="goodsId")Integer goodsId,
			@RequestParam(value="userId")String userId,@RequestParam(value="amount")Integer amount){
		Message message=new Message();
		message.setCode(1);
		message.setMessage("添加购物车成功");
		User user=new User();
		Goods goods=new Goods();
		goods.setId(goodsId);
		user.setId(userId);
		ShoppingCart shoppingCart=new ShoppingCart();
		shoppingCart.setGoods(goods);
		shoppingCart.setUser(user);
		shoppingCartService.addShoppongCart(shoppingCart);
		return message;
	}
	@ResponseBody
	@RequestMapping("/getShoppingCart")//用户获取购物车信息
	public Message getShoppingCart(@RequestParam(value="userId")String userId){
		Message message=new Message();
		message.setCode(1);
		message.setMessage("获取购物车成功");
		List<ShoppingCart> shoppingCarts=shoppingCartService.getShoppingCart(userId);
		message.setResult(shoppingCarts);
		return message;
	}
	
	@ResponseBody
	@RequestMapping("/test")//用户获取购物车信息
	public Message test(){
		Message message=new Message();
		message.setCode(1);
		message.setMessage("获取购物车成功");
		message.setResult(null);
		System.out.println(shoppingCartService.getShoppingCart("402881e853dcd3ae0153dcd3b1680000").get(0).getUser().getId());
		return message;
	}
}



