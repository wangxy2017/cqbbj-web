package com.cqbbj.dao;

import com.cqbbj.core.base.BaseMapper;
import com.cqbbj.entity.Order;
import org.springframework.stereotype.Repository;

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
    /**
     * 清除派单关联
     *
     * @param order_no
     */
    void deleteOrderEmployee(String order_no);

    /**
     * 插入派单关联
     *
     * @param params
     * @return
     */
    int insertOrderEmployee(Map<String, Object> params);
}
