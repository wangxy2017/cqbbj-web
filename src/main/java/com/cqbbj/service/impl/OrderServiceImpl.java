package com.cqbbj.service.impl;

import com.cqbbj.core.base.PageModel;
import com.cqbbj.core.util.SmsUtils;
import com.cqbbj.dao.CompanyInfoMapper;
import com.cqbbj.dao.EmployeeMapper;
import com.cqbbj.dao.OrderMapper;
import com.cqbbj.dao.SendOrderMapper;
import com.cqbbj.entity.CompanyInfo;
import com.cqbbj.entity.Employee;
import com.cqbbj.entity.Order;
import com.cqbbj.entity.SendOrder;
import com.cqbbj.service.IEmployeeService;
import com.cqbbj.service.IOrderService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

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

    /**
     * 系统配置
     */
    @Autowired
    private CompanyInfoMapper companyInfoMapper;

    /**
     * 员工Mapper
     */
    @Autowired
    private EmployeeMapper employeeMapper;

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
        // 查询订单
        Order order = new Order();
        order.setOrder_no(order_no);
        Order order1 = orderMapper.queryByProperties(order);
        if (order1 != null) {
            // 清空派单记录
            sendOrderMapper.deleteSendOrder(order1.getOrder_no());
            // 创建派单记录
            List<SendOrder> list = new ArrayList<>();
            list.addAll(createSendOrder(order1.getOrder_no(), moneyEmps, 0));
            list.addAll(createSendOrder(order1.getOrder_no(), driveEmps, 1));
            list.addAll(createSendOrder(order1.getOrder_no(), moveEmps, 2));
            list.addAll(createSendOrder(order1.getOrder_no(), airEmps, 3));
            // 保存派单记录
            if (!list.isEmpty())
                sendOrderMapper.saveBatch(list);
            // 更改订单状态
            order1.setStatus(1);
            orderMapper.update(order1);
            // 发送短信
            CompanyInfo companyInfo = companyInfoMapper.queryById(1);
            if (companyInfo != null && companyInfo.getMsg_open() == 0) {
                List<String> phones = new ArrayList<>();
                for (SendOrder so : list) {
                    Employee employee = new Employee();
                    employee.setEmp_no(so.getEmp_no());
                    employee = employeeMapper.queryByProperties(employee);
                    if (employee != null)
                        phones.add(employee.getPhone());
                }
                // 去重
                Set set = new HashSet();
                set.addAll(phones);
                SmsUtils.sendSmsBatch(set, "师傅您好，您有新的派单消息，请前往微信公众号查看");
            }
        }
        return 1;
    }

    /**
     * 创建派单
     *
     * @param order_no
     * @param emps
     * @return
     */
    private List<SendOrder> createSendOrder(String order_no, String[] emps, Integer type) {
        List<SendOrder> list = new ArrayList<>();
        for (int i = 0; i < emps.length; i++) {
            SendOrder so = new SendOrder();
            so.setCreateTime(new Date());
            so.setDeleteStatus(0);
            so.setOrder_no(order_no);
            so.setEmp_no(emps[i]);
            so.setType(type);
            list.add(so);
        }
        return list;
    }
}
