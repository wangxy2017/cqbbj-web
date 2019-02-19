package com.cqbbj.entity;

import com.cqbbj.core.base.BaseEntity;

/**
 * @author wangxy
 * @version 1.0
 * @ClassName: MessageLog
 * @Description: 短信日志实体类(这里用一句话描述这个类的作用)
 * @date 2019/2/19 10:08
 */
public class MessageLog extends BaseEntity {

    /**
     * 公司编号
     */
    private String company_no;
    /**
     * 手机号
     */
    private String phone;
    /**
     * 内容
     */
    private String content;

    public String getCompany_no() {
        return company_no;
    }

    public void setCompany_no(String company_no) {
        this.company_no = company_no;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
