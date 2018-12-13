package com.iss.pojo;

public class Comment {
    private Integer id;

    private Integer cid;

    private String bid;

    private String content;

    private String bookname;

    private Integer satisdegree;

    private String commenttime;

    private String cidimagesurl;

    public Comment(Integer id, Integer cid, String bid, String content, String bookname, Integer satisdegree, String commenttime, String cidimagesurl) {
        this.id = id;
        this.cid = cid;
        this.bid = bid;
        this.content = content;
        this.bookname = bookname;
        this.satisdegree = satisdegree;
        this.commenttime = commenttime;
        this.cidimagesurl = cidimagesurl;
    }

    public Comment() {
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

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public String getBookname() {
        return bookname;
    }

    public void setBookname(String bookname) {
        this.bookname = bookname == null ? null : bookname.trim();
    }

    public Integer getSatisdegree() {
        return satisdegree;
    }

    public void setSatisdegree(Integer satisdegree) {
        this.satisdegree = satisdegree;
    }

    public String getCommenttime() {
        return commenttime;
    }

    public void setCommenttime(String commenttime) {
        this.commenttime = commenttime == null ? null : commenttime.trim();
    }

    public String getCidimagesurl() {
        return cidimagesurl;
    }

    public void setCidimagesurl(String cidimagesurl) {
        this.cidimagesurl = cidimagesurl == null ? null : cidimagesurl.trim();
    }
}