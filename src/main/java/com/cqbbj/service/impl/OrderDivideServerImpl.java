package com.cqbbj.service.impl;

import com.cqbbj.core.base.PageModel;
import com.cqbbj.dao.OrderDivideMapper;
import com.cqbbj.entity.OrderDivide;
import com.cqbbj.service.IOrderDivideService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class OrderDivideServerImpl implements IOrderDivideService {

    @Autowired
    private OrderDivideMapper orderDivideMapper;

    @Override
    public PageModel<OrderDivide> queryPageList(OrderDivide orderDivide, Integer position_id, String name, Date startTime, Date endTime, int pageNum, int pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        Map map = new HashMap();
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        map.put("order_no", orderDivide.getOrder_no());
        map.put("position_id", position_id);
        map.put("name", name);
        map.put("startTime", startTime == null ? null : format.format(startTime));
        map.put("endTime", endTime == null ? null : format.format(endTime));
        List<OrderDivide> list = orderDivideMapper.queryList(map);
        PageInfo<OrderDivide> pageInfo = new PageInfo<>(list);
        return new PageModel(pageInfo);
    }

    @Override
    public int saveEntity(OrderDivide orderDivide) {
        return orderDivideMapper.save(orderDivide);
    }

    @Override
    public int updateEntity(OrderDivide orderDivide) {
        return 0;
    }

    @Override
    public void deleteEntity(Integer id) {

    }

    @Override
    public void deleteEntityActive(Integer id) {

    }

    @Override
    public List<OrderDivide> queryList(OrderDivide orderDivide) {
        return null;
    }

    @Override
    public PageModel<OrderDivide> queryPageList(OrderDivide orderDivide, int pageNum, int pageSize) {
        return null;
    }

    @Override
    public OrderDivide queryById(Integer id) {
        return null;
    }

    @Override
    public OrderDivide queryByProperties(OrderDivide orderDivide) {
        return null;
    }

    @Override
    public PageModel<OrderDivide> queryMyDivide(OrderDivide orderDivide, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<OrderDivide> list = orderDivideMapper.queryMyDivide(orderDivide);
        PageInfo<OrderDivide> pageInfo = new PageInfo<>(list);
        return new PageModel(pageInfo);
    }
}
