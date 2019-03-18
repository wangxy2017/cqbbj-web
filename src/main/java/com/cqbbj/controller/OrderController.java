package com.cqbbj.controller;

import com.cqbbj.core.base.BaseController;
import com.cqbbj.core.util.ConstantUtils;
import com.cqbbj.core.base.PageModel;
import com.cqbbj.core.base.Result;
import com.cqbbj.core.util.CommUtils;
import com.cqbbj.core.util.ResultUtils;
import com.cqbbj.core.util.SmsUtils;
import com.cqbbj.entity.*;
import com.cqbbj.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

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

    @Autowired
    private IOperationLogService operationLogService;// 操作日志

    @Autowired
    private ICompanyInfoService companyInfoService;// 配置信息
    @Autowired
    private IEmployeeService employeeService;// 员工

    @Autowired
    private ISignBillService signBillService;// 欠条


    /**
     * 订单列表页面跳转
     *
     * @param page 页面控制
     * @return
     */
    @RequestMapping("/orderList")
    public String orderList(String page) {
        // 添加订单
        if ("1".equals(page))
            return "order/orderList_01";
        // 未派订单
        if ("2".equals(page))
            return "order/orderList_02";
        // 已派订单
        if ("3".equals(page))
            return "order/orderList_03";
        // 完成订单
        if ("4".equals(page))
            return "order/orderList_04";
        // 作废订单
        if ("5".equals(page))
            return "order/orderList_05";
        // 订单查询
        if ("6".equals(page))
            return "order/orderList_06";
        return "";
    }

    /**
     * 添加订单界面跳转
     *
     * @return
     */
    @RequestMapping("/orderAdd")
    public String orderAdd() {
        return "order/orderAdd";
    }

    /**
     * 修改订单跳转
     *
     * @return
     */
    @RequestMapping("/orderUpdate")
    public String orderUpdate() {
        return "order/orderUpdate";
    }

    /**
     * 查看订单
     *
     * @return
     */
    @RequestMapping("/orderView")
    public String orderView() {
        return "order/orderView";
    }

    /**
     * 跳转派单界面
     *
     * @return
     */
    @RequestMapping("/dispatch")
    public String dispatch() {
        return "order/dispatch";
    }

    /**
     * 选择员工界面跳转
     *
     * @return
     */
    @RequestMapping("/searchEmpList")
    public String searchEmpList() {
        return "order/searchEmpList";
    }

    /**
     * 新增订单
     *
     * @param order
     * @return
     */
    @RequestMapping("/save")
    @ResponseBody
    public Result save(HttpServletRequest request, Order order, Integer isNotice) throws Exception {
        // 保存用户
        Customer customer = customerService.queryByPhone(order.getPhone());
        if (customer == null) {
            customer = new Customer();
            customer.setName(order.getName());
            customer.setPhone(order.getPhone());
            customer.setCust_no(CommUtils.getCode(ConstantUtils.CUSTOMER));
            customer.setCreateTime(new Date());
            customer.setDeleteStatus(0);
            customerService.saveEntity(customer);
        }
        // 保存订单
        order.setCreateTime(new Date());
        order.setDeleteStatus(0);
        order.setStatus(0);
        order.setOrder_no(CommUtils.getCode(ConstantUtils.ORDER));
        order.setCust_no(customer.getCust_no());
        orderService.saveEntity(order);
        // 记录日志
        operationLogService.saveEntity(createLog(request, "新增订单：" + order.getOrder_no()));
        if (isNotice != null && isNotice == 1) {
            log.debug("发送短信");
            SmsUtils.sendSms(order.getPhone(), "您好，您的订单" + order.getOrder_no() + "已生效，可前往[微信公众号-会员中心-我的订单]查看");
        }
        return ResultUtils.success();
    }

    /**
     * 修改订单
     *
     * @return
     */
    @RequestMapping("/update")
    @ResponseBody
    public Result update(HttpServletRequest request, Order order,
                         String moneyEmps, String driveEmps, String moveEmps,
                         String airEmps) {
        // 更新订单
        orderService.updateEntity(order);
        // 更新派单
        if (moneyEmps != null || driveEmps != null || moneyEmps != null || airEmps != null)
            orderService.dispatchOrder(order.getOrder_no(),
                    CommUtils.toStringArray(moneyEmps),
                    CommUtils.toStringArray(driveEmps),
                    CommUtils.toStringArray(moveEmps),
                    CommUtils.toStringArray(airEmps));
        // 记录日志
        operationLogService.saveEntity(createLog(request, "修改订单：" + order.getOrder_no()));
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
    public Result dispatchOrder(HttpServletRequest request, String order_no,
                                String moneyEmps, String driveEmps, String moveEmps,
                                String airEmps) {
        // 派单
        orderService.dispatchOrder(order_no,
                CommUtils.toStringArray(moneyEmps),
                CommUtils.toStringArray(driveEmps),
                CommUtils.toStringArray(moveEmps),
                CommUtils.toStringArray(airEmps));
        // 记录日志
        operationLogService.saveEntity(createLog(request, "派单：" + order_no));
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

    /**
     * 辅助完成
     *
     * @param request
     * @param order
     * @return
     */
    @RequestMapping("/helpDone")
    @ResponseBody
    public Result helpDone(HttpServletRequest request, Order order, Integer isNotPay) {
        Order order1 = orderService.queryById(order.getId());
        if (order1 != null) {
            // 暂不付款
            if (isNotPay != null && isNotPay == 1) {
                order1.setPayState(0);
                order1.setStatus(2);
                order1.setEndTime(new Date());
                orderService.updateEntity(order1);
                // 生成欠条
                SignBill bill = new SignBill();
                bill.setCreateTime(new Date());
                bill.setDeleteStatus(0);
                bill.setName(order1.getName());
                bill.setPhone(order1.getPhone());
                bill.setStart(order1.getStart());
                bill.setEnd(order1.getEnd());
                bill.setContent(order1.getContent());
                bill.setBeginTime(order1.getBeginTime());
                bill.setPrice(order1.getPrice());
                bill.setEndTime(order1.getEndTime());
                bill.setStatus(0);
                bill.setOrder_no(order1.getOrder_no());
                bill.setCustomer_no(order1.getCust_no());
                bill.setBill_no(CommUtils.getCode(ConstantUtils.SIGN_BILL));
                signBillService.saveEntity(bill);
            } else {
                order1.setReceiveMoney(order.getReceiveMoney());
                order1.setReceiveText(order.getReceiveText());
                order1.setPayState(1);
                order1.setStatus(2);
                order1.setEndTime(new Date());
                orderService.updateEntity(order1);
            }
            // 记录日志
            operationLogService.saveEntity(createLog(request, "辅助完成订单：" + order1.getOrder_no()));
            return ResultUtils.success();
        }
        return ResultUtils.error();
    }

    /**
     * 查询配置信息
     *
     * @return
     */
    @RequestMapping("/queryConfig")
    @ResponseBody
    public Result addInfo() {
        CompanyInfo companyInfo = companyInfoService.queryById(1);
        return ResultUtils.success(companyInfo);
    }


    /**
     * 取消订单
     *
     * @param request
     * @param id
     * @return
     */
    @RequestMapping("/cancel")
    @ResponseBody
    public Result cancel(HttpServletRequest request, Integer id) {
        // 取消订单
        Order order = orderService.queryById(id);
        order.setStatus(3);
        orderService.updateEntity(order);
        // 记录日志
        OperationLog log = createLog(request, "取消订单：" + order.getOrder_no());
        operationLogService.saveEntity(log);
        return ResultUtils.success();
    }

    /**
     * 恢复订单
     *
     * @param request
     * @param id
     * @return
     */
    @RequestMapping("/recover")
    @ResponseBody
    public Result recover(HttpServletRequest request, Integer id) {
        // 恢复订单
        Order order = orderService.queryById(id);
        order.setStatus(0);
        orderService.updateEntity(order);
        // 记录日志
        OperationLog log = createLog(request, "恢复订单：" + order.getOrder_no());
        operationLogService.saveEntity(log);
        return ResultUtils.success();
    }

    /**
     * 根据ID查询
     *
     * @param id
     * @return
     */
    @RequestMapping("/queryById")
    @ResponseBody
    public Result queryById(Integer id) {
        Order order = orderService.queryById(id);
        return ResultUtils.success(order);
    }

    /**
     * 回访
     *
     * @param request
     * @param order
     * @return
     */
    @RequestMapping("/visit")
    @ResponseBody
    public Result visit(HttpServletRequest request, Order order) {
        orderService.updateEntity(order);
        // 记录日志
        OperationLog log = createLog(request, "回访订单：" + order.getOrder_no());
        operationLogService.saveEntity(log);
        return ResultUtils.success();
    }
}
