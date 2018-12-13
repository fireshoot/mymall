package com.iss.pojo;

import java.util.Date;

public class Message {
    private Integer msgId;

    private String msgTitle;

    private String msgContent;

    private String msgState;

    private Date msgTime;

    private Integer msgSendid;

    private Integer msgReceiveid;

    public Message(Integer msgId, String msgTitle, String msgContent, String msgState, Date msgTime, Integer msgSendid, Integer msgReceiveid) {
        this.msgId = msgId;
        this.msgTitle = msgTitle;
        this.msgContent = msgContent;
        this.msgState = msgState;
        this.msgTime = msgTime;
        this.msgSendid = msgSendid;
        this.msgReceiveid = msgReceiveid;
    }

    public Message() {
        super();
    }

    public Integer getMsgId() {
        return msgId;
    }

    public void setMsgId(Integer msgId) {
        this.msgId = msgId;
    }

    public String getMsgTitle() {
        return msgTitle;
    }

    public void setMsgTitle(String msgTitle) {
        this.msgTitle = msgTitle == null ? null : msgTitle.trim();
    }

    public String getMsgContent() {
        return msgContent;
    }

    public void setMsgContent(String msgContent) {
        this.msgContent = msgContent == null ? null : msgContent.trim();
    }

    public String getMsgState() {
        return msgState;
    }

    public void setMsgState(String msgState) {
        this.msgState = msgState == null ? null : msgState.trim();
    }

    public Date getMsgTime() {
        return msgTime;
    }

    public void setMsgTime(Date msgTime) {
        this.msgTime = msgTime;
    }

    public Integer getMsgSendid() {
        return msgSendid;
    }

    public void setMsgSendid(Integer msgSendid) {
        this.msgSendid = msgSendid;
    }

    public Integer getMsgReceiveid() {
        return msgReceiveid;
    }

    public void setMsgReceiveid(Integer msgReceiveid) {
        this.msgReceiveid = msgReceiveid;
    }
}