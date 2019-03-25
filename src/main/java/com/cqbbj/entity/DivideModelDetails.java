package com.cqbbj.entity;

import com.cqbbj.core.base.BaseEntity;

/**
 * @author wangxy
 * @version 1.0
 * @ClassName: DivideModelDetails
 * @Description: 提成详情(这里用一句话描述这个类的作用)
 * @date 2019/3/6 10:21
 */
public class DivideModelDetails extends BaseEntity {

    /**
     * 模式编号
     */
    private String model_no;
    /**
     * 提成名称
     */
    private String name;
    /**
     * 提成方式 0：工时提成 1：比例提成
     */
    private Integer type;
    /**
     * 提成数值
     */
    private Double value;
    /**
     * 是否全额提成 0：全额提成 1：扣除开支提成
     */
    private Integer isAll;

    public String getModel_no() {
        return model_no;
    }

    public void setModel_no(String model_no) {
        this.model_no = model_no;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Double getValue() {
        return value;
    }

    public void setValue(Double value) {
        this.value = value;
    }

    public Integer getIsAll() {
        return isAll;
    }

    public void setIsAll(Integer isAll) {
        this.isAll = isAll;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
