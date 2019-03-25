package com.cqbbj.service.impl;

import com.cqbbj.core.base.PageModel;
import com.cqbbj.dao.IntentionOrderMapper;
import com.cqbbj.entity.IntentionOrder;
import com.cqbbj.service.IIntentionOrderService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author wangxy
 * @version 1.0
 * @ClassName: IntentionOrderServiceImpl
 * @Description: 意向订单业务层实现(这里用一句话描述这个类的作用)
 * @date 2019/3/10 17:24
 */
@Service
public class IntentionOrderServiceImpl implements IIntentionOrderService {

    /**
     * 意向订单Mapper
     */
    @Autowired
    private IntentionOrderMapper intentionOrderMapper;

    @Override
    public int saveEntity(IntentionOrder intentionOrder) {
        return intentionOrderMapper.save(intentionOrder);
    }

    @Override
    public int updateEntity(IntentionOrder intentionOrder) {
        return intentionOrderMapper.update(intentionOrder);
    }

    @Override
    public void deleteEntity(Integer id) {
        intentionOrderMapper.delete(id);
    }

    @Override
    public void deleteEntityActive(Integer id) {

    }

    @Override
    public List<IntentionOrder> queryList(IntentionOrder intentionOrder) {
        return null;
    }

    @Override
    public PageModel<IntentionOrder> queryPageList(IntentionOrder intentionOrder, int pageNum, int pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<IntentionOrder> list = intentionOrderMapper.queryList(intentionOrder);
        PageInfo<IntentionOrder> pageInfo = new PageInfo<>(list);
        return new PageModel(pageInfo);
    }

    @Override
    public IntentionOrder queryById(Integer id) {
        return intentionOrderMapper.queryById(id);
    }

    @Override
    public IntentionOrder queryByProperties(IntentionOrder intentionOrder) {
        return null;
    }
}
