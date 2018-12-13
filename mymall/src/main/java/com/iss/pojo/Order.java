package com.iss.pojo;

import java.util.Date;

public class Order {
    private Integer orderId;

    private Integer orderUserid;

    private Integer orderGoodsid;

    private String orderGoodsname;

    private String orderAddress;

    private Date orderDate;

    private Integer orderCount;

    private Double orderUnitprice;

    private Double orderPrice;

    private String orderPaymenttype;

    private String orderDeliverytype;

    private Double orderPostage;

    private Integer orderState;

    public Order(Integer orderId, Integer orderUserid, Integer orderGoodsid, String orderGoodsname, String orderAddress, Date orderDate, Integer orderCount, Double orderUnitprice, Double orderPrice, String orderPaymenttype, String orderDeliverytype, Double orderPostage, Integer orderState) {
        this.orderId = orderId;
        this.orderUserid = orderUserid;
        this.orderGoodsid = orderGoodsid;
        this.orderGoodsname = orderGoodsname;
        this.orderAddress = orderAddress;
        this.orderDate = orderDate;
        this.orderCount = orderCount;
        this.orderUnitprice = orderUnitprice;
        this.orderPrice = orderPrice;
        this.orderPaymenttype = orderPaymenttype;
        this.orderDeliverytype = orderDeliverytype;
        this.orderPostage = orderPostage;
        this.orderState = orderState;
    }

    public Order() {
        super();
    }

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public Integer getOrderUserid() {
        return orderUserid;
    }

    public void setOrderUserid(Integer orderUserid) {
        this.orderUserid = orderUserid;
    }

    public Integer getOrderGoodsid() {
        return orderGoodsid;
    }

    public void setOrderGoodsid(Integer orderGoodsid) {
        this.orderGoodsid = orderGoodsid;
    }

    public String getOrderGoodsname() {
        return orderGoodsname;
    }

    public void setOrderGoodsname(String orderGoodsname) {
        this.orderGoodsname = orderGoodsname == null ? null : orderGoodsname.trim();
    }

    public String getOrderAddress() {
        return orderAddress;
    }

    public void setOrderAddress(String orderAddress) {
        this.orderAddress = orderAddress == null ? null : orderAddress.trim();
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public Integer getOrderCount() {
        return orderCount;
    }

    public void setOrderCount(Integer orderCount) {
        this.orderCount = orderCount;
    }

    public Double getOrderUnitprice() {
        return orderUnitprice;
    }

    public void setOrderUnitprice(Double orderUnitprice) {
        this.orderUnitprice = orderUnitprice;
    }

    public Double getOrderPrice() {
        return orderPrice;
    }

    public void setOrderPrice(Double orderPrice) {
        this.orderPrice = orderPrice;
    }

    public String getOrderPaymenttype() {
        return orderPaymenttype;
    }

    public void setOrderPaymenttype(String orderPaymenttype) {
        this.orderPaymenttype = orderPaymenttype == null ? null : orderPaymenttype.trim();
    }

    public String getOrderDeliverytype() {
        return orderDeliverytype;
    }

    public void setOrderDeliverytype(String orderDeliverytype) {
        this.orderDeliverytype = orderDeliverytype == null ? null : orderDeliverytype.trim();
    }

    public Double getOrderPostage() {
        return orderPostage;
    }

    public void setOrderPostage(Double orderPostage) {
        this.orderPostage = orderPostage;
    }

    public Integer getOrderState() {
        return orderState;
    }

    public void setOrderState(Integer orderState) {
        this.orderState = orderState;
    }
}