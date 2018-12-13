package com.iss.service;

import com.iss.pojo.Customer;
import com.iss.pojo.Question;

public interface ICustomerService {

	boolean zhuce(Customer u);
	
	boolean codeUser(String name);
	
	Customer login(String username,String password);
	
	Question findbyname_question(String cname);
	
	Customer findbyname(String cname);

	boolean insert_question(Question q);

	
	
	boolean updatePassword(Customer customer);

	Customer findbykey(int cid);

	boolean updatedata(Customer cus);

	
}
