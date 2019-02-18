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
    private Date createTime;
    /**
     * 删除状态 0：未删除 1：已删除
     */
    private Integer deleteStatus;
    /**
     * 公司编号
     */
    private String company_no;

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

    public String getCompany_no() {
        return company_no;
    }

    public void setCompany_no(String company_no) {
        this.company_no = company_no;
    }
}
