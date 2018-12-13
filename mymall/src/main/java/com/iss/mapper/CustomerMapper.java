package com.iss.mapper;

import org.apache.ibatis.annotations.Param;

import com.iss.pojo.Customer;

public interface CustomerMapper {
    int deleteByPrimaryKey(Integer cid);

    int insert(Customer record);

    int insertSelective(Customer record);

    Customer selectByPrimaryKey(Integer cid);

    int updateByPrimaryKeySelective(Customer record);

    int updateByPrimaryKey(Customer record);

	Customer selectByNameAndPassword(@Param("cname")String username, @Param("password")String password);
 
	Customer selectByPrimarybyName(String name);
}