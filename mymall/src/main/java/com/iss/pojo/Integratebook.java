package com.iss.pojo;

public class Integratebook {
    private Integer integratebookId;

    private String integratebookName;

    private String integratebookImage;

    private Integer integratebookValue;

    public Integratebook(Integer integratebookId, String integratebookName, String integratebookImage, Integer integratebookValue) {
        this.integratebookId = integratebookId;
        this.integratebookName = integratebookName;
        this.integratebookImage = integratebookImage;
        this.integratebookValue = integratebookValue;
    }

    public Integratebook() {
        super();
    }

    public Integer getIntegratebookId() {
        return integratebookId;
    }

    public void setIntegratebookId(Integer integratebookId) {
        this.integratebookId = integratebookId;
    }

    public String getIntegratebookName() {
        return integratebookName;
    }

    public void setIntegratebookName(String integratebookName) {
        this.integratebookName = integratebookName == null ? null : integratebookName.trim();
    }

    public String getIntegratebookImage() {
        return integratebookImage;
    }

    public void setIntegratebookImage(String integratebookImage) {
        this.integratebookImage = integratebookImage == null ? null : integratebookImage.trim();
    }

    public Integer getIntegratebookValue() {
        return integratebookValue;
    }

    public void setIntegratebookValue(Integer integratebookValue) {
        this.integratebookValue = integratebookValue;
    }
}