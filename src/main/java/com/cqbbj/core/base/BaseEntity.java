/**
 * @Description: 基础实体类(用一句话描述该文件做什么)
 * @author wangxy
 * @date 2019/1/11 9:12
 * @version V1.0
 */
package com.cqbbj.core.base;

import java.util.Date;

public class BaseEntity {
    /**
     * 主键ID
     */
    private Integer id;
    /**
     * 创建时间
     */
    private Date createTime = new Date();
    /**
     * 删除状态 0：未删除 1：已删除
     */
    private Integer deleteStatus = 0;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Integer getDeleteStatus() {
        return deleteStatus;
    }

    public void setDeleteStatus(Integer deleteStatus) {
        this.deleteStatus = deleteStatus;
    }

}
