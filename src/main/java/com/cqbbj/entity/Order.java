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
    private String receiveText;

    /**
     * 实际花费
     */
    private Double costMoney;

    /**
     * 回访记录
     */
    private String visit;

    /**
     * 订单来源 0：电话 1：网络
     */
    private Integer source;

    /**
     * 订单类型 0：个人 1：企业
     */
    private Integer type;
    /**
     * 是否结算 0：未结算 1：已结算
     */
    private Integer is_clean;
    /**
     * 结算备注
     */
    private String cleanText;

    /**
     * 收款状态 0：未收款 1：已收款
     */
    private Integer payState;

    /**
     * 业务员
     */
    private String salesman;

    /**
     * ============ 关联属性 =============
     */

    /**
     * 收款人员
     */
    private List<SendOrder> moneyEmps;
    /**
     * 随车司机
     */
    private List<SendOrder> driveEmps;
    /**
     * 随车搬运工
     */
    private List<SendOrder> moveEmps;
    /**
     * 随车空调工
     */
    private List<SendOrder> airEmps;


    /**
     * ============= 范围筛选属性 ==============
     */

    /**
     * 创建时间筛选
     */
    private Date createTime1;
    private Date createTime2;

    /**
     * 预约时间筛选
     */
    private Date beginTime1;
    private Date beginTime2;
    /**
     * =============== 关联字段 =================
     */

    /**
     * 派遣员工编号
     */
    private String emp_no;
    /**
     * 派单时间
     */
    private Date dispatchTime;

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

    public List<SendOrder> getMoneyEmps() {
        return moneyEmps;
    }

    public void setMoneyEmps(List<SendOrder> moneyEmps) {
        this.moneyEmps = moneyEmps;
    }

    public List<SendOrder> getDriveEmps() {
        return driveEmps;
    }

    public void setDriveEmps(List<SendOrder> driveEmps) {
        this.driveEmps = driveEmps;
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

    public String getReceiveText() {
        return receiveText;
    }

    public void setReceiveText(String receiveText) {
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

    public Date getCreateTime1() {
        return createTime1;
    }

    public void setCreateTime1(Date createTime1) {
        this.createTime1 = createTime1;
    }

    public Date getCreateTime2() {
        return createTime2;
    }

    public void setCreateTime2(Date createTime2) {
        this.createTime2 = createTime2;
    }

    public Date getBeginTime1() {
        return beginTime1;
    }

    public void setBeginTime1(Date beginTime1) {
        this.beginTime1 = beginTime1;
    }

    public Date getBeginTime2() {
        return beginTime2;
    }

    public void setBeginTime2(Date beginTime2) {
        this.beginTime2 = beginTime2;
    }

    public Integer getSource() {
        return source;
    }

    public void setSource(Integer source) {
        this.source = source;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public String getEmp_no() {
        return emp_no;
    }

    public void setEmp_no(String emp_no) {
        this.emp_no = emp_no;
    }

    public Integer getIs_clean() {
        return is_clean;
    }

    public void setIs_clean(Integer is_clean) {
        this.is_clean = is_clean;
    }

    public Integer getPayState() {
        return payState;
    }

    public void setPayState(Integer payState) {
        this.payState = payState;
    }

    public String getSalesman() {
        return salesman;
    }

    public void setSalesman(String salesman) {
        this.salesman = salesman;
    }

    public String getCleanText() {
        return cleanText;
    }

    public void setCleanText(String cleanText) {
        this.cleanText = cleanText;
    }

    public Date getDispatchTime() {
        return dispatchTime;
    }

    public void setDispatchTime(Date dispatchTime) {
        this.dispatchTime = dispatchTime;
    }
}
