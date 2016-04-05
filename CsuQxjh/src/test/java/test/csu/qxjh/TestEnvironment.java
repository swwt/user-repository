package test.csu.qxjh;

import javax.annotation.Resource;


import org.junit.Test;
import org.junit.runner.RunWith;

import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;

import com.csu.qxjh.goods.pojo.GoodsCatagory1;
import com.csu.qxjh.goods.pojo.GoodsCatagory2;
import com.csu.qxjh.goods.service.GoodsCatagory1Service;
import com.csu.qxjh.goods.service.GoodsCatagory2Service;
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
    @Test
    public void test5(){
    	GoodsCatagory2 goodsCatagory2=new GoodsCatagory2();
    	GoodsCatagory1 goodsCatagory1=new GoodsCatagory1();
    	goodsCatagory1.setId(6);
    	goodsCatagory2.setGoods_catagory_2_name("杏仁");
    	goodsCatagory2.setGoodsCatagory1(goodsCatagory1);
    	goodsCatagory2Service.add(goodsCatagory2);
    }
    @Test
    public void test4(){
    	GoodsCatagory1 goodsCatagory1=new GoodsCatagory1();
    	goodsCatagory1.setId(5);
    	goodsCatagory1.setGoods_catagory1_name("蔬菜");
    	goodsCatagory1.setGoods_catagory1_remark("修改");
    	goodsCatagory1Service.add(goodsCatagory1);
//    	goodsCatagory1Service.update(goodsCatagory1);
//    	System.out.println(goodsCatagory1Service.getById(6).getGoodsCatagory2List());
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
