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
    private Double profit_money;
    /**
     * 其他开支
     */
    private Double other_money;
    /**
     * 实发薪资
     */
    private Double real_money;
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

    /**
     * 员工姓名
     * @return
     */
    private String emp_name;
    /**
     * 员工性别
     */
    private Integer emp_sex;

    public String getEmp_pos() {
        return emp_pos;
    }

    public void setEmp_pos(String emp_pos) {
        this.emp_pos = emp_pos;
    }

    /**
     * 员工职位
     */
    private String emp_pos;

    public String getEmp_name() {
        return emp_name;
    }

    public void setEmp_name(String emp_name) {
        this.emp_name = emp_name;
    }

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

    public Double getOther_money() {
        return other_money;
    }

    public void setOther_money(Double other_money) {
        this.other_money = other_money;
    }

    public Double getProfit_money() {
        return profit_money;
    }

    public void setProfit_money(Double profit_money) {
        this.profit_money = profit_money;
    }

    public Double getReal_money() {
        return real_money;
    }

    public void setReal_money(Double real_money) {
        this.real_money = real_money;
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

    public Integer getEmp_sex() {
        return emp_sex;
    }

    public void setEmp_sex(Integer emp_sex) {
        this.emp_sex = emp_sex;
    }
}
