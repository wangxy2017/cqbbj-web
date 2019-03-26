package com.cqbbj.dao;

import com.cqbbj.core.base.BaseMapper;
import com.cqbbj.entity.IntentionOrder;
import org.springframework.stereotype.Repository;

import java.util.Map;

/**
 * @author wangxy
 * @version 1.0
 * @ClassName: IntentionOrderMapper
 * @Description: 意向订单Mapper(这里用一句话描述这个类的作用)
 * @date 2019/2/18 11:49
 */
@Repository
public interface IntentionOrderMapper extends BaseMapper<IntentionOrder> {

    /**
     * 意向订单统计
     *
     * @param params
     * @return
     */
    Map<String, Object> queryTotal(Map<String, Object> params);
}
