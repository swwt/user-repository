package com.csu.qxjh.sellor.controller.pc;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.csu.qxjh.sellor.pojo.Sellor;
import com.csu.qxjh.sellor.service.SellorService;
import com.csu.qxjh.user.pojo.GoodsOrder;
import com.csu.qxjh.user.pojo.User;
import com.csu.qxjh.user.service.GoodsOrderSerice;
import com.csu.qxjh.util.MD5Util;
import com.csu.qxjh.util.pojo.Message;

/*
 * pc端控制层
 */
@RequestMapping("/pc_sellor")
@Controller
public class SellorController {

	@Resource
	private SellorService sellorService;

	@Resource
	GoodsOrderSerice goodsOrderService;

	@Autowired
	HttpServletRequest request;

	@Autowired
	HttpSession session;

	@RequestMapping("/pageQuerySellors")
	public String pageQueryUsers(@RequestParam(value = "targetPageIndex", defaultValue = "1") int targetPageIndex,
			@RequestParam(value = "key", defaultValue = "") String key) {

		final String basePath = "/pc_sellor/pageQuerySellors";

		Map<String, Object> data = sellorService.fuzzyPageQuery(targetPageIndex, key);
		request.setAttribute("data", data);
		request.setAttribute("basePath", basePath);
		if (request == null) {
			System.out.println("request is null");
		}
		return "/web_page/administrator/seller-manager";
	}

	@ResponseBody
	@RequestMapping("/login")
	public Message sellerLogin(@RequestParam(value = "sellor_login_name") String sellor_login_name,
			@RequestParam(value = "sellor_password") String sellor_password) {
		Message message = new Message();
		message = sellorService.login(sellor_login_name, MD5Util.MD5(sellor_password));
		if (message.getCode() == Message.LOGIN_SUCCESS) {
			session.setAttribute("sellor", message.getResult());
		}
		Sellor sellor = (Sellor) message.getResult();
		sellor.setCollections(null);
		return message;
	}

	@RequestMapping("/logout")
	public String sellorLogout() {
		session.invalidate();
		return "/web_page/seller/signin";
	}

	@RequestMapping("/order_list")
	public String orderList(@RequestParam(value = "targetPageIndex", defaultValue = "1") int targetPageIndex,
			@RequestParam(value = "key", defaultValue = "") String key,
			@RequestParam(value = "payment_status", defaultValue = "-1") int payment_status,
			@RequestParam(value = "deliver_status", defaultValue = "-1") int deliver_status,
			@RequestParam(value = "gain_status", defaultValue = "-1") int gain_status) {
		final String basePath = "/pc_sellor/order_list";

		Map<String, Object> data = goodsOrderService.fuzzyPageQuery(targetPageIndex, key, payment_status,
				deliver_status, gain_status);

		data.put("payment_status", payment_status);
		data.put("deliver_status", deliver_status);
		data.put("gain_status", gain_status);

		request.setAttribute("data", data);
		request.setAttribute("basePath", basePath);

		List<GoodsOrder> goodsOrders = (List<GoodsOrder>) data.get("goodsOrders");
		for (GoodsOrder goodsOrder : goodsOrders) {
			User user = goodsOrder.getUser();
			System.out.println(user.toString());
		}

		return "/web_page/seller/order_list";
	}

	/**
	 * 标记订单为已经发货状态
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/markAsSendOut")
	public Message markAsSendOut(@RequestParam(value="orderId")String orderId) {
		Message message = null;
		message = goodsOrderService.markAsSendOut(orderId);
		return message;
	}

	@ResponseBody
	@RequestMapping("/testYan")
	public GoodsOrder testYan() {
		GoodsOrder goodsOrder = goodsOrderService.getById("297e8373540fee2101540fee2a290000");
		return goodsOrder;
	}

}
