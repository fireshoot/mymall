package com.iss.pojo;

public class Customer {
    private Integer cid;

    private String nickname;

    private String password;

    private String phone;

    private String qq;

    private String cname;

    private String address;

    private String city;

    private String district;

    private String class_;

    private String grade;

    private String postcode;

    private String province;

    private String ctype;

    private String school;

    private Integer credit;

    private String picurl;

    private String email;

    private String birthday;

    private String salt;

    private Integer gender;

    public Customer(Integer cid, String nickname, String password, String phone, String qq, String cname, String address, String city, String district, String class_, String grade, String postcode, String province, String ctype, String school, Integer credit, String picurl, String email, String birthday, String salt, Integer gender) {
        this.cid = cid;
        this.nickname = nickname;
        this.password = password;
        this.phone = phone;
        this.qq = qq;
        this.cname = cname;
        this.address = address;
        this.city = city;
        this.district = district;
        this.class_ = class_;
        this.grade = grade;
        this.postcode = postcode;
        this.province = province;
        this.ctype = ctype;
        this.school = school;
        this.credit = credit;
        this.picurl = picurl;
        this.email = email;
        this.birthday = birthday;
        this.salt = salt;
        this.gender = gender;
    }

    public Customer() {
        super();
    }

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname == null ? null : nickname.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public String getQq() {
        return qq;
    }

    public void setQq(String qq) {
        this.qq = qq == null ? null : qq.trim();
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname == null ? null : cname.trim();
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city == null ? null : city.trim();
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district == null ? null : district.trim();
    }

    public String getClass_() {
        return class_;
    }

    public void setClass_(String class_) {
        this.class_ = class_ == null ? null : class_.trim();
    }

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade == null ? null : grade.trim();
    }

    public String getPostcode() {
        return postcode;
    }

    public void setPostcode(String postcode) {
        this.postcode = postcode == null ? null : postcode.trim();
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province == null ? null : province.trim();
    }

    public String getCtype() {
        return ctype;
    }

    public void setCtype(String ctype) {
        this.ctype = ctype == null ? null : ctype.trim();
    }

    public String getSchool() {
        return school;
    }

    public void setSchool(String school) {
        this.school = school == null ? null : school.trim();
    }

    public Integer getCredit() {
        return credit;
    }

    public void setCredit(Integer credit) {
        this.credit = credit;
    }

    public String getPicurl() {
        return picurl;
    }

    public void setPicurl(String picurl) {
        this.picurl = picurl == null ? null : picurl.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday == null ? null : birthday.trim();
    }

    public String getSalt() {
        return salt;
    }

    public void setSalt(String salt) {
        this.salt = salt == null ? null : salt.trim();
    }

    public Integer getGender() {
        return gender;
    }

    public void setGender(Integer gender) {
        this.gender = gender;
    }
}