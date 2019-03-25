package com.cqbbj.entity;

import com.cqbbj.core.base.BaseEntity;

/**
 * @author wangxy
 * @version 1.0
 * @ClassName: Customer
 * @Description: 客户实体类(这里用一句话描述这个类的作用)
 * @date 2019/2/19 9:45
 */
public class Customer extends BaseEntity {
    /**
     * 客户名称
     */
    private String name;
    /**
     * 客户电话
     */
    private String phone;
    /**
     * 客户编号
     */
    private String cust_no;

    public Integer getIs_wxLogin() {
        return is_wxLogin;
    }

    public void setIs_wxLogin(Integer is_wxLogin) {
        this.is_wxLogin = is_wxLogin;
    }

    /**
     * 是否微信登录
     */
    private Integer is_wxLogin;
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

    public String getCust_no() {
        return cust_no;
    }

    public void setCust_no(String cust_no) {
        this.cust_no = cust_no;
    }
}
