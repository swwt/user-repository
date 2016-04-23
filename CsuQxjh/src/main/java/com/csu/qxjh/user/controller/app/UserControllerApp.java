package com.csu.qxjh.user.controller.app;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;
import javax.imageio.spi.RegisterableService;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.swing.plaf.synth.SynthStyle;

import org.springframework.transaction.annotation.Transactional;
import org.hibernate.Hibernate;
import org.hibernate.engine.transaction.jta.platform.internal.SynchronizationRegistryBasedSynchronizationStrategy;
import org.hibernate.sql.Select;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.serializer.CollectionSerializer;
import com.csu.qxjh.goods.pojo.Goods;
import com.csu.qxjh.goods.pojo.GoodsComment;
import com.csu.qxjh.goods.pojo.GoodsCommentImage;
import com.csu.qxjh.goods.service.GoodsCommentImageService;
import com.csu.qxjh.goods.service.GoodsCommentService;
import com.csu.qxjh.goods.service.GoodsService;
import com.csu.qxjh.sellor.pojo.Sellor;
import com.csu.qxjh.user.pojo.Collection;
import com.csu.qxjh.user.pojo.GoodsOrder;
import com.csu.qxjh.user.pojo.ShoppingCart;
import com.csu.qxjh.user.pojo.User;
import com.csu.qxjh.user.service.CollectionService;
import com.csu.qxjh.user.service.GoodsOrderSerice;
import com.csu.qxjh.user.service.ShoppingCartService;
import com.csu.qxjh.user.service.UserService;
import com.csu.qxjh.util.StringUtil;
import com.csu.qxjh.util.UniqueStringGenerator;
import com.csu.qxjh.util.pojo.CartAmount;
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
	@Resource
	private GoodsService goodsService;
	@Resource
	private GoodsCommentService goodsCommentService;
	@Resource
	private GoodsCommentImageService goodsCommentImageService;
	/*
	 *注册页面 
	 */
	@ResponseBody
	@RequestMapping("/register")
	public Message register(User user){
		Message message=new Message();
		User userOld=userService.getByPhone(user.getUser_phone());
		if(userOld!=null){
			message.setCode(0);
			message.setMessage("手机号已被注册");
			return message;
		}
		message.setMessage("注册成功");
		message.setCode(1);		
		userService.insert(user);
		return message;
	}
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
				user_2.setUserAddresses(null);
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
	/**
	 * 
	 * @param goodsId 商品id
	 * @param userId 用户id
	 * @param goods_order_price 此次下单对应的价格
	 * @param goods_order_price_description 此次下单的价格对应的描述
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/addGoodsOrder")//用户添加订单（适用于立即购买）
	public Message addGoodsOrder(@RequestParam(value="goodsId")Integer goodsId,
			@RequestParam(value="userId")String userId,
			@RequestParam(value="goods_order_price")String goods_order_price,
			@RequestParam(value="goods_order_price_description")String goods_order_price_description){
		Message message=new Message();
		message.setCode(1);
		message.setMessage("添加成功");
		Goods goods=new Goods();
		User user=new User();
		Sellor sellor=new Sellor();
		goods.setId(goodsId);
		user.setId(userId);
		GoodsOrder goodsOrder=new GoodsOrder();
		String sellorId=goodsService.getSellorIdByGoodsId(goodsId);
		sellor.setId(sellorId);
		goodsOrder.setSellor(sellor);
		goodsOrder.setGoods(goods);
		goodsOrder.setUser(user);
		goodsOrder.setGoods_order_price(Double.parseDouble(goods_order_price));
		goodsOrder.setGoods_order_price_description(goods_order_price_description);
		goodsOrder.setGoods_order_amount(1);
		goodsOrderSerice.insert(goodsOrder);
		String orderId=goodsOrder.getId();
		Map<String,String> map=new HashMap();
		map.put("goodsId", orderId);
		List<Map<String,String>> resultList=new ArrayList<Map<String,String>>();
		resultList.add(map);
		message.setResult(resultList);
		return message;
	}
	
	@ResponseBody
	@RequestMapping("/addGoodsOrderAndDeleteCart")//用户添加订单,并删除购物车
	public Message addGoodsOrderAndDeleteCart(@RequestParam(value="cartData")String cartData,
			@RequestParam(value="userId")String userId){
		//System.out.println(cartData);
		List<CartAmount> list=(List<CartAmount>)JSON.parseArray(cartData,CartAmount.class);
		List<Map<String,String>> resultList=new ArrayList<Map<String,String>>();
		User user=new User();
		user.setId(userId);
		for(int i=0;i<list.size();i++){
			CartAmount cartAmount=list.get(i);
			GoodsOrder goodsOrder=new GoodsOrder();
			Goods goods=new Goods();
			ShoppingCart shoppingCart=shoppingCartService.getById(cartAmount.getCart_id());
			//System.out.println("----------------------------"+shoppingCart.getShopping_cart_price_description());
			goods.setId(shoppingCart.getGoods().getId());
			goodsOrder.setGoods(goods);
			goodsOrder.setGoods_order_amount(cartAmount.getAmount());
			goodsOrder.setGoods_order_price(shoppingCart.getShopping_cart_price());
			goodsOrder.setGoods_order_price_description(shoppingCart.getShopping_cart_price_description());
			goodsOrder.setUser(user);
			goodsOrderSerice.insert(goodsOrder);
			List<ShoppingCart> shoppingCarts=new ArrayList<ShoppingCart>();
			shoppingCarts.add(shoppingCart);
			shoppingCartService.deleteShoppingCarts(shoppingCarts);
			Map map=new HashMap();
			map.put("goodsId", goodsOrder.getId());
			resultList.add(map);
		}
		Message message=new Message();
		message.setCode(1);
		message.setMessage("订单提交成功");
		message.setResult(resultList);
		return message;
	}
	
	@ResponseBody
	@RequestMapping("/deleteGoodsOrder")//用户删除订单
	public Message deleteGoodsOrder(@RequestParam(value="goodsOrderId")String goodsOrderId){
		Message message=new Message();
		message.setCode(1);
		message.setMessage("删除成功");
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
			@RequestParam(value="userId")String userId,@RequestParam(value="price")String price,
			@RequestParam(value="priceDescription")String priceDescription){
		System.out.println(priceDescription);
		Message message=new Message();
		message.setCode(1);
		message.setMessage("添加购物车成功");
		User user=new User();
		Goods goods=new Goods();
		goods.setId(goodsId);
		user.setId(userId);
		List<ShoppingCart> shoppingCartList=shoppingCartService.getShoppingCartByGoodsPrice(userId,goodsId, Double.parseDouble(price));
		if(shoppingCartList.size()==0){
			ShoppingCart shoppingCart=new ShoppingCart();
			shoppingCart.setGoods(goods);
			shoppingCart.setUser(user);
			shoppingCart.setShopping_cart_price_description(priceDescription);
			shoppingCart.setShopping_cart_price(Double.parseDouble(price));
			shoppingCartService.addShoppongCart(shoppingCart);
		}else{
			message.setCode(0);
			message.setMessage("该商品已在您的购物车当中");	
		}		
		return message;
	}
	@ResponseBody
	@RequestMapping("/getShoppingCart")//用户获取购物车信息
	public Message getShoppingCart(@RequestParam(value="userId")String userId){
		Message message=new Message();
		message.setCode(1);
		message.setMessage("获取购物车成功");
		List<ShoppingCart> shoppingCarts=shoppingCartService.getShoppingCart(userId);
		for(int i=0;i<shoppingCarts.size();i++){	
			ShoppingCart shoppingCart=shoppingCarts.get(i);
			Goods goods=shoppingCart.getGoods();
			Goods goods1=new Goods();
//			try {
//				goods1 = (Goods)goods.clone();
//			} catch (CloneNotSupportedException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
			goods1.setId(goods.getId());
			goods1.setGoods_name(goods.getGoods_name());
			goods1.setImages(goods.getImages());
			shoppingCart.setGoods(goods1);
		}
		
		message.setResult(shoppingCarts);
		return message;
	}
	
	@ResponseBody
	@RequestMapping("/getGoodsOrders")//用户获取订单信息
	public Message getGoodsOrders(@RequestParam(value="goodsIdStr")String goodsIdStr){
		System.out.println(goodsIdStr);
		List<GoodsOrder> goodsOrderList=new ArrayList<>();
		String[] goodsIds=goodsIdStr.split(" ");
		for(int i=0;i<goodsIds.length;i++){
			String goodsId=goodsIds[i];
			GoodsOrder goodsOrder=goodsOrderSerice.getById(goodsId);
			goodsOrder.setUser(null);
			Goods goods=new Goods();
			Goods goodsOld=goodsOrder.getGoods();
			goods.setGoods_name(goodsOld.getGoods_name());
			goods.setImages(goodsOld.getImages());
			goodsOrder.setGoodsClone(goods);	
			goodsOrder.setGoods(null);
			goodsOrderList.add(goodsOrder);
		}
		Message message=new Message();
		message.setCode(1);
		message.setMessage("获取订单成功");
		message.setResult(goodsOrderList);
		return message;
	}
	
	@ResponseBody
	@RequestMapping("/getNoPayGoodsOrder")//用户获取待付款订单
	public Message getNoPayGoodsOrder(@RequestParam(value="userId")String userId){
		List<GoodsOrder> goodsOrders=goodsOrderSerice.getOrderByNoPay(userId);
		for(int i=0;i<goodsOrders.size();i++){
			GoodsOrder goodsOrder=goodsOrders.get(i);
			goodsOrder.setUser(null);
			Goods goods=new Goods();
			Goods goodsOld=goodsOrder.getGoods();
			goods.setGoods_name(goodsOld.getGoods_name());
			goods.setImages(goodsOld.getImages());
			goodsOrder.setGoodsClone(goods);	
			goodsOrder.setGoods(null);
		}
		Message message=new Message();
		message.setCode(1);
		message.setMessage("获取代付款订单成功");
		message.setResult(goodsOrders);
		return message;
	}
	
	@ResponseBody
	@RequestMapping("/getNoGetGoodsOrder")//用户获取待收货订单
	public Message getNoGetGoodsOrder(@RequestParam(value="userId")String userId){
		List<GoodsOrder> goodsOrders=goodsOrderSerice.getOrderByNoGet(userId);
		for(int i=0;i<goodsOrders.size();i++){
			GoodsOrder goodsOrder=goodsOrders.get(i);
			goodsOrder.setUser(null);
			Goods goods=new Goods();
			Goods goodsOld=goodsOrder.getGoods();
			goods.setGoods_name(goodsOld.getGoods_name());
			goods.setImages(goodsOld.getImages());
			goodsOrder.setGoodsClone(goods);	
			goodsOrder.setGoods(null);
		}
		Message message=new Message();
		message.setCode(1);
		message.setMessage("获取未收货订单成功");
		message.setResult(goodsOrders);
		return message;
	}
	
	@ResponseBody
	@RequestMapping("/getNoCommentGoodsOrder")//用户获取待评价订单
	public Message getNoCommentGoodsOrder(@RequestParam(value="userId")String userId){
		List<GoodsOrder> goodsOrders=goodsOrderSerice.getOrderByNoComment(userId);		
		for(int i=0;i<goodsOrders.size();i++){
			GoodsOrder goodsOrder=goodsOrders.get(i);
			goodsOrder.setUser(null);
			Goods goods=new Goods();
			Goods goodsOld=goodsOrder.getGoods();
			goods.setId(goodsOld.getId());
			goods.setGoods_name(goodsOld.getGoods_name());
			goods.setImages(goodsOld.getImages());
			goodsOrder.setGoodsClone(goods);	
			goodsOrder.setGoods(null);
		}
		Message message=new Message();
		message.setCode(1);
		message.setMessage("获取未收货订单成功");
		message.setResult(goodsOrders);
		return message;
	}
	
	
	@ResponseBody
	@RequestMapping("/getCompleteGoodsOrder")//用户获取已完成订单
	public Message getCompleteGoodsOrder(@RequestParam(value="userId")String userId){
		List<GoodsOrder> goodsOrders=goodsOrderSerice.getOrderByComplete(userId);		
		for(int i=0;i<goodsOrders.size();i++){
			GoodsOrder goodsOrder=goodsOrders.get(i);
			goodsOrder.setUser(null);
			Goods goods=new Goods();
			Goods goodsOld=goodsOrder.getGoods();
			goods.setGoods_name(goodsOld.getGoods_name());
			goods.setImages(goodsOld.getImages());
			goods.setId(goodsOld.getId());
			goodsOrder.setGoodsClone(goods);	
			goodsOrder.setGoods(null);
		}
		Message message=new Message();
		message.setCode(1);
		message.setMessage("获取已完成订单成功");
		message.setResult(goodsOrders);
		return message;
	}
	
	@ResponseBody
	@RequestMapping("/addOrderComment")//用户对订单作出评价(有图片的)
	public Message addOrderComment(@RequestParam(value="userId")String userId,
			@RequestParam(value="goodsId")Integer goodsId,
			@RequestParam(value="files")MultipartFile[] files,
			@RequestParam(value="orderId")String orderId,
			GoodsComment goodsComment,
			HttpSession session){
		
		try {
			InputStream is=files[0].getInputStream();
			String originalName=files[0].getOriginalFilename();			
			String[] names=originalName.split("\\.");	
			String fileName=UniqueStringGenerator.getUniqueString()+"."+names[names.length-1];//上传的文件名
			String imageSrc="/resource_goods_comment_image/"+fileName;///resource_goods_comment_image/z1461224584465.IMG_20150101_204234.jpg
			FileOutputStream fos=
					new FileOutputStream(session.getServletContext().getRealPath(imageSrc));
			byte[] buffer=new byte[1024];
			int len=0;
			while((len=is.read(buffer))>0){
				fos.write(buffer, 0, len);
			}
			fos.close();
			is.close();
			User user=new User();
			user.setId(userId);
			Goods goods=new Goods();
			goods.setId(goodsId);		
			goodsComment.setGoods(goods);
			goodsComment.setUser(user);
			goodsCommentService.addComment(goodsComment);//添加评论
			GoodsCommentImage goodsCommentImage=new GoodsCommentImage();
			goodsCommentImage.setGoods_comment_image_src(imageSrc);
			goodsCommentImage.setGoodsComment(goodsComment);//上面添加完评论后，该条评论对应的主键也就有值了
			goodsCommentImageService.addCommentImage(goodsCommentImage);
			
			GoodsOrder goodsOrder=goodsOrderSerice.getById(orderId);
			goodsOrder.setGoods_order_evaluate_status(1);//评价后设当前订单为已评价
			goodsOrderSerice.updateOrder(goodsOrder);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		Message message=new Message();
		message.setCode(1);
		message.setMessage("添加评论成功");		
		return message;
	}

	@ResponseBody
	@RequestMapping("/addOrderCommentWithOutImage")//用户对订单作出评价(无图片的)
	public Message addOrderCommentWithOutImage(@RequestParam(value="userId")String userId,
			@RequestParam(value="goodsId")Integer goodsId,
			@RequestParam(value="orderId")String orderId,
			GoodsComment goodsComment,
			HttpSession session){
		User user=new User();
		user.setId(userId);
		Goods goods=new Goods();
		goods.setId(goodsId);		
		goodsComment.setGoods(goods);
		goodsComment.setUser(user);
		goodsCommentService.addComment(goodsComment);
		
		GoodsOrder goodsOrder=goodsOrderSerice.getById(orderId);
		goodsOrder.setGoods_order_evaluate_status(1);//评价后设当前订单为已评价
		goodsOrderSerice.updateOrder(goodsOrder);
		Message message=new Message();
		message.setCode(1);
		message.setMessage("添加评论成功");		
		return message;
	}
}
















