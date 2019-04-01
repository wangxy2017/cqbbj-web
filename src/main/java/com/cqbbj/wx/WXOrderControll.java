package com.cqbbj.wx;

import com.cqbbj.core.base.BaseController;
import com.cqbbj.core.base.PageModel;
import com.cqbbj.core.base.Result;
import com.cqbbj.core.util.*;
import com.cqbbj.entity.*;
import com.cqbbj.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
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
    @Autowired
    private ISignBillService signBillService;
    @Autowired
    private IIntentionOrderService intentionOrderService;
    /**
     * 进入添加订单页面
     */
    @RequestMapping("/orderAdd")
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
     * 进入订单辅助完成页面
     */
    @RequestMapping("/finishOrder")
    public String finishOrder() {
        return "wx/order/orderFinish";
    }

    /**
     * 进入完成订单页面
     */
    @RequestMapping("/completeOrder")
    public String completeOrder() {
        return "wx/order/completeOrder";
    }

    /**
     * 进入完成订单页面
     */
    @RequestMapping("/canceledOrder")
    public String canceledOrder() {

        return "wx/order/canceledOrder";
    }

    /**
     * 进入回访页面
     */
    @RequestMapping("/callback")
    public String callback() {

        return "wx/order/callback";
    }

    /**
     *
     * 进入在线下单页面
     */
    @RequestMapping("/onlineOrder")
    public String onlineOrder() {

        return "wx/order/onlineOrder";
    }

    /**
     * 进入回访页面
     */
    @RequestMapping("/myTask")
    public String myTask() {
        return "wx/myTask/myTask";
    }



    /**
     * 添加意向订单
     *
     * @param
     * @return
     */
    @RequestMapping("/addIntentionOrder")
    @ResponseBody
    public Result addIntentionOrder(String name, String phone, String start, String end ) {

        //添加意向订单
        IntentionOrder order = new IntentionOrder();
        order.setName(name);
        order.setPhone(phone);
        order.setStart(start);
        order.setEnd(end);
        order.setInten_no(CommUtils.getCode(ConstantUtils.INTENTION_ORDER));
        order.setStatus(0);
        intentionOrderService.saveEntity(order);
        return ResultUtils.success();
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
        //添加客户信息
        Customer customer = new Customer();
        customer.setName(name);
        customer.setPhone(phone);
        customer.setCust_no(CommUtils.getCode(ConstantUtils.CUSTOMER));
        customerService.saveEntity(customer);

        //添加订单
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

        operationLogService.saveEntity(createLog(request, name, "新增订单：" + order.getOrder_no()));
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
    public Result queryPageList(Order order, int pageNum, int pageSize) {
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
    @RequestMapping("/updateOrderStatus")
    @ResponseBody
    public Result updateOrderStatus(Integer id, Integer status) {
        orderService.updateOrderStatus(id, status);
        return ResultUtils.success();

    }

    /**
     * 变更订单状态
     */
    @RequestMapping("/finishOrderStatus")
    @ResponseBody
    public Result finishOrderStatus(Order order, Integer status) {
        orderService.updateOrderStatus(order.getId(), status);
        return ResultUtils.success();

    }

    /**
     * 取消订单状态
     */
    @RequestMapping("/cancelOrderStatus")
    @ResponseBody
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
                CommUtils.toStringArray(moneyEmps),
                CommUtils.toStringArray(driveEmps),
                CommUtils.toStringArray(moveEmps),
                CommUtils.toStringArray(airEmps));
        // 记录日志
        operationLogService.saveEntity(createLog(request, EmployeeUtils.getEmployee().getName(), "派单：" + order_no));
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
        operationLogService.saveEntity(createLog(request, EmployeeUtils.getEmployee().getName(), "修改订单：" + order.getOrder_no()));


        return ResultUtils.success();
    }

    /**
     * 查询订单
     */
    @RequestMapping("/search")

    public String search(Order order,Integer pageNum,Integer pageSize, ModelMap map) {
        PageModel<Order> pageModel = orderService.queryPageList(order,pageNum,pageSize);
        map.put("list",pageModel.getList());
        return "wx/order/searchResult.jsp";
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
     * 登出
     */
    @RequestMapping("/loginOut")
    public String loginOut() {
        EmployeeUtils.setEmployee(null);
        return "wx/login";
    }

    /**
     * 查询关键词配置
     *
     * @return
     */
    @RequestMapping("queryKeys")
    @ResponseBody
    public Result queryKeys() {
        CompanyInfo info = companyInfoService.queryById(1);
        return ResultUtils.success(info.getKeyword());
    }
}
