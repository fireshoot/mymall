package com.iss.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.iss.mapper.OrderMapper;
import com.iss.pojo.Order;
import com.iss.service.IOrderService;

@Service
public class OrderServiceImpl implements IOrderService {
	
	@Autowired
	private OrderMapper orderMapper;
	
	public List<Order> getOrderByCid(int cid){
		
		return (List<Order>) orderMapper.selectByCidKey(cid);
	}
	
	@Override
	public int add(Order record) {
		// TODO Auto-generated method stub
		int row=orderMapper.insertSelective(record);	
		return row;
	}
	
}
