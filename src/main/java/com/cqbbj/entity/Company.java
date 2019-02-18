package com.cqbbj.entity;

import com.cqbbj.core.base.BaseEntity;

/**
 * @author wangxy
 * @version 1.0
 * @ClassName: Company
 * @Description: 公司实体类(这里用一句话描述这个类的作用)
 * @date 2019/2/18 14:26
 */
public class Company extends BaseEntity {
    /**
     * 企业名称
     */
    private String name;
    /**
     * 企业地址
     */
    private String address;
    /**
     * 企业电话
     */
    private String telephone;
    /**
     * 信用代码
     */
    private String credit_code;
    /**
     * 是否禁用
     */
    private Integer is_disabled;
    /**
     * 企业编号
     */
    private String company_no;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getCredit_code() {
        return credit_code;
    }

    public void setCredit_code(String credit_code) {
        this.credit_code = credit_code;
    }

    public Integer getIs_disabled() {
        return is_disabled;
    }

    public void setIs_disabled(Integer is_disabled) {
        this.is_disabled = is_disabled;
    }

    public String getCompany_no() {
        return company_no;
    }

    public void setCompany_no(String company_no) {
        this.company_no = company_no;
    }
}
