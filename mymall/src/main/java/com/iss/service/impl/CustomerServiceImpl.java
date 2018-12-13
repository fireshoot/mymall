package com.iss.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iss.mapper.CustomerMapper;
import com.iss.mapper.QuestionMapper;
import com.iss.pojo.Customer;
import com.iss.pojo.Question;
import com.iss.service.ICustomerService;
import com.iss.utils.EncryptUtil;

@Service
public class CustomerServiceImpl implements ICustomerService {

	@Autowired
	private CustomerMapper customerMapper;
	
	@Autowired
	private QuestionMapper questionMapper;

	@Override
	public Customer login(String username, String password) {
		Customer customer =new Customer();
		customer.setCname(username);
		customer.setPassword(password);
		customer.setSalt("f155c61a0a88f8a76db4503b85183f4f");
		EncryptUtil.encryptPassword(customer);
		password=customer.getPassword();
		customer=customerMapper.selectByNameAndPassword(username,password);
		return customer;
	}
	
	@Override
	public boolean zhuce(Customer u) {
		u.setSalt("f155c61a0a88f8a76db4503b85183f4f");
		EncryptUtil.encryptPassword(u);
		
		int cnt=customerMapper.insert(u);
		if(cnt!=0) 
			return true;
		return false;
	}

	@Override
	public boolean codeUser(String name) {
		Customer user=customerMapper.selectByPrimarybyName(name);
		if(user!=null)
			return true;
		return false;
	}

	
	@Override
	public Question findbyname_question(String cname){
    	Question q=questionMapper.selectByName(cname);
    	if(q==null)
		   return null;
    	return  q;
	}
    @Override
    public Customer findbyname(String cname){
    	Customer c=customerMapper.selectByPrimarybyName(cname);
    	if(c!=null)
    	 return c;
    	else
    	return null;  	
    }
    @Override
    public boolean updatePassword(Customer customer){
    	int cnt=customerMapper.updateByPrimaryKey(customer);
    	if(cnt>0)
    		return true;
    	else
    	    return false;
    }

	
    
    
    @Override
	public boolean insert_question(Question q){
		int cnt=questionMapper.insert(q);
		if(cnt!=0)
			return true;
		return false;
	}

	@Override
	public Customer findbykey(int cid) {
		Customer c=customerMapper.selectByPrimaryKey(cid);
    	if(c!=null)
    	 return c;
    	else
    	return null; 
	}

	@Override
	public boolean updatedata(Customer cus) {
		int i=customerMapper.updateByPrimaryKeySelective(cus);
		if(i>0)
			return true;
		else
			return false;
	}
	
    

    

}
