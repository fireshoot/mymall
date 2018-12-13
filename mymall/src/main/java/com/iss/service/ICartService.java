package com.iss.service;

import java.util.List;

import com.iss.pojo.Address;
import com.iss.pojo.Cart;
import com.iss.vo.CidAndBid;
import com.iss.vo.adressAndGoods;


public interface ICartService {

	public List<Cart> findCartByCid(int cid);
	
	public boolean updateCart(Cart record);
	
	public Cart findCartById(int id);
	
	public boolean deleteById(int id);
	
	//////////////////////////////////////////////////////////////////
	///////////////////////////分割线/////////////////////////////////
	/////////////////////////////////////////////////////////////////
	
	public boolean addToCart(Cart cart);
	
	public boolean isExByCidAndBid(CidAndBid c);
	
	public adressAndGoods findAddressByCid(int Cid);
	
	public boolean insertAddress(Address address);
	
}
