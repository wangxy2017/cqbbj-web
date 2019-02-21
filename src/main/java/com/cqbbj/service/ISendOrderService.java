package com.cqbbj.service;

import com.cqbbj.core.base.BaseService;
import com.cqbbj.entity.SendOrder;

import java.util.List;

/**
 * @author wangxy
 * @version 1.0
 * @ClassName: ISendOrderService
 * @Description: 派单(这里用一句话描述这个类的作用)
 * @date 2019/2/20 20:26
 */
public interface ISendOrderService extends BaseService<SendOrder> {

    /**
     * 根据订单号查询
     *
     * @param order_no
     * @return
     */
    List<SendOrder> queryByOrderNo(String order_no);
}
