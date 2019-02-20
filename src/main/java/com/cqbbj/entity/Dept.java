package com.cqbbj.entity;

import com.cqbbj.core.base.BaseEntity;

/**
 * @author wangxy
 * @version 1.0
 * @ClassName: Dept
 * @Description: 部门实体类(这里用一句话描述这个类的作用)
 * @date 2019/2/18 15:10
 */
public class Dept extends BaseEntity {
    /**
     * 部门名称
     */
    private String name;
    /**
     * 是否禁用 0：启用 1：禁用
     */
    private Integer is_disabled;

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
}
