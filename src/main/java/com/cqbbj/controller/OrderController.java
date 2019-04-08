package com.cqbbj.controller;

import com.cqbbj.core.base.BaseController;
import com.cqbbj.core.util.*;
import com.cqbbj.core.base.PageModel;
import com.cqbbj.core.base.Result;
import com.cqbbj.entity.*;
import com.cqbbj.service.*;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
    @Autowired
    private IMessageLogService messageLogService;// 短信


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
        order.setSalesman(getLoginUser(request).getEmp_no());
        orderService.saveEntity(order);
        // 记录日志
        operationLogService.saveEntity(createPCLog(request, "新增订单：" + order.getOrder_no()));
        if (isNotice != null && isNotice == 1) {
            CompanyInfo companyInfo = companyInfoService.queryById(1);
            log.debug("发送短信");
            String content = "您好，您的订单" + order.getOrder_no() + "已生效，可前往[微信公众号-会员中心-我的订单]查看";
            SmsUtils.config(companyInfo.getMsg_username(), companyInfo.getMsg_password(), companyInfo.getMsg_sign(), companyInfo.getMsg_domain());
            SmsUtils.sendSms(order.getPhone(), content);
            // 记录短信日志
            MessageLog mLog = new MessageLog();
            mLog.setCreateTime(new Date());
            mLog.setDeleteStatus(0);
            mLog.setPhone(order.getPhone());
            mLog.setContent(content);
            messageLogService.saveEntity(mLog);
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
    public Result update(HttpServletRequest request, Order order) {
        // 更新订单
        orderService.updateEntity(order);
        // 记录日志
        operationLogService.saveEntity(createPCLog(request, "修改订单：" + order.getOrder_no()));
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
        operationLogService.saveEntity(createPCLog(request, "派单：" + order_no));
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
        order.setMoneyEmps(new ArrayList<>());
        order.setDriveEmps(new ArrayList<>());
        order.setMoveEmps(new ArrayList<>());
        order.setAirEmps(new ArrayList<>());
        for (SendOrder so : list) {
            switch (so.getType()) {
                case 0:
                    order.getMoneyEmps().add(so);
                    break;
                case 1:
                    order.getDriveEmps().add(so);
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
            operationLogService.saveEntity(createPCLog(request, "辅助完成订单：" + order1.getOrder_no()));
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
        OperationLog log = createPCLog(request, "取消订单：" + order.getOrder_no());
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
        OperationLog log = createPCLog(request, "恢复订单：" + order.getOrder_no());
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
        OperationLog log = createPCLog(request, "回访订单：" + order.getOrder_no());
        operationLogService.saveEntity(log);
        return ResultUtils.success();
    }

    /**
     * 导出excel
     *
     * @param request
     * @param response
     * @param order
     * @param page
     * @throws Exception
     */
    @RequestMapping("/download")
    public void download(HttpServletRequest request, HttpServletResponse response, Order order, String page) throws Exception {
        String fileName = "";
        String sheetName = "";
        String[] title = null;
        String[][] values = null;
        String content = "导出数据";
        // 打印完成订单
        if ("04".equals(page)) {
            List<Order> orders = orderService.queryList(order);
            fileName = "完成订单.xls";
            sheetName = "完成订单";
            title = new String[]{"订单编号", "客户名称", "客户电话", "搬出地址", "搬入地址", "订单价格", "实际收款", "完成时间", "售后"};
            values = new String[orders.size()][9];
            content = "导出完成订单";
            int i = 0;
            for (Order o : orders) {
                values[i][0] = o.getOrder_no();
                values[i][1] = o.getName();
                values[i][2] = o.getPhone();
                values[i][3] = o.getStart();
                values[i][4] = o.getEnd();
                values[i][5] = String.valueOf(o.getPrice());
                values[i][6] = String.valueOf(o.getReceiveMoney());
                values[i][7] = DateUtils.formatDateTime(o.getEndTime());
                values[i][8] = StringUtils.isBlank(o.getVisit()) ? "未回访" : "已回访";
                i++;
            }
        }
        if ("03".equals(page)) {
            List<Order> orders = orderService.queryList(order);
            fileName = "已派订单.xls";
            sheetName = "已派订单";
            title = new String[]{"订单编号", "客户名称", "客户电话", "搬出地址", "搬入地址", "预约时间"};
            values = new String[orders.size()][6];
            content = "导出已派订单";
            int i = 0;
            for (Order o : orders) {
                values[i][0] = o.getOrder_no();
                values[i][1] = o.getName();
                values[i][2] = o.getPhone();
                values[i][3] = o.getStart();
                values[i][4] = o.getEnd();
                values[i][5] = DateUtils.formatDateTime(o.getBeginTime());
                i++;
            }
        }
        if ("02".equals(page)) {
            List<Order> orders = orderService.queryList(order);
            fileName = "未派订单.xls";
            sheetName = "未派订单";
            title = new String[]{"订单编号", "客户名称", "客户电话", "搬出地址", "搬入地址", "搬运备注", "订单价格", "预约时间"};
            values = new String[orders.size()][8];
            content = "导出未派订单";
            int i = 0;
            for (Order o : orders) {
                values[i][0] = o.getOrder_no();
                values[i][1] = o.getName();
                values[i][2] = o.getPhone();
                values[i][3] = o.getStart();
                values[i][4] = o.getEnd();
                values[i][5] = o.getContent();
                values[i][6] = String.valueOf(o.getPrice());
                values[i][7] = DateUtils.formatDateTime(o.getBeginTime());
                i++;
            }
        }
        if ("01".equals(page)) {
            List<Order> orders = orderService.queryList(order);
            fileName = "订单列表.xls";
            sheetName = "订单列表";
            title = new String[]{"订单编号", "客户名称", "客户电话", "搬出地址", "搬入地址", "搬运备注", "订单价格", "下单时间"};
            values = new String[orders.size()][8];
            content = "导出订单列表";
            int i = 0;
            for (Order o : orders) {
                values[i][0] = o.getOrder_no();
                values[i][1] = o.getName();
                values[i][2] = o.getPhone();
                values[i][3] = o.getStart();
                values[i][4] = o.getEnd();
                values[i][5] = o.getContent();
                values[i][6] = String.valueOf(o.getPrice());
                values[i][7] = DateUtils.formatDateTime(o.getCreateTime());
                i++;
            }
        }
        // 记录日志
        OperationLog log = createPCLog(request, content);
        operationLogService.saveEntity(log);
        ExcelUtils.downloadExcel(fileName, sheetName, title, values, response);
    }
}
