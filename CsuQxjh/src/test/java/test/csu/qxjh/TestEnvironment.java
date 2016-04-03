package test.csu.qxjh;

import javax.annotation.Resource;


import org.junit.Test;
import org.junit.runner.RunWith;

import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;


import com.csu.qxjh.user.pojo.User;
import com.csu.qxjh.user.service.UserService;


//测试方法
@Transactional
@TransactionConfiguration(transactionManager = "transactionManager", defaultRollback = false)  
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:spring-config.xml"})
public class TestEnvironment {
	@Resource
	private UserService userService;
	
	@Test
	public void test2(){
		System.out.println(userService.getUserById("402881e853db53520153db53556d0000"));
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
