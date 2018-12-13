package com.iss.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.iss.pojo.Order;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:ApplicationContext-dao.xml")
public class OrderMapperTest {
	@Autowired
	private OrderMapper mapper;
	@Test
	public void testSelectByCidKey() {
		List<Order> list = mapper.selectByCidKey(14);
		System.out.println(list.get(0).getOrderGoodsname());
	}

}
