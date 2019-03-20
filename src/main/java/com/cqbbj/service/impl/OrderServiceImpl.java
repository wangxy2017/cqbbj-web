package com.cqbbj.service.impl;

import com.cqbbj.core.base.PageModel;
import com.cqbbj.core.util.SmsUtils;
import com.cqbbj.dao.*;
import com.cqbbj.entity.*;
import com.cqbbj.service.IEmployeeService;
import com.cqbbj.service.IMessageLogService;
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
    /**
     * 短信日志Mapper
     */
    @Autowired
    private MessageLogMapper messageLogMapper;

    @Override
    public int saveEntity(Order order) {
        // 设置默认值
        if (order.getCreateTime() == null) order.setCreateTime(new Date());
        if (order.getDeleteStatus() == null) order.setDeleteStatus(0);
        if (order.getIs_clean() == null) order.setIs_clean(0);
        if (order.getPayState() == null) order.setPayState(0);
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
        return orderMapper.queryList(order);
    }

    @Override
    public void updateOrderStatus(Integer id, Integer status) {
        Map map = new HashMap();
        map.put("id", id);
        map.put("status", status);
        orderMapper.updateOrderStatus(map);
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
            if (!list.isEmpty()) {
                sendOrderMapper.saveBatch(list);
            }
            // 更改订单状态
            order1.setStatus(1);
            orderMapper.update(order1);
            // 发送短信
            CompanyInfo companyInfo = companyInfoMapper.queryById(1);
            if (companyInfo != null && companyInfo.getMsg_open() == 0) {
                Set<String> phones = new HashSet();
                for (SendOrder so : list) {
                    Employee employee = new Employee();
                    employee.setEmp_no(so.getEmp_no());
                    employee = employeeMapper.queryByProperties(employee);
                    if (employee != null)
                        phones.add(employee.getPhone());
                }
                String content = "师傅您好，您有新的派单消息，请前往微信公众号查看";
                SmsUtils.config(companyInfo.getMsg_username(), companyInfo.getMsg_password(), companyInfo.getMsg_sign(), companyInfo.getMsg_domain());
                SmsUtils.sendSmsBatch(phones, content);
                // 记录短信日志
                MessageLog mlog = null;
                for (String phone : phones) {
                    mlog.setCreateTime(new Date());
                    mlog.setDeleteStatus(0);
                    mlog.setPhone(phone);
                    mlog.setContent(content);
                    messageLogMapper.save(mlog);
                }
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

    @Override
    public PageModel<Order> queryFinanceOrder(Order order, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Order> list = orderMapper.queryFinanceOrder(order);
        PageInfo<Order> pageInfo = new PageInfo<>(list);
        return new PageModel(pageInfo);
    }

    @Override
    public Order queryByProperties(Order order) {
        return orderMapper.queryByProperties(order);
    }
}
