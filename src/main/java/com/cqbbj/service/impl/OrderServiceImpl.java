package com.cqbbj.service.impl;

import com.cqbbj.core.base.PageModel;
import com.cqbbj.dao.OrderMapper;
import com.cqbbj.entity.Order;
import com.cqbbj.service.IOrderService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author wangxy
 * @version 1.0
 * @ClassName: OrderServiceImpl
 * @Description: 订单实现(这里用一句话描述这个类的作用)
 * @date 2019/2/19 11:22
 */
@Service
public class OrderServiceImpl implements IOrderService {

    /**
     * 订单Mapper
     */
    @Autowired
    private OrderMapper orderMapper;

    @Override
    public int saveEntity(Order order) {
        return orderMapper.save(order);
    }

    @Override
    public int updateEntity(Order order) {
        return orderMapper.update(order);
    }

    @Override
    public void deleteEntity(Integer id) {
        orderMapper.delete(id);
    }

    @Override
    public void deleteEntityActive(Integer id) {
        orderMapper.deleteActive(id);
    }

    @Override
    public List<Order> queryList(Order order) {
        return null;
    }

    @Override
    public PageModel<Order> queryPageList(Order order, int pageNum, int pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Order> list = orderMapper.queryList(order);
        PageInfo<Order> pageInfo = new PageInfo<>(list);
        return new PageModel(pageInfo);
    }

    @Override
    public Order queryById(Integer id) {
        return orderMapper.queryById(id);
    }

    @Override
    public int dispatchOrder(String order_no, String[] emp_nos) {
        // 清空派单关联
        orderMapper.deleteOrderEmployee(order_no);
        // 插入派单关联
        if(emp_nos != null && emp_nos.length > 0){
            Map<String, Object> params = new HashMap<>();
            params.put("order_no", order_no);
            params.put("emp_nos", emp_nos);
            orderMapper.insertOrderEmployee(params);
        }
        return 1;
    }
}
