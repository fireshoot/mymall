package com.iss.service;

import com.iss.pojo.Collect;

public interface ICollectService {

	public boolean addCollect(String bid,int cid);
	
	public Collect findByBidAndCid(int bid,int cid);
	
}
