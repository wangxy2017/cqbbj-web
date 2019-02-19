package com.cqbbj.entity;

import com.cqbbj.core.base.BaseEntity;

import java.util.Date;

/**
 * @author wangxy
 * @version 1.0
 * @ClassName: Order
 * @Description: 订单实体类(这里用一句话描述这个类的作用)
 * @date 2019/2/19 10:49
 */
public class Order extends BaseEntity {
    /**
     * 公司编号
     */
    private String company_no;
    /**
     * 客户名称
     */
    private String name;
    /**
     * 客户电话
     */
    private String phone;
    /**
     * 搬出地址
     */
    private String start;
    /**
     * 搬入地址
     */
    private String end;
    /**
     * 预估价
     */
    private Double price;
    /**
     * 预约时间
     */
    private Date beginTime;
    /**
     * 搬运内容
     */
    private String content;
    /**
     * 短信提醒 0：提醒 1：不提醒
     */
    private Integer is_notice;
    /**
     * 订单状态 0：未派单 1：已派单 2：已完成 3：已取消
     */
    private Integer status;
    /**
     * 搬出地址（经纬度）
     */
    private String startMap;
    /**
     * 搬入地址（经纬度）
     */
    private String endMap;
    /**
     * 完成时间
     */
    private String endTime;
    /**
     * 订单编号
     */
    private String order_no;

    public String getCompany_no() {
        return company_no;
    }

    public void setCompany_no(String company_no) {
        this.company_no = company_no;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getStart() {
        return start;
    }

    public void setStart(String start) {
        this.start = start;
    }

    public String getEnd() {
        return end;
    }

    public void setEnd(String end) {
        this.end = end;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Date getBeginTime() {
        return beginTime;
    }

    public void setBeginTime(Date beginTime) {
        this.beginTime = beginTime;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Integer getIs_notice() {
        return is_notice;
    }

    public void setIs_notice(Integer is_notice) {
        this.is_notice = is_notice;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getStartMap() {
        return startMap;
    }

    public void setStartMap(String startMap) {
        this.startMap = startMap;
    }

    public String getEndMap() {
        return endMap;
    }

    public void setEndMap(String endMap) {
        this.endMap = endMap;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    public String getOrder_no() {
        return order_no;
    }

    public void setOrder_no(String order_no) {
        this.order_no = order_no;
    }
}
