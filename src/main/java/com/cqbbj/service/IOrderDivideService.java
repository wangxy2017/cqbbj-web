package com.cqbbj.service;

import com.cqbbj.core.base.BaseService;
import com.cqbbj.core.base.PageModel;
import com.cqbbj.entity.OrderDivide;

import java.util.Date;

/**
 * @author wangxy
 * @version 1.0
 * @ClassName: IPayRecordService
 * @Description: 提成业务层接口(这里用一句话描述这个类的作用)
 * @date 2019/2/19 14:02
 */
public interface IOrderDivideService extends BaseService<OrderDivide> {
    PageModel<OrderDivide> queryPageList(OrderDivide orderDivide, Integer position_id, String name, Date startTime, Date endTime, int pageNum, int pageSize);

    /**
     * 查询我的提成
     *
     * @param orderDivide
     * @param pageNum
     * @param pageSize
     * @return
     */
    PageModel<OrderDivide> queryMyDivide(OrderDivide orderDivide, Integer pageNum, Integer pageSize);
}
