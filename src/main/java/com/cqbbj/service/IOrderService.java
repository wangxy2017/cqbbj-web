package com.cqbbj.service;

import com.cqbbj.core.base.BaseService;
import com.cqbbj.entity.Order;

/**
 * @author wangxy
 * @version 1.0
 * @ClassName: IOrderService
 * @Description: 订单接口(这里用一句话描述这个类的作用)
 * @date 2019/2/19 11:22
 */
public interface IOrderService extends BaseService<Order> {

    /**
     * 派单
     *
     * @param order_no
     * @param emp_nos
     * @return
     */
    int dispatchOrder(String order_no, String[] emp_nos);
}
