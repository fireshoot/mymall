package com.iss.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iss.mapper.CollectMapper;
import com.iss.pojo.Collect;
import com.iss.service.ICollectService;

@Service
public class CollectServiceImpl implements ICollectService {

	@Autowired
	private CollectMapper collectMapper;
	
	@Override
	public boolean addCollect(String bookid, int cid) {
		// TODO Auto-generated method stub
		int bid=Integer.parseInt(bookid);
		Collect record=new Collect();
		record.setCollectBookid(bid);
		record.setCollectUserid(cid);
		System.out.println("test collect:"+record.getCollectId());
		int row=collectMapper.insertSelective(record);
		if(row>0)
			return true;
		else
			return false;
	}

	@Override
	public Collect findByBidAndCid(int bid, int cid) {
		// TODO Auto-generated method stub
		System.out.println("enter collectService");
		
		Collect collect=collectMapper.selectByBidAndCid(bid, cid);
		
		if(collect==null)
			System.out.println("no record");
		else
			System.out.println("have record");
		return collect;
	}

}
