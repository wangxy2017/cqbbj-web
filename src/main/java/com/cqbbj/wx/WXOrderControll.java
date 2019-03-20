package com.cqbbj.wx;

import com.cqbbj.core.base.BaseController;
import com.cqbbj.core.base.PageModel;
import com.cqbbj.core.base.Result;
import com.cqbbj.core.util.*;
import com.cqbbj.entity.*;
import com.cqbbj.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/wx/order")
public class WXOrderControll extends BaseController {

    @Autowired
    private IOrderService orderService;
    @Autowired
    private IOperationLogService operationLogService;
    @Autowired
    private ISendOrderService sendOrderService;
    @Autowired
    private ICustomerService customerService;
    @Autowired
    private ICompanyInfoService companyInfoService;
    @Autowired
    private IMessageLogService messageLogService;

    /**
     * 进入添加订单页面
     */
    @RequestMapping("/OrderAdd")
    public String OrderAdd() {
        return "wx/order/orderAdd";
    }

    /**
     * 进入已派订单页面
     */
    @RequestMapping("/sentOrder")
    public String sentOrder() {
        return "wx/order/sentOrder";
    }

    /**
     * 进入订单详情页面
     */
    @RequestMapping("/orderSearch")
    public String orderSearch() {
        return "wx/order/orderSearch";
    }

    /**
     * 进入查询订单页面
     */
    @RequestMapping("/orderDetail")
    public String orderDetail() {
        return "wx/order/orderDetail";
    }

    /**
     * 进入未派订单页面
     */
    @RequestMapping("/unSentOrder")
    public String unSentOrder() {
        return "wx/order/unSentOrder";
    }

    /**
     * 进入派单页面
     */
    @RequestMapping("/dispatch")
    public String dispatch() {
        return "wx/order/dispatch";
    }

    /**
     * 进入修改订单页面
     */
    @RequestMapping("/orderUpdate")
    public String orderUpdate() {
        return "wx/order/orderUpdate";
    }

    /**
     * 进入修改订单页面
     */
    @RequestMapping("/finishOrder")
    public String finishOrder() {
        return "wx/order/finishOrder";
    }

    /**
     * 添加订单
     *
     * @param
     * @return
     */
    @RequestMapping("/addOrder")
    @ResponseBody
    public Result addOrder(String name, String phone, String start, String end, Double price, Date beginTime,
                           String content, Integer type, Integer isNotice, HttpServletRequest request) {

        Customer customer = new Customer();
        customer.setName(name);
        customer.setPhone(phone);
        customerService.saveEntity(customer);


        Order order = new Order();
        order.setName(name);
        order.setPhone(phone);
        order.setStart(start);
        order.setEnd(end);
        order.setPrice(price);
        order.setBeginTime(beginTime);
        //System.out.println(beginTime);
        order.setContent(content);
        order.setType(type);


        order.setOrder_no(CommUtils.getCode(ConstantUtils.ORDER));
        order.setCust_no(customerService.queryByPhone(phone).getCust_no());
        order.setStatus(0);
        order.setSource(1);
        orderService.saveEntity(order);

        operationLogService.saveEntity(createLog(request, "新增订单：" + order.getOrder_no()));
        if (isNotice != null && isNotice == 1) {
            log.debug("发送短信");
            CompanyInfo companyInfo = companyInfoService.queryById(1);
            SmsUtils.config(companyInfo.getMsg_username(), companyInfo.getMsg_password(), companyInfo.getMsg_sign(), companyInfo.getMsg_domain());
            SmsUtils.sendSms(order.getPhone(), "您好，您的订单" + order.getOrder_no() + "已生效，可前往[微信公众号-会员中心-我的订单]查看");
            // 记录日志
            MessageLog mlog = new MessageLog();
            mlog.setPhone(order.getPhone());
            mlog.setContent("您好，您的订单" + order.getOrder_no() + "已生效，可前往[微信公众号-会员中心-我的订单]查看");
            messageLogService.saveEntity(mlog);
        }

        return ResultUtils.success();
    }


    /**
     * 查询订单列表
     */
    @RequestMapping("/queryPageListEmployee")
    @ResponseBody
    public Result queryPageList(HttpServletRequest request, Order order, int pageNum, int pageSize) {

        Employee empUser = EmployeeUtils.getEmployee();
        order.setEmp_no(empUser.getEmp_no());
        System.out.println("##########" + empUser.getEmp_no());

//            order.setEmp_no(getWXEmpUser(request).getEmp_no());

        PageModel<Order> orderPageModel = orderService.queryPageList(order, pageNum, pageSize);

        return ResultUtils.success(orderPageModel);
    }


    /**
     * 根据ID查找订单
     *
     * @param id
     * @return
     */
    @RequestMapping("/queryById")
    @ResponseBody
    public Result queryById(Integer id) {
        Order order = orderService.queryById(id);
        if (order.getStatus() == 1 || order.getStatus() == 2) {
            List<SendOrder> list = sendOrderService.queryByOrderNo(order.getOrder_no());
            List<SendOrder> moneyEmps = new ArrayList<SendOrder>();
            List<SendOrder> driveEmps = new ArrayList<SendOrder>();
            List<SendOrder> moveEmps = new ArrayList<SendOrder>();
            List<SendOrder> airEmps = new ArrayList<SendOrder>();
            for (SendOrder sendOrder : list) {
                switch (sendOrder.getType()) {
                    case 0:
                        moneyEmps.add(sendOrder);
                        break;
                    case 1:
                        driveEmps.add(sendOrder);
                        break;
                    case 2:
                        moveEmps.add(sendOrder);
                        break;
                    case 3:
                        airEmps.add(sendOrder);
                        break;
                    default:
                        break;
                }
            }
            order.setMoneyEmps(moneyEmps);
            order.setDriveEmps(driveEmps);
            order.setMoveEmps(moveEmps);
            order.setAirEmps(airEmps);
        }
        return ResultUtils.success(order);
    }

    /**
     * 变更订单状态
     */
    @RequestMapping("/finishOrderStatus")
    public Result finishOrderStatus(Integer id, Integer status) {
        orderService.updateOrderStatus(id, status);
        return ResultUtils.success();

    }

    /**
     * 取消订单状态
     */
    @RequestMapping("/cancelOrderStatus")
    public Result cancelOrderStatus(Integer id, Integer status, String order_no) {
        orderService.updateOrderStatus(id, status);
        sendOrderService.deleteSendOrder(order_no);
        return ResultUtils.success();

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
                CommUtils.toStringArray(moneyEmps.replaceAll(" ",",")),
                CommUtils.toStringArray(driveEmps.replaceAll(" ",",")),
                CommUtils.toStringArray(moveEmps.replaceAll(" ",",")),
                CommUtils.toStringArray(airEmps.replaceAll(" ",",")));
        // 记录日志
        operationLogService.saveEntity(createLog(request, EmployeeUtils.getEmployee().getName(),"派单：" + order_no));
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
     * 查询订单
     */
    @RequestMapping("/search")
    @ResponseBody
    public Result search(Order order) {
        Order o = orderService.queryByProperties(order);
        return ResultUtils.success(o);
    }

    /**
     * 登出
     */
    @RequestMapping("/loginOut")
    @ResponseBody
    public Result loginOut() {
        EmployeeUtils.setEmployee(null);
        return ResultUtils.success();
    }
}
