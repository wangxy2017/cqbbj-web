package com.cqbbj.entity;

import com.cqbbj.core.base.BaseEntity;

/**
 * @author wangxy
 * @version 1.0
 * @ClassName: SendOrder
 * @Description: 派单实体类(这里用一句话描述这个类的作用)
 * @date 2019/2/20 20:14
 */
public class SendOrder extends BaseEntity {

    /**
     * 订单编号
     */
    private String order_no;
    /**
     * 派遣员工编号
     */
    private String emp_no;
    /**
     * 派遣类型 0：收款人员 1：随车司机 2：随车搬运工 3：随车空调工
     */
    private Integer type;

    /**
     * #################################关联:员工姓名
     * @return
     */
    private String emp_name;

    public String getEmp_name() {
        return emp_name;
    }

    public void setEmp_name(String emp_name) {
        this.emp_name = emp_name;
    }

    public String getOrder_no() {
        return order_no;
    }

    public void setOrder_no(String order_no) {
        this.order_no = order_no;
    }

    public String getEmp_no() {
        return emp_no;
    }

    public void setEmp_no(String emp_no) {
        this.emp_no = emp_no;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }
}
