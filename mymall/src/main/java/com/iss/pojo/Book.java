package com.iss.pojo;

public class Book {
    private String bid;

    private String name;

    private Float price;

    private Float discountprice;

    private String imgurl;

    private String detail;

    private Float discount;

    private Integer state;

    private String type;

    private String limittime;

    private Integer specialty;

    private Integer grade;

    private String author;

    private String press;

    private String pubdate;

    private String isbn;

    private Integer credit;

    private String sellername;

    private String uploadbooktime;

    private String homeimageurl;

    private Integer stock;

    private Integer exchangable;

    private Integer sold;

    private Integer collection;

    public Book(String bid, String name, Float price, Float discountprice, String imgurl, String detail, Float discount, Integer state, String type, String limittime, Integer specialty, Integer grade, String author, String press, String pubdate, String isbn, Integer credit, String sellername, String uploadbooktime, String homeimageurl, Integer stock, Integer exchangable, Integer sold, Integer collection) {
        this.bid = bid;
        this.name = name;
        this.price = price;
        this.discountprice = discountprice;
        this.imgurl = imgurl;
        this.detail = detail;
        this.discount = discount;
        this.state = state;
        this.type = type;
        this.limittime = limittime;
        this.specialty = specialty;
        this.grade = grade;
        this.author = author;
        this.press = press;
        this.pubdate = pubdate;
        this.isbn = isbn;
        this.credit = credit;
        this.sellername = sellername;
        this.uploadbooktime = uploadbooktime;
        this.homeimageurl = homeimageurl;
        this.stock = stock;
        this.exchangable = exchangable;
        this.sold = sold;
        this.collection = collection;
    }

    public Book() {
        super();
    }

    public String getBid() {
        return bid;
    }

    public void setBid(String bid) {
        this.bid = bid == null ? null : bid.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Float getPrice() {
        return price;
    }

    public void setPrice(Float price) {
        this.price = price;
    }

    public Float getDiscountprice() {
        return discountprice;
    }

    public void setDiscountprice(Float discountprice) {
        this.discountprice = discountprice;
    }

    public String getImgurl() {
        return imgurl;
    }

    public void setImgurl(String imgurl) {
        this.imgurl = imgurl == null ? null : imgurl.trim();
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail == null ? null : detail.trim();
    }

    public Float getDiscount() {
        return discount;
    }

    public void setDiscount(Float discount) {
        this.discount = discount;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type == null ? null : type.trim();
    }

    public String getLimittime() {
        return limittime;
    }

    public void setLimittime(String limittime) {
        this.limittime = limittime == null ? null : limittime.trim();
    }

    public Integer getSpecialty() {
        return specialty;
    }

    public void setSpecialty(Integer specialty) {
        this.specialty = specialty;
    }

    public Integer getGrade() {
        return grade;
    }

    public void setGrade(Integer grade) {
        this.grade = grade;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author == null ? null : author.trim();
    }

    public String getPress() {
        return press;
    }

    public void setPress(String press) {
        this.press = press == null ? null : press.trim();
    }

    public String getPubdate() {
        return pubdate;
    }

    public void setPubdate(String pubdate) {
        this.pubdate = pubdate == null ? null : pubdate.trim();
    }

    public String getIsbn() {
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn == null ? null : isbn.trim();
    }

    public Integer getCredit() {
        return credit;
    }

    public void setCredit(Integer credit) {
        this.credit = credit;
    }

    public String getSellername() {
        return sellername;
    }

    public void setSellername(String sellername) {
        this.sellername = sellername == null ? null : sellername.trim();
    }

    public String getUploadbooktime() {
        return uploadbooktime;
    }

    public void setUploadbooktime(String uploadbooktime) {
        this.uploadbooktime = uploadbooktime == null ? null : uploadbooktime.trim();
    }

    public String getHomeimageurl() {
        return homeimageurl;
    }

    public void setHomeimageurl(String homeimageurl) {
        this.homeimageurl = homeimageurl == null ? null : homeimageurl.trim();
    }

    public Integer getStock() {
        return stock;
    }

    public void setStock(Integer stock) {
        this.stock = stock;
    }

    public Integer getExchangable() {
        return exchangable;
    }

    public void setExchangable(Integer exchangable) {
        this.exchangable = exchangable;
    }

    public Integer getSold() {
        return sold;
    }

    public void setSold(Integer sold) {
        this.sold = sold;
    }

    public Integer getCollection() {
        return collection;
    }

    public void setCollection(Integer collection) {
        this.collection = collection;
    }
}