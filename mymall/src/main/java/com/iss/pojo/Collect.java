package com.iss.pojo;

public class Collect {
    private Integer collectId;

    private Integer collectBookid;

    private Integer collectUserid;

    public Collect(Integer collectId, Integer collectBookid, Integer collectUserid) {
        this.collectId = collectId;
        this.collectBookid = collectBookid;
        this.collectUserid = collectUserid;
    }

    public Collect() {
        super();
    }

    public Integer getCollectId() {
        return collectId;
    }

    public void setCollectId(Integer collectId) {
        this.collectId = collectId;
    }

    public Integer getCollectBookid() {
        return collectBookid;
    }

    public void setCollectBookid(Integer collectBookid) {
        this.collectBookid = collectBookid;
    }

    public Integer getCollectUserid() {
        return collectUserid;
    }

    public void setCollectUserid(Integer collectUserid) {
        this.collectUserid = collectUserid;
    }
}