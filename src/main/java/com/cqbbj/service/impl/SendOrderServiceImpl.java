package com.cqbbj.service.impl;

import com.cqbbj.core.base.PageModel;
import com.cqbbj.dao.SendOrderMapper;
import com.cqbbj.entity.SendOrder;
import com.cqbbj.service.ISendOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author wangxy
 * @version 1.0
 * @ClassName: SendOrderServiceImpl
 * @Description: 派单实现(这里用一句话描述这个类的作用)
 * @date 2019/2/20 20:27
 */
@Service
public class SendOrderServiceImpl implements ISendOrderService {

    /**
     * 派单Mapper
     */
    @Autowired
    private SendOrderMapper sendOrderMapper;

    @Override
    public int saveEntity(SendOrder sendOrder) {
        return sendOrderMapper.save(sendOrder);
    }

    @Override
    public int updateEntity(SendOrder sendOrder) {
        return 0;
    }

    @Override
    public void deleteEntity(Integer id) {

    }

    @Override
    public void deleteEntityActive(Integer id) {

    }

    @Override
    public List<SendOrder> queryList(SendOrder sendOrder) {
        return null;
    }

    @Override
    public PageModel<SendOrder> queryPageList(SendOrder sendOrder, int pageNum, int pageSize) {
        return null;
    }

    @Override
    public SendOrder queryById(Integer id) {
        return null;
    }
}
