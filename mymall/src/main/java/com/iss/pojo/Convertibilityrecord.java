package com.iss.pojo;

public class Convertibilityrecord {
    private Integer convertibilityrecordId;

    private Integer convertibilityrecordBookid;

    private Integer convertibilityrecordUserid;

    public Convertibilityrecord(Integer convertibilityrecordId, Integer convertibilityrecordBookid, Integer convertibilityrecordUserid) {
        this.convertibilityrecordId = convertibilityrecordId;
        this.convertibilityrecordBookid = convertibilityrecordBookid;
        this.convertibilityrecordUserid = convertibilityrecordUserid;
    }

    public Convertibilityrecord() {
        super();
    }

    public Integer getConvertibilityrecordId() {
        return convertibilityrecordId;
    }

    public void setConvertibilityrecordId(Integer convertibilityrecordId) {
        this.convertibilityrecordId = convertibilityrecordId;
    }

    public Integer getConvertibilityrecordBookid() {
        return convertibilityrecordBookid;
    }

    public void setConvertibilityrecordBookid(Integer convertibilityrecordBookid) {
        this.convertibilityrecordBookid = convertibilityrecordBookid;
    }

    public Integer getConvertibilityrecordUserid() {
        return convertibilityrecordUserid;
    }

    public void setConvertibilityrecordUserid(Integer convertibilityrecordUserid) {
        this.convertibilityrecordUserid = convertibilityrecordUserid;
    }
}