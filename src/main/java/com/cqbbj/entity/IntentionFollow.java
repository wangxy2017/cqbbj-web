package com.cqbbj.entity;

import com.cqbbj.core.base.BaseEntity;

import java.util.Date;

/**
 * @author wangxy
 * @version 1.0
 * @ClassName: IntentionFollow
 * @Description: 跟进记录(这里用一句话描述这个类的作用)
 * @date 2019/3/10 21:44
 */
public class IntentionFollow extends BaseEntity {

    /**
     * 跟进记录
     */
    private String content;
    /**
     * 跟进时间
     */
    private Date time;

    /**
     * 订单编号
     */
    private String inten_no;

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public String getInten_no() {
        return inten_no;
    }

    public void setInten_no(String inten_no) {
        this.inten_no = inten_no;
    }
}
