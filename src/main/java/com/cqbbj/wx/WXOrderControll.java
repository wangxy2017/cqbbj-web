package com.cqbbj.wx;

import com.cqbbj.core.base.BaseController;
import com.cqbbj.core.base.PageModel;
import com.cqbbj.core.base.Result;
import com.cqbbj.core.util.*;
import com.cqbbj.entity.Customer;
import com.cqbbj.entity.Employee;
import com.cqbbj.entity.Order;
import com.cqbbj.service.IOperationLogService;
import com.cqbbj.service.IOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import java.util.Date;

@Controller
@RequestMapping("/wx/order")
public class WXOrderControll extends BaseController {

    @Autowired
    private IOrderService orderService;
    @Autowired
    private IOperationLogService operationLogService;

    /**
     * 进入添加订单页面
     */
    @RequestMapping("/toOrderAdd")
    public String toOrderAdd() {
        return "wx/order/orderAdd";
    }

    /**
     * 进入派单页面
     */
    @RequestMapping("/toDispash")
    public String toDispash() {
        return "wx/order/dispash";
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
        Order order = new Order();
        order.setName(name);
        order.setPhone(phone);
        order.setStart(start);
        order.setEnd(end);
        order.setPrice(price);
        order.setBeginTime(beginTime);
        order.setContent(content);
        order.setType(type);


        order.setOrder_no(CommUtils.getCode(ConstantUtils.ORDER));
        order.setCust_no(CustomerUtils.getCust_no());
        order.setStatus(0);
        order.setSource(1);
        orderService.saveEntity(order);

        operationLogService.saveEntity(createLog(request, "新增订单：" + order.getOrder_no()));
        if (isNotice != null && isNotice == 1) {
            log.debug("发送短信");
            SmsUtils.sendSms(order.getPhone(), "您好，您的订单" + order.getOrder_no() + "已生效，可前往[微信公众号-会员中心-我的订单]查看");
        }

        return ResultUtils.success();
    }


    /**
     * 查询订单列表
     */
    @RequestMapping("/queryPageListEmployee")
    @ResponseBody
    public Result queryPageList(HttpServletRequest request,Order order, int pageNum, int pageSize) {

            order.setEmp_no(getWXEmpUser(request).getEmp_no());

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
        return ResultUtils.success(order);
    }
}
