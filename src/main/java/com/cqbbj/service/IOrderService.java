package com.cqbbj.service;

import com.cqbbj.core.base.BaseService;
import com.cqbbj.core.base.PageModel;
import com.cqbbj.entity.Order;

import java.util.List;

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
     * @param order_no  订单编号
     * @param moneyEmps 收款人员
     * @param driveEmps 随车司机
     * @param moveEmps  搬运工
     * @param airEmps   空调工
     * @return
     */
    int dispatchOrder(String order_no, String[] moneyEmps,
                      String[] driveEmps, String[] moveEmps, String[] airEmps);

    void updateOrderStatus(Integer id, Integer status);

    /**
     * 查询财务账单
     *
     * @param order
     * @param pageNum
     * @param pageSize
     * @return
     */
    PageModel<Order> queryFinanceOrder(Order order, Integer pageNum, Integer pageSize);

}