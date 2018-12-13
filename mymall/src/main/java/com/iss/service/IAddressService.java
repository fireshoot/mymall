package com.iss.service;

import java.util.List;

import com.iss.pojo.Address;

public interface IAddressService {


	boolean addAddress(Address address);

	boolean updateUnDefaultByUserKey(int id);

	List<Address> getAddressByUserKey(int id);

	boolean deleteAddress(int idk);

}
