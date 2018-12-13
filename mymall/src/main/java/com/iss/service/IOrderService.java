package com.iss.service;

import java.util.List;

import com.iss.pojo.Order;

public interface IOrderService {


	List<Order> getOrderByCid(int cid);
	
	public int add(Order record);


}
