package com.cqbbj.entity;

import com.cqbbj.core.base.BaseEntity;

/**
 * @author wangxy
 * @version 1.0
 * @ClassName: OperationLog
 * @Description: 操作日志实体类(这里用一句话描述这个类的作用)
 * @date 2019/2/19 10:04
 */
public class OperationLog extends BaseEntity {

    /**
     * 操作人
     */
    private String name;
    /**
     * 内容
     */
    private String content;
    /**
     * ip地址
     */
    private String ip;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }
}
