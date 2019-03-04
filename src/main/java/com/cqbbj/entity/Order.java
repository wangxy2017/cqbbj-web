package com.cqbbj.entity;

import com.cqbbj.core.base.BaseEntity;

import java.util.Date;
import java.util.List;

/**
 * @author wangxy
 * @version 1.0
 * @ClassName: Order
 * @Description: 订单实体类(这里用一句话描述这个类的作用)
 * @date 2019/2/19 10:49
 */
public class Order extends BaseEntity {
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
    private Date endTime;
    /**
     * 订单编号
     */
    private String order_no;
    /**
     * 客户编号
     */
    private String cust_no;

    /**
     * 实际收款
     */
    private Double receiveMoney;

    /**
     * 收款备注
     */
    private Double receiveText;

    /**
     * 实际花费
     */
    private Double costMoney;

    /**
     * 回访记录
     */
    private String visit;

    /**
     * ============ 关联属性 =============
     */

    /**
     * 收款人员
     */
    private List<SendOrder> moenyEmps;
    /**
     * 随车司机
     */
    private List<SendOrder> dirveEmps;
    /**
     * 随车搬运工
     */
    private List<SendOrder> moveEmps;
    /**
     * 随车空调工
     */
    private List<SendOrder> airEmps;

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

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public String getOrder_no() {
        return order_no;
    }

    public void setOrder_no(String order_no) {
        this.order_no = order_no;
    }

    public String getCust_no() {
        return cust_no;
    }

    public void setCust_no(String cust_no) {
        this.cust_no = cust_no;
    }

    public List<SendOrder> getMoenyEmps() {
        return moenyEmps;
    }

    public void setMoenyEmps(List<SendOrder> moenyEmps) {
        this.moenyEmps = moenyEmps;
    }

    public List<SendOrder> getDirveEmps() {
        return dirveEmps;
    }

    public void setDirveEmps(List<SendOrder> dirveEmps) {
        this.dirveEmps = dirveEmps;
    }

    public List<SendOrder> getMoveEmps() {
        return moveEmps;
    }

    public void setMoveEmps(List<SendOrder> moveEmps) {
        this.moveEmps = moveEmps;
    }

    public List<SendOrder> getAirEmps() {
        return airEmps;
    }

    public void setAirEmps(List<SendOrder> airEmps) {
        this.airEmps = airEmps;
    }

    public Double getReceiveMoney() {
        return receiveMoney;
    }

    public void setReceiveMoney(Double receiveMoney) {
        this.receiveMoney = receiveMoney;
    }

    public Double getReceiveText() {
        return receiveText;
    }

    public void setReceiveText(Double receiveText) {
        this.receiveText = receiveText;
    }

    public Double getCostMoney() {
        return costMoney;
    }

    public void setCostMoney(Double costMoney) {
        this.costMoney = costMoney;
    }

    public String getVisit() {
        return visit;
    }

    public void setVisit(String visit) {
        this.visit = visit;
    }
}
