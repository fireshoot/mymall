package com.iss.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iss.mapper.AddressMapper;
import com.iss.pojo.Address;
import com.iss.service.IAddressService;

@Service
public class AddressServiceImpl implements IAddressService {
	
	@Autowired
	private AddressMapper addressMapper;

	public boolean addAddress(Address address) {
		
		int i=addressMapper.insertSelective(address);
		
		if(i>0)return true;else return false;
	}

	@Override
	public boolean updateUnDefaultByUserKey(int id) {

		int b=addressMapper.updateUnDefaultByUserKey(id);
		if(b>0)return true;
		else return false;
	}

	@Override
	public List<Address> getAddressByUserKey(int id) {
		
		int cid=id;
		List<Address> l=addressMapper.selectByUserKey(cid);
		
		return l;
	}

	@Override
	public boolean deleteAddress(int idk) {
		int k=addressMapper.deleteByPrimaryKey(idk);
		if(k>0)return true;else
		return false;
	}
}
