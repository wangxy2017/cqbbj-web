package com.cqbbj.entity;

import com.cqbbj.core.base.BaseEntity;

import java.util.Date;

/**
 * @author wangxy
 * @version 1.0
 * @ClassName: Car
 * @Description: 提成实体类(这里用一句话描述这个类的作用)
 * @date 2019/2/19 12:07
 */
public class OrderDivide extends BaseEntity {
    /**
     * 员工编号
     */
    private  String emp_no;
    /**
     * 订单号
     */
    private String order_no;
    /**
     * 订单金额
     */
    private double order_price;
    /**
     *提成比例
     */
    private String type;
    /**
     * 提成比例
     */
    private double money;
    /**
     * 结算时间
     */
    private Date clean_time;
    /**
     * 操作人
     */
    private String operator_no;

    /**
     *员工姓名
     * @return
     */
    private String emp_name;

    /**
     * 操作人
     * @return
     */
    private String operator_name;

    public String getEmp_name() {
        return emp_name;
    }

    public void setEmp_name(String emp_name) {
        this.emp_name = emp_name;
    }

    public String getOperator_name() {
        return operator_name;
    }

    public void setOperator_name(String operator_name) {
        this.operator_name = operator_name;
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

    /**
     * 搬出地址
     */
    private String start;
    /**
     *搬入地址
     */
    private String end;

    public String getEmp_no() {
        return emp_no;
    }

    public void setEmp_no(String emp_no) {
        this.emp_no = emp_no;
    }

    public String getOrder_no() {
        return order_no;
    }

    public void setOrder_no(String order_no) {
        this.order_no = order_no;
    }

    public double getOrder_price() {
        return order_price;
    }

    public void setOrder_price(double order_price) {
        this.order_price = order_price;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public double getMoney() {
        return money;
    }

    public void setMoney(double money) {
        this.money = money;
    }

    public Date getClean_time() {
        return clean_time;
    }

    public void setClean_time(Date clean_time) {
        this.clean_time = clean_time;
    }

    public String getOperator_no() {
        return operator_no;
    }

    public void setOperator_no(String operator_no) {
        this.operator_no = operator_no;
    }
}
