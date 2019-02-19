package com.cqbbj.entity;

import com.cqbbj.core.base.BaseEntity;

import java.util.Date;

/**
 * @author wangxy
 * @version 1.0
 * @ClassName: CompanyConfig
 * @Description: 公司配置实体类(这里用一句话描述这个类的作用)
 * @date 2019/2/19 10:31
 */
public class CompanyConfig extends BaseEntity {
    /**
     * 公司编号
     */
    private String company_no;
    /**
     * 公司logo
     */
    private String logo;
    /**
     * 短信签名
     */
    private String msg_sign;
    /**
     * 短信条数
     */
    private Integer msg_count;
    /**
     * 短信开启 0：开启 1：关闭
     */
    private Integer msg_open;
    /**
     * 使用到期时间
     */
    private Date endTime;
    /**
     * 关键词配置
     */
    private String keyword;

    public String getCompany_no() {
        return company_no;
    }

    public void setCompany_no(String company_no) {
        this.company_no = company_no;
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

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }
}
