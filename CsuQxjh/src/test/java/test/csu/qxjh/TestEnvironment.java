package test.csu.qxjh;

import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;


import com.csu.qxjh.test.pojo.Book;

@Transactional
@TransactionConfiguration(transactionManager = "transactionManager", defaultRollback = false)  
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:spring-config.xml"})
public class TestEnvironment {

	@Resource
	private SessionFactory sessionFactory;
	
	@Test
	public void test1(){
		Book book=new Book();
		book.setBook_name("aa");
//		bookDao.save(book);
		sessionFactory.getCurrentSession().save(book);
//		sessionFactory.getCurrentSession().flush();
//		System.out.println(sessionFactory.getCurrentSession().get(Book.class, 1));
//		System.out.println(sessionFactory.getCurrentSession());
	}
}
