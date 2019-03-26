package com.cqbbj.service;

import com.cqbbj.core.base.BaseService;
import com.cqbbj.entity.IntentionOrder;

import java.util.Map;

/**
 * @author wangxy
 * @version 1.0
 * @ClassName: IIntentionOrderService
 * @Description: 意向订单业务层(这里用一句话描述这个类的作用)
 * @date 2019/3/10 17:24
 */
public interface IIntentionOrderService extends BaseService<IntentionOrder> {

    /**
     * 意向订单统计
     *
     * @param params
     * @return
     */
    Map<String, Object> queryTotal(Map<String, Object> params);
}
