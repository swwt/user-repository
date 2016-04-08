package test.csu.qxjh.admin;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;

import com.csu.qxjh.admin.service.AdminService;
import com.csu.qxjh.util.MD5Util;
import com.csu.qxjh.util.PropertiesUtils;
import com.csu.qxjh.util.pojo.Message;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:spring-config.xml" })
@Transactional
@TransactionConfiguration(transactionManager = "transactionManager", defaultRollback = false)
public class TestAdminService {

	@Autowired
	AdminService adminService;

	@Test
	public void testLogin() {
		Message message = adminService.adminLogin("xxxxxx", "xxxxx");
		System.out.println(message.toString());
	}

	@Test
	public void testPropertiesUtil() {
		System.out.println(PropertiesUtils.get("admin_login_success"));
	}
	
	@Test
	public void testMD5(){
		String password = "xxxxxx";
		String md5Password = MD5Util.MD5(password);
		System.out.println(md5Password);
	}

}
