package com.cqbbj.entity;

import com.cqbbj.core.base.BaseEntity;

/**
 * @author wangxy
 * @version 1.0
 * @ClassName: CompanyInfo
 * @Description: 公司信息实体类(这里用一句话描述这个类的作用)
 * @date 2019/2/20 10:21
 */
public class CompanyInfo extends BaseEntity {

    /**
     * 公司名称
     */
    private String name;
    /**
     * 公司地址
     */
    private String address;
    /**
     * 联系方式
     */
    private String telephone;
    /**
     * 公司logo
     */
    private String logo;
    /**
     * 短信宝账号
     */
    private String msg_username;
    /**
     * 短信宝密码
     */
    private String msg_password;
    /**
     * 短信签名
     */
    private String msg_sign;
    /**
     * 短信宝接口地址
     */
    private String msg_domain;

    /**
     * 短信条数
     */
    private Integer msg_count;
    /**
     * 短信通知开启 0：开启 1：关闭
     */
    private Integer msg_open;
    /**
     * 关键词配置
     */
    private String keyword;

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

    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo;
    }

    public String getMsg_sign() {
        return msg_sign;
    }

    public void setMsg_sign(String msg_sign) {
        this.msg_sign = msg_sign;
    }

    public Integer getMsg_count() {
        return msg_count;
    }

    public void setMsg_count(Integer msg_count) {
        this.msg_count = msg_count;
    }

    public Integer getMsg_open() {
        return msg_open;
    }

    public void setMsg_open(Integer msg_open) {
        this.msg_open = msg_open;
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    public String getMsg_username() {
        return msg_username;
    }

    public void setMsg_username(String msg_username) {
        this.msg_username = msg_username;
    }

    public String getMsg_password() {
        return msg_password;
    }

    public void setMsg_password(String msg_password) {
        this.msg_password = msg_password;
    }

    public String getMsg_domain() {
        return msg_domain;
    }

    public void setMsg_domain(String msg_domain) {
        this.msg_domain = msg_domain;
    }
}
