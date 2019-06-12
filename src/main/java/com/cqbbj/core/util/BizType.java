package com.cqbbj.core.util;

/**
 * @author wangxy
 * @version 1.0
 * @ClassName: BizType
 * @Description: 业务类型(这里用一句话描述这个类的作用)
 * @date 2019/3/12 13:54
 */
public enum BizType {

    ORDER("DT", "订单"),
    CUSTOMER("CO", "客户"),
    EMPLOYEE("EP", "员工"),
    SALARY("SA", "薪资"),
    MONEY_DETAIL("MD", "收支明细"),
    PAY_RECORD("PR", "支付记录"),
    ORDER_DIVIDE("OD", "订单提成"),
    DIVIDE_MODEL("DM", "提成模板"),
    SIGN_BILL("SN", "签单"),
    INTENTION_ORDER("IN", "意向订单"),
    CAR("CR", "车辆");

    private final String code;
    private final String desc;

    BizType(String code, String desc) {
        this.code = code;
        this.desc = desc;
    }

    public String getCode() {
        return code;
    }

    public String getDesc() {
        return desc;
    }


}
