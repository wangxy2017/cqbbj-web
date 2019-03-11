package com.cqbbj.entity;

import com.cqbbj.core.base.BaseEntity;

import java.util.Date;
import java.util.List;

/**
 * @author wangxy
 * @version 1.0
 * @ClassName: IntentionOrder
 * @Description: 意向订单(这里用一句话描述这个类的作用)
 * @date 2019/3/10 17:03
 */
public class IntentionOrder extends BaseEntity {
    /**
     * 客户名称
     */
    private String name;
    /**
     * 客户电话
     */
    private String phone;
    /**
     * 客户类型 0：个人 1：公司
     */
    private Integer type;
    /**
     * 客户来源 0：电话 1：网络
     */
    private Integer source;
    /**
     * 搬出地址
     */
    private String start;
    /**
     * 搬入地址
     */
    private String end;
    /**
     * 预约时间
     */
    private Date beginTime;
    /**
     * 是否跟进 0：未跟进 1：已跟进
     */
    private Integer is_follow;
    /**
     * 跟进日志
     */
    private String followInfo;
    /**
     * 意向程度 0：询问  1：犹豫  2：成交 3：放弃
     */
    private Integer status;
    /**
     * 业务编号
     */
    private String inten_no;
    /**
     * 跟进人员
     */
    private String emp_no;

    /**
     * 搬运内容
     */
    private String content;
    /**
     * 作废原因
     */
    private String reason;

    private List<IntentionFollow> follows;

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

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Integer getSource() {
        return source;
    }

    public void setSource(Integer source) {
        this.source = source;
    }

    public String getStart() {
        return start;
    }

    public void setStart(String start) {
        this.start = start;
    }

    public String getEnd() {
        return end;
    }

    public void setEnd(String end) {
        this.end = end;
    }

    public Date getBeginTime() {
        return beginTime;
    }

    public void setBeginTime(Date beginTime) {
        this.beginTime = beginTime;
    }

    public Integer getIs_follow() {
        return is_follow;
    }

    public void setIs_follow(Integer is_follow) {
        this.is_follow = is_follow;
    }

    public String getFollowInfo() {
        return followInfo;
    }

    public void setFollowInfo(String followInfo) {
        this.followInfo = followInfo;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getInten_no() {
        return inten_no;
    }

    public void setInten_no(String inten_no) {
        this.inten_no = inten_no;
    }

    public String getEmp_no() {
        return emp_no;
    }

    public void setEmp_no(String emp_no) {
        this.emp_no = emp_no;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public List<IntentionFollow> getFollows() {
        return follows;
    }

    public void setFollows(List<IntentionFollow> follows) {
        this.follows = follows;
    }
}
