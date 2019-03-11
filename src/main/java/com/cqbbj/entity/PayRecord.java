package com.cqbbj.entity;

import com.cqbbj.core.base.BaseEntity;

import java.util.Date;

/**
 * @author wangxy
 * @version 1.0
 * @ClassName: PayRecord
 * @Description: 支付记录实体类(这里用一句话描述这个类的作用)
 * @date 2019/2/19 11:57
 */
public class PayRecord extends BaseEntity {

    /**
     * 订单编号
     */
    private String order_no;
    /**
     * 客户编号
     */
    private String cust_no;
    /**
     * 支付方式 0：现金 1：微信 2：签单
     */
    private Integer payWay;
    /**
     * 支付金额
     */
    private Double payMoney;
    /**
     * 支付时间
     */
    private Date payTime;
    /**
     * 交易号
     */
    private String trans_no;
    /**
     * 收款人
     */
    private String emp_no;
    /**
     * 记录编号
     */
    private String record_no;

    /**
     * ============ 关联字段 ==============
     */

    /**
     * 客户姓名
     */
    private String custName;
    /**
     * 收款人姓名
     */
    private String empName;


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

    public Integer getPayWay() {
        return payWay;
    }

    public void setPayWay(Integer payWay) {
        this.payWay = payWay;
    }

    public Double getPayMoney() {
        return payMoney;
    }

    public void setPayMoney(Double payMoney) {
        this.payMoney = payMoney;
    }

    public Date getPayTime() {
        return payTime;
    }

    public void setPayTime(Date payTime) {
        this.payTime = payTime;
    }

    public String getTrans_no() {
        return trans_no;
    }

    public void setTrans_no(String trans_no) {
        this.trans_no = trans_no;
    }

    public String getEmp_no() {
        return emp_no;
    }

    public void setEmp_no(String emp_no) {
        this.emp_no = emp_no;
    }

    public String getRecord_no() {
        return record_no;
    }

    public void setRecord_no(String record_no) {
        this.record_no = record_no;
    }

    public String getCustName() {
        return custName;
    }

    public void setCustName(String custName) {
        this.custName = custName;
    }

    public String getEmpName() {
        return empName;
    }

    public void setEmpName(String empName) {
        this.empName = empName;
    }
}
