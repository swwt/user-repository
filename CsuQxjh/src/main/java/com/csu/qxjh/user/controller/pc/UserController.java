package com.csu.qxjh.user.controller.pc;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.csu.qxjh.user.service.UserService;

/*
 * pc端控制层
 */
@RequestMapping("/pc_user")
@Controller
public class UserController {
	@Resource
	private UserService userService;
	
	@Autowired
	HttpServletRequest request;

	@RequestMapping("/pageQueryUsers")
	public String pageQueryUsers(@RequestParam(value = "targetPageIndex",defaultValue="1") int targetPageIndex,
			@RequestParam(value = "key",defaultValue="") String key) {

		final String basePath = "/pc_user/pageQueryUsers";
		
		Map<String, Object> data = userService.fuzzyPageQuery(targetPageIndex, key);
		request.setAttribute("data", data);
		request.setAttribute("basePath", basePath);
		if (request == null) {
			System.out.println("request is null");
		}
		return "/web_page/administrator/user-manager";
	}
}
