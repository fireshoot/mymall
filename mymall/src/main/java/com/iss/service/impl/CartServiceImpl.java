package com.iss.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iss.mapper.AddressMapper;
import com.iss.mapper.CartMapper;
import com.iss.mapper.OrderMapper;
import com.iss.pojo.Address;
import com.iss.pojo.Cart;
import com.iss.pojo.Order;
import com.iss.service.ICartService;
import com.iss.vo.CidAndBid;
import com.iss.vo.adressAndGoods;

@Service
public class CartServiceImpl implements ICartService {

	
	@Autowired
	private CartMapper cartMapper;
	
	@Autowired
	private AddressMapper addressMapper;
	
	@Autowired
	private OrderMapper orderMapper;
	
	@Override
	public List<Cart> findCartByCid(int cid) {
		// TODO Auto-generated method stub
		
		List<Cart> cartItems=cartMapper.selectByCid(cid);
		
		return cartItems;
	}

	@Override
	public boolean updateCart(Cart record) {
		
		int row=cartMapper.updateByPrimaryKey(record);
		if(row==1)
			return true;
		else
			return false;
	}

	@Override
	public Cart findCartById(int id) {
		// TODO Auto-generated method stub
		Cart cart=cartMapper.selectByPrimaryKey(id);
		return cart;
	}

	@Override
	public boolean deleteById(int id) {
		// TODO Auto-generated method stub
		
		int row=cartMapper.deleteByPrimaryKey(id);
		System.out.println("row:"+row);
		if(row>0)
			return true;
		else
			return false;
	}
	
	//////////////////////////////////////////////////////////////////
	///////////////////////////分割线/////////////////////////////////
	/////////////////////////////////////////////////////////////////

	@Override
	public boolean addToCart(Cart cart) {
		int cnt=cartMapper.insert(cart);
		if(cnt!=0)
			return true;
		return false;
	}

	
	@Override
	public boolean isExByCidAndBid(CidAndBid c) {
		Cart cart=cartMapper.selectByCidAndBid(c);
		if(cart!=null) {
			return true;
		}
		return false;
	}

	@Override
	public adressAndGoods findAddressByCid(int Cid) {
		List<Address> addresses=addressMapper.selectByCid(Cid);
		
		List<Order> orders=orderMapper.selectByCidKey(Cid);
		
		adressAndGoods adressAndGoods=new adressAndGoods();
		adressAndGoods.setAddress(addresses);
		adressAndGoods.setOrder(orders);
		
		return adressAndGoods;
		
		
	}

	@Override
	public boolean insertAddress(Address address) {
		int cnt=addressMapper.insert(address);
		if(cnt!=0) {
			return true;
		}
		return false;
	}

}
