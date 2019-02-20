package com.cqbbj.dao;

import com.cqbbj.core.base.BaseMapper;
import com.cqbbj.entity.SendOrder;

import java.util.List;

/**
 * @author wangxy
 * @version 1.0
 * @ClassName: SendOrderMapper
 * @Description: 派单Mapper(这里用一句话描述这个类的作用)
 * @date 2019/2/20 20:18
 */
public interface SendOrderMapper extends BaseMapper<SendOrder> {
    /**
     * 批量保存
     *
     * @param list
     * @return
     */
    int saveBatch(List<SendOrder> list);

    /**
     * 清除派单
     *
     * @param order_no
     */
    void deleteSendOrder(String order_no);
}
