package com.cqbbj.controller;

import com.cqbbj.core.base.BaseController;
import com.cqbbj.core.base.PageModel;
import com.cqbbj.core.base.Result;
import com.cqbbj.core.util.CommUtils;
import com.cqbbj.core.util.ResultUtils;
import com.cqbbj.entity.Customer;
import com.cqbbj.entity.Order;
import com.cqbbj.entity.SendOrder;
import com.cqbbj.service.ICustomerService;
import com.cqbbj.service.IOrderService;
import com.cqbbj.service.ISendOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @author wangxy
 * @version 1.0
 * @ClassName: OrderController
 * @Description: 订单控制层(这里用一句话描述这个类的作用)
 * @date 2019/2/20 15:23
 */
@Controller
@RequestMapping("/order")
public class OrderController extends BaseController {

    @Autowired
    private IOrderService orderService;// 订单业务

    @Autowired
    private ICustomerService customerService;// 客户业务

    @Autowired
    private ISendOrderService sendOrderService;// 派单

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
    public Result update(Order order, String moneyEmps, String driveEmps, String moveEmps, String airEmps) {
        // 更新订单
        orderService.updateEntity(order);
        // 更新派单
        if (moneyEmps != null || driveEmps != null || moneyEmps != null || airEmps != null)
            orderService.dispatchOrder(order.getOrder_no(),
                    CommUtils.toStringArray(moneyEmps),
                    CommUtils.toStringArray(driveEmps),
                    CommUtils.toStringArray(moveEmps),
                    CommUtils.toStringArray(airEmps));
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
     * @param order_no  订单编号
     * @param moneyEmps 收款人
     * @param driveEmps 司机
     * @param moveEmps  搬运工
     * @param airEmps   空调工
     * @return
     */
    @RequestMapping("/dispatchOrder")
    @ResponseBody
    public Result dispatchOrder(String order_no, String moneyEmps, String driveEmps, String moveEmps, String airEmps) {
        // 派单
        orderService.dispatchOrder(order_no,
                CommUtils.toStringArray(moneyEmps),
                CommUtils.toStringArray(driveEmps),
                CommUtils.toStringArray(moveEmps),
                CommUtils.toStringArray(airEmps));
        return ResultUtils.success();
    }

    /**
     * 查询订单详情
     *
     * @param id
     * @return
     */
    @RequestMapping("/orderDetail")
    @ResponseBody
    public Result orderDetail(Integer id) {
        Order order = orderService.queryById(id);
        // 查询派单详情
        List<SendOrder> list = sendOrderService.queryByOrderNo(order.getOrder_no());
        // 分类
        order.setMoenyEmps(new ArrayList<>());
        order.setDirveEmps(new ArrayList<>());
        order.setMoveEmps(new ArrayList<>());
        order.setAirEmps(new ArrayList<>());
        for (SendOrder so : list) {
            switch (so.getType()) {
                case 0:
                    order.getMoenyEmps().add(so);
                    break;
                case 1:
                    order.getDirveEmps().add(so);
                    break;
                case 2:
                    order.getMoveEmps().add(so);
                    break;
                case 3:
                    order.getAirEmps().add(so);
                    break;
            }
        }
        return ResultUtils.success(order);
    }
}
