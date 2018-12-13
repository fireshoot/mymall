package com.iss.vo;

import java.util.List;

import com.iss.pojo.Address;
import com.iss.pojo.Order;

public class adressAndGoods {
	
	private List<Address> address;
	
	private List<Order> order;
	
	

	public adressAndGoods(List<Address> address, List<Order> order) {
		super();
		this.address = address;
		this.order = order;
	}



	public adressAndGoods() {
		super();
	}



	public List<Address> getAddress() {
		return address;
	}



	public void setAddress(List<Address> address) {
		this.address = address;
	}



	public List<Order> getOrder() {
		return order;
	}



	public void setOrder(List<Order> order) {
		this.order = order;
	}

	
	

}
