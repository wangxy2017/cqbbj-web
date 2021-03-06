package com.cqbbj.entity;

import com.cqbbj.core.base.BaseEntity;

/**
 * @author wangxy
 * @version 1.0
 * @ClassName: Employee
 * @Description: 员工实体类(这里用一句话描述这个类的作用)
 * @date 2019/2/18 16:57
 */
public class Employee extends BaseEntity {

    /**
     * 账号
     */
    private String account;
    /**
     * 密码
     */
    private String password;
    /**
     * 员工姓名
     */
    private String name;
    /**
     * 电话
     */
    private String phone;
    /**
     * 性别
     */
    private Integer sex;
    /**
     * 是否禁用 0：启用 1：禁用
     */
    private Integer is_disabled;
    /**
     * 员工编号
     */
    private String emp_no;
    /**
     * 部门ID
     */
    private Integer dept_id;
    /**
     * 职位ID
     */
    private Integer position_id;
    /**
     * 员工钱包
     */
    private Double money;
    /**
     * 是否在职 0：在职 1：离职
     */
    private Integer is_onjob;
    /**
     * 离职原因
     */
    private String reason;
    /**
     * 微信登录 0：未登录 1：已登录
     */
    private Integer is_wxLogin;

    /**
     * ================关联字段=============
     */

    /**
     * 部门名称
     */
    private String deptName;
    /**
     * 职位名称
     */
    private String positionName;

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

    public Integer getIs_disabled() {
        return is_disabled;
    }

    public void setIs_disabled(Integer is_disabled) {
        this.is_disabled = is_disabled;
    }

    public String getEmp_no() {
        return emp_no;
    }

    public void setEmp_no(String emp_no) {
        this.emp_no = emp_no;
    }

    public Integer getDept_id() {
        return dept_id;
    }

    public void setDept_id(Integer dept_id) {
        this.dept_id = dept_id;
    }

    public Integer getPosition_id() {
        return position_id;
    }

    public void setPosition_id(Integer position_id) {
        this.position_id = position_id;
    }

    public Double getMoney() {
        return money;
    }

    public void setMoney(Double money) {
        this.money = money;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Integer getSex() {
        return sex;
    }

    public void setSex(Integer sex) {
        this.sex = sex;
    }

    public Integer getIs_onjob() {
        return is_onjob;
    }

    public void setIs_onjob(Integer is_onjob) {
        this.is_onjob = is_onjob;
    }

    public String getDeptName() {
        return deptName;
    }

    public void setDeptName(String deptName) {
        this.deptName = deptName;
    }

    public String getPositionName() {
        return positionName;
    }

    public void setPositionName(String positionName) {
        this.positionName = positionName;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public Integer getIs_wxLogin() {
        return is_wxLogin;
    }

    public void setIs_wxLogin(Integer is_wxLogin) {
        this.is_wxLogin = is_wxLogin;
    }
}
