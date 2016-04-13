package test.csu.qxjh.admin;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;

import com.csu.qxjh.user.dao.UserDao;
import com.csu.qxjh.user.pojo.User;
import com.csu.qxjh.user.service.UserService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:spring-config.xml" })
@Transactional
@TransactionConfiguration(transactionManager = "transactionManager", defaultRollback = false)
public class TestUserService {
	
	@Autowired
	UserDao userDao;
	
	@Autowired
	UserService userService;
	
	@Test
	public void testInsert(){
		for(int i=0; i<20; i++){
			User user = new User();
			user.setUser_login_name("spuer hero"+i);
			user.setUser_password("ssssxxxxss");
			userDao.insert(user);
		}
	}
	
	@Test
	public void testFuzzyPageQuery(){
		Map<String, String> conditions = new HashMap<>();
		conditions.put("user_login_name", "man");
		List<User> users = userDao.pageFuzzyQuery(User.class, conditions, 0, 8, true);
		System.out.println(users.size());
	}
	
	@Test
	public void testFuzzyPageQuery2(){
		Map<String, Object> map = userService.fuzzyPageQuery(2, null);
		List<User> users = (List<User>) map.get("users");
		for(User user:users){
			System.out.println(user.getUser_login_name());
		}
		Map<String, Integer> startAndEnd = (Map<String, Integer>) map.get("startAndEnd");
		System.err.println("start->"+startAndEnd.get("start"));
		System.err.println("end->"+startAndEnd.get("end"));
		System.out.println("pageIndex->"+map.get("pageIndex"));
		System.out.println("pageCounts->"+map.get("pageCounts"));
		System.out.println("key->"+map.get("key"));
	}
}
