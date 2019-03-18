package com.cqbbj.dao;

import com.cqbbj.core.base.BaseMapper;
import com.cqbbj.entity.Order;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * @author wangxy
 * @version 1.0
 * @ClassName: OrderMapper
 * @Description: 订单Mapper(这里用一句话描述这个类的作用)
 * @date 2019/2/19 10:59
 */
@Repository
public interface OrderMapper extends BaseMapper<Order> {
    int updateOrderStatus(Map map);

    /**
     * 查询财务账单
     *
     * @param order
     * @return
     */
    List<Order> queryFinanceOrder(Order order);

    /**
     * 业绩查询
     *
     * @param order
     * @return
     */
    List<Order> queryWorkList(Order order);
}
