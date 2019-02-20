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
     * 员工姓名
     */
    private String name;
    /**
     * 电话
     */
    private String phone;
    /**
     * 头像
     */
    private String photo;
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

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
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

}
