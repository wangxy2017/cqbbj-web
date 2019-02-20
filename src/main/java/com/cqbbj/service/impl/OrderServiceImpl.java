package com.cqbbj.service.impl;

import com.cqbbj.core.base.PageModel;
import com.cqbbj.dao.OrderMapper;
import com.cqbbj.dao.SendOrderMapper;
import com.cqbbj.entity.Order;
import com.cqbbj.entity.SendOrder;
import com.cqbbj.service.IOrderService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

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

    /**
     * 派单Mapper
     */
    @Autowired
    private SendOrderMapper sendOrderMapper;

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
    public int dispatchOrder(String order_no, String[] moneyEmps,
                             String[] driveEmps, String[] moveEmps, String[] airEmps) {
        // 清空派单记录
        sendOrderMapper.deleteSendOrder(order_no);
        // 保存收款人员
        List<SendOrder> list0 = createSendOrder(order_no, moneyEmps);
        sendOrderMapper.saveBatch(list0);
        // 保存随车司机
        List<SendOrder> list1 = createSendOrder(order_no, driveEmps);
        sendOrderMapper.saveBatch(list1);
        // 保存随车搬运工
        List<SendOrder> list2 = createSendOrder(order_no, moveEmps);
        sendOrderMapper.saveBatch(list2);
        // 保存随车空调工
        List<SendOrder> list3 = createSendOrder(order_no, airEmps);
        sendOrderMapper.saveBatch(list3);
        return 1;
    }

    /**
     * 创建派单
     *
     * @param order_no
     * @param emps
     * @return
     */
    private List<SendOrder> createSendOrder(String order_no, String[] emps) {
        List<SendOrder> list = new ArrayList<>();
        for (int i = 0; i < emps.length; i++) {
            SendOrder so = new SendOrder();
            so.setCreateTime(new Date());
            so.setDeleteStatus(0);
            so.setOrder_no(order_no);
            so.setEmp_no(emps[i]);
            so.setType(0);
            list.add(so);
        }
        return list;
    }
}
