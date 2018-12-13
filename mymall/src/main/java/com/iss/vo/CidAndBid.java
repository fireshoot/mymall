package com.iss.vo;

public class CidAndBid {
	private int cid;
	private String Bid;
	
	
	
	public CidAndBid() {
		super();
	}
	public CidAndBid(int cid, String bid) {
		super();
		this.cid = cid;
		Bid = bid;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public String getBid() {
		return Bid;
	}
	public void setBid(String bid) {
		Bid = bid;
	}
	

}
