package com.iss.pojo;

public class Cart {
    private Integer id;

    private Integer cid;

    private String bid;

    private Double unitprice;

    private String bname;

    private Double amount;

    private Integer buynum;

    private String imgurl;

    private String createtime;

    public Cart(Integer id, Integer cid, String bid, Double unitprice, String bname, Double amount, Integer buynum, String imgurl, String createtime) {
        this.id = id;
        this.cid = cid;
        this.bid = bid;
        this.unitprice = unitprice;
        this.bname = bname;
        this.amount = amount;
        this.buynum = buynum;
        this.imgurl = imgurl;
        this.createtime = createtime;
    }

    public Cart() {
        super();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public String getBid() {
        return bid;
    }

    public void setBid(String bid) {
        this.bid = bid == null ? null : bid.trim();
    }

    public Double getUnitprice() {
        return unitprice;
    }

    public void setUnitprice(Double unitprice) {
        this.unitprice = unitprice;
    }

    public String getBname() {
        return bname;
    }

    public void setBname(String bname) {
        this.bname = bname == null ? null : bname.trim();
    }

    public Double getAmount() {
        return amount;
    }

    public void setAmount(Double amount) {
        this.amount = amount;
    }

    public Integer getBuynum() {
        return buynum;
    }

    public void setBuynum(Integer buynum) {
        this.buynum = buynum;
    }

    public String getImgurl() {
        return imgurl;
    }

    public void setImgurl(String imgurl) {
        this.imgurl = imgurl == null ? null : imgurl.trim();
    }

    public String getCreatetime() {
        return createtime;
    }

    public void setCreatetime(String createtime) {
        this.createtime = createtime == null ? null : createtime.trim();
    }
}