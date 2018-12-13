package com.iss.pojo;

public class Address {
    private Integer id;

    private Integer cid;

    private String name;

    private String province;

    private String city;

    private String county;

    private String addrDetail;

    private String postcode;

    private String mobile;

    private String telephone;

    private Integer defaultaddr;

    public Address(Integer id, Integer cid, String name, String province, String city, String county, String addrDetail, String postcode, String mobile, String telephone, Integer defaultaddr) {
        this.id = id;
        this.cid = cid;
        this.name = name;
        this.province = province;
        this.city = city;
        this.county = county;
        this.addrDetail = addrDetail;
        this.postcode = postcode;
        this.mobile = mobile;
        this.telephone = telephone;
        this.defaultaddr = defaultaddr;
    }

    public Address() {
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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province == null ? null : province.trim();
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city == null ? null : city.trim();
    }

    public String getCounty() {
        return county;
    }

    public void setCounty(String county) {
        this.county = county == null ? null : county.trim();
    }

    public String getAddrDetail() {
        return addrDetail;
    }

    public void setAddrDetail(String addrDetail) {
        this.addrDetail = addrDetail == null ? null : addrDetail.trim();
    }

    public String getPostcode() {
        return postcode;
    }

    public void setPostcode(String postcode) {
        this.postcode = postcode == null ? null : postcode.trim();
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile == null ? null : mobile.trim();
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone == null ? null : telephone.trim();
    }

    public Integer getDefaultaddr() {
        return defaultaddr;
    }

    public void setDefaultaddr(Integer defaultaddr) {
        this.defaultaddr = defaultaddr;
    }
}