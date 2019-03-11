package com.cqbbj.entity;

import com.cqbbj.core.base.BaseEntity;

import java.util.Date;

/**
 * @author wangxy
 * @version 1.0
 * @ClassName: MoneyDetail
 * @Description: 收支明细(这里用一句话描述这个类的作用)
 * @date 2019/2/18 19:30
 */
public class MoneyDetail extends BaseEntity {

    /**
     * 员工编号
     */
    private String emp_no;
    /**
     * 收支类型 0：收入 1：支出
     */
    private Integer type;
    /**
     * 交易金额
     */
    private Double money;
    /**
     * 备注
     */
    private String remark;

    /**
     * 可用余额
     * @return
     */
    public double restMoney;

    /**
     * 开始时间
     * @return
     */
    public Date startTime;

    /**
     * 结束时间
     * @return
     */
    public Date endTime;

    public Date getStartTime() {
        return startTime;
    }

    public void setStartTime(Date startTime) {
        this.startTime = startTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public double getRestMoney() {
        return restMoney;
    }

    public void setRestMoney(double restMoney) {
        this.restMoney = restMoney;
    }

    public String getEmp_no() {
        return emp_no;
    }

    public void setEmp_no(String emp_no) {
        this.emp_no = emp_no;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Double getMoney() {
        return money;
    }

    public void setMoney(Double money) {
        this.money = money;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}
