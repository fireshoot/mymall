package com.iss.pojo;

public class Integrate {

	private String imgurl;
	private String name;
    private Integer credit;
	public String getImgurl() {
		return imgurl;
	}
	public void setImgurl(String imgurl) {
		this.imgurl = imgurl;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getCredit() {
		return credit;
	}
	public void setCredit(Integer credit) {
		this.credit = credit;
	}
	@Override
	public String toString() {
		return "Integrate [imgurl=" + imgurl + ", name=" + name + ", credit=" + credit + "]";
	}
	public Integrate(String imgurl, String name, Integer credit) {
		super();
		this.imgurl = imgurl;
		this.name = name;
		this.credit = credit;
	}
	public Integrate() {
		super();
	}
    
}
