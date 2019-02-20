package com.cqbbj.entity;

import com.cqbbj.core.base.BaseEntity;

/**
 * @author wangxy
 * @version 1.0
 * @ClassName: Salary
 * @Description: 工资实体类(这里用一句话描述这个类的作用)
 * @date 2019/2/19 12:02
 */
public class Salary extends BaseEntity {
    /**
     * 员工编号
     */
    private String emp_no;
    /**
     * 基本工资
     */
    private Double base_money;
    /**
     * 提成工资
     */
    private Double profit_moeny;
    /**
     * 其他开支
     */
    private Double other_money;
    /**
     * 实发薪资
     */
    private Double real_moeny;
    /**
     * 备注
     */
    private String remark;
    /**
     * 年份
     */
    private Integer year;
    /**
     * 月份
     */
    private Integer month;
    /**
     * 薪资编号
     */
    private String salary_no;

    public String getEmp_no() {
        return emp_no;
    }

    public void setEmp_no(String emp_no) {
        this.emp_no = emp_no;
    }

    public Double getBase_money() {
        return base_money;
    }

    public void setBase_money(Double base_money) {
        this.base_money = base_money;
    }

    public Double getProfit_moeny() {
        return profit_moeny;
    }

    public void setProfit_moeny(Double profit_moeny) {
        this.profit_moeny = profit_moeny;
    }

    public Double getOther_money() {
        return other_money;
    }

    public void setOther_money(Double other_money) {
        this.other_money = other_money;
    }

    public Double getReal_moeny() {
        return real_moeny;
    }

    public void setReal_moeny(Double real_moeny) {
        this.real_moeny = real_moeny;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Integer getYear() {
        return year;
    }

    public void setYear(Integer year) {
        this.year = year;
    }

    public Integer getMonth() {
        return month;
    }

    public void setMonth(Integer month) {
        this.month = month;
    }

    public String getSalary_no() {
        return salary_no;
    }

    public void setSalary_no(String salary_no) {
        this.salary_no = salary_no;
    }
}
