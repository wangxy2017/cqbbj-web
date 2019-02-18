package com.cqbbj.entity;

import com.cqbbj.core.base.BaseEntity;

/**
 * @author wangxy
 * @version 1.0
 * @ClassName: Position
 * @Description: 职位实体类(这里用一句话描述这个类的作用)
 * @date 2019/2/18 15:35
 */
public class Position extends BaseEntity {
    /**
     * 职位名称
     */
    private String name;
    /**
     * 是否禁用
     */
    private Integer is_disabled;
    /**
     * 部门ID
     */
    private Integer dept_id;
    /**
     * 公司编号
     */
    private String company_no;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getIs_disabled() {
        return is_disabled;
    }

    public void setIs_disabled(Integer is_disabled) {
        this.is_disabled = is_disabled;
    }

    public Integer getDept_id() {
        return dept_id;
    }

    public void setDept_id(Integer dept_id) {
        this.dept_id = dept_id;
    }

    public String getCompany_no() {
        return company_no;
    }

    public void setCompany_no(String company_no) {
        this.company_no = company_no;
    }
}
