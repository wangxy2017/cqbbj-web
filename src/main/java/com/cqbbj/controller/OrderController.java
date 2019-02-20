package com.cqbbj.controller;

import com.cqbbj.core.base.PageModel;
import com.cqbbj.core.base.Result;
import com.cqbbj.core.util.CommUtils;
import com.cqbbj.core.util.ResultUtils;
import com.cqbbj.entity.Customer;
import com.cqbbj.entity.Order;
import com.cqbbj.service.ICustomerService;
import com.cqbbj.service.IOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;

/**
 * @author wangxy
 * @version 1.0
 * @ClassName: OrderController
 * @Description: 订单控制层(这里用一句话描述这个类的作用)
 * @date 2019/2/20 15:23
 */
@Controller
@RequestMapping("/order")
public class OrderController {

    @Autowired
    private IOrderService orderService;// 订单业务

    @Autowired
    private ICustomerService customerService;// 客户业务

    /**
     * 新增订单
     *
     * @param order
     * @return
     */
    @RequestMapping("/save")
    @ResponseBody
    public Result save(Order order) {
        // 保存用户
        Customer customer = customerService.queryByPhone(order.getPhone());
        if (customer == null) {
            customer = new Customer();
            customer.setName(order.getName());
            customer.setPhone(order.getPhone());
            customer.setCust_no(CommUtils.getCode("CO"));
            customer.setCreateTime(new Date());
            customer.setDeleteStatus(0);
            customerService.saveEntity(customer);
        }
        // 保存订单
        order.setCreateTime(new Date());
        order.setDeleteStatus(0);
        order.setStatus(0);
        order.setOrder_no(CommUtils.getCode("DT"));
        order.setCust_no(customer.getCust_no());
        orderService.saveEntity(order);

        return ResultUtils.success();
    }

    /**
     * 修改订单
     *
     * @return
     */
    @RequestMapping("/update")
    @ResponseBody
    public Result update(Order order) {
        orderService.updateEntity(order);
        return ResultUtils.success();
    }

    /**
     * 查询订单列表
     *
     * @param order
     * @return
     */
    @RequestMapping("/queryPageList")
    @ResponseBody
    public Result queryPageList(Order order, Integer pageNum, Integer pageSize) {
        PageModel<Order> pageModel = orderService.queryPageList(order, pageNum, pageSize);
        return ResultUtils.success(pageModel);
    }

    /**
     * 派单
     *
     * @param order_no
     * @param emp_nos
     * @return
     */
    @RequestMapping("/dispatchOrder")
    @ResponseBody
    public Result dispatchOrder(String order_no, String emp_nos) {
        orderService.dispatchOrder(order_no, CommUtils.toStringArray(emp_nos));
        return ResultUtils.success();
    }
}
