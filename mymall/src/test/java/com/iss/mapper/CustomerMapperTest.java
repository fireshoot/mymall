package com.iss.mapper;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.iss.pojo.Customer;
import com.iss.utils.EncryptUtil;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:ApplicationContext-dao.xml")
public class CustomerMapperTest {

	@Autowired
	private CustomerMapper mapper;
	
	@Test
	public void testSelectByNameAndPassword() {
		Customer customer = new Customer();
		customer.setCname("小美");
		customer.setPassword("123");
		customer.setSalt("f155c61a0a88f8a76db4503b85183f4f");
		EncryptUtil.encryptPassword(customer);
		customer = mapper.selectByNameAndPassword(customer.getCname(), customer.getPassword());
	assertNotNull(customer);
	}

}
