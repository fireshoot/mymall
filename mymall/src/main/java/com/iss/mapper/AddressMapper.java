package com.iss.mapper;

import java.util.List;

import com.iss.pojo.Address;

public interface AddressMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Address record);

    int insertSelective(Address record);

    Address selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Address record);

    int updateByPrimaryKey(Address record);

	int updateUnDefaultByUserKey(int cid);

	List<Address> selectByUserKey(int cid);
	
	List<Address> selectByCid(Integer cid);
}