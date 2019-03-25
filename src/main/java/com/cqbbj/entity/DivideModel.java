package com.cqbbj.entity;

import com.cqbbj.core.base.BaseEntity;

import java.util.List;

/**
 * @author wangxy
 * @version 1.0
 * @ClassName: DivideModel
 * @Description: 提成模式实体(这里用一句话描述这个类的作用)
 * @date 2019/3/6 10:19
 */
public class DivideModel extends BaseEntity {

    /**
     * 模式名称
     */
    private String name;
    /**
     * 模式编号
     */
    private String model_no;

    /**
     * 是否启用 0：启用 1：禁用
     */
    private Integer is_disabled;
    /**
     * 提成详情
     */
    private List<DivideModelDetails> details;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getModel_no() {
        return model_no;
    }

    public void setModel_no(String model_no) {
        this.model_no = model_no;
    }

    public List<DivideModelDetails> getDetails() {
        return details;
    }

    public void setDetails(List<DivideModelDetails> details) {
        this.details = details;
    }

    public Integer getIs_disabled() {
        return is_disabled;
    }

    public void setIs_disabled(Integer is_disabled) {
        this.is_disabled = is_disabled;
    }
}
