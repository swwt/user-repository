package com.csu.qxjh.user.controller.app;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.csu.qxjh.user.pojo.User;
import com.csu.qxjh.user.pojo.UserAddress;
import com.csu.qxjh.user.service.UserAddressService;
import com.csu.qxjh.user.service.UserService;
import com.csu.qxjh.util.MD5Util;
import com.csu.qxjh.util.pojo.Message;

/*
 * 用户个人信息修改控制层
 */
//@Scope("prototype")-->可设置为多例，默认为单例
@RequestMapping("/userInformation")
@Controller
public class UserInformationControllerApp {
	@Resource
	private UserAddressService userAddressService;
	@Resource
	private UserService userService; 
	
	
	@ResponseBody
	@RequestMapping("/updatePassword")
	public Message updatePassword(@RequestParam("userId") String userId,
			@RequestParam(value="oldPassword")String oldPassword,
			@RequestParam(value="newPassword")String newPassword){
		Message message = new Message();
		User user=userService.getUserById(userId);
		String password=user.getUser_password();
		if(password.equals(MD5Util.MD5(oldPassword))){
			message.setCode(1);
			message.setMessage("修改成功");
			user.setUser_password(newPassword);
			userService.update(user);
		}else{
			message.setCode(0);
			message.setMessage("修改失败，原密码错误！");
		}
		return message;
	}
	@ResponseBody
	@RequestMapping("/addUserAddress")
	public Message addUserAddress(UserAddress userAddress,
			@RequestParam("userId") String userId){
		Message message = new Message();
		message.setCode(1);
		message.setMessage("添加成功");
		User user=new User();
		user.setId(userId);
		userAddress.setUser(user);
		int type=0;
		List <UserAddress> userAddresses=userAddressService.getAllAddress(userId);
		if(userAddresses.size()==0){
			userAddress.setUser_address_type(1);
		}else{
			type=userAddress.getUser_address_type();
			if(type==1){
				userAddress.setUser_address_type(0);
			}
		}
		userAddressService.addAddress(userAddress);
		if(type==1){
			userAddressService.setAddressDefault(userAddress);
		}
		return message;
	}
	
	@ResponseBody
	@RequestMapping("/getUserAddress")
	public Message getUserAddress(@RequestParam("userId") String userId){
		Message message = new Message();
		message.setCode(1);
		message.setMessage("获取成功");
		List<UserAddress> userAddresses=userAddressService.getAllAddress(userId);
		message.setResult(userAddresses);
		return message;
	}
	
	@ResponseBody
	@RequestMapping("/updateUserAddress")
	public Message updateUserAddress(UserAddress userAddress,@RequestParam(value="userId") String userId){
		Message message = new Message();
		message.setCode(1);
		message.setMessage("修改成功");
		User user = new User();
		user.setId(userId);
		int type=userAddress.getUser_address_type();
		userAddress.setUser(user);
		userAddress.setUser_address_type(0);
		userAddressService.updateAddress(userAddress);
		if(type==1){
			userAddressService.setAddressDefault(userAddress);
		}		
		return message;
	}
	
	@ResponseBody
	@RequestMapping("/getDefaultAddress")
	public Message getDefaultAddress(@RequestParam("userId") String userId){
		Message message = new Message();
		message.setCode(1);
		message.setMessage("获取成功");
		UserAddress userAddress=userAddressService.getDefaultAddress(userId);
		message.setResult(userAddress);
		return message;
	}
	@ResponseBody
	@RequestMapping("/getNotDefaultAddress")
	public Message getNotDefaultAddress(@RequestParam("userId") String userId){
		Message message = new Message();
		message.setCode(1);
		message.setMessage("获取成功");
		List<UserAddress> userAddresses=userAddressService.getByNotDefaultByUserId(userId);
		message.setResult(userAddresses);
		return message;
	}
}








