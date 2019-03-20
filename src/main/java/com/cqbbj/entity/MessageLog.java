package com.cqbbj.entity;

import com.cqbbj.core.base.BaseEntity;

import java.util.Date;

/**
 * @author wangxy
 * @version 1.0
 * @ClassName: MessageLog
 * @Description: 短信日志实体类(这里用一句话描述这个类的作用)
 * @date 2019/2/19 10:08
 */
public class MessageLog extends BaseEntity {
    /**
     * 手机号
     */
    private String phone;
    /**
     * 内容
     */
    private String content;

    /**
     * =========== 范围筛选 ==============
     */
    private Date createTime1;

    private Date createTime2;

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

    public Date getCreateTime1() {
        return createTime1;
    }

    public void setCreateTime1(Date createTime1) {
        this.createTime1 = createTime1;
    }

    public Date getCreateTime2() {
        return createTime2;
    }

    public void setCreateTime2(Date createTime2) {
        this.createTime2 = createTime2;
    }
}
