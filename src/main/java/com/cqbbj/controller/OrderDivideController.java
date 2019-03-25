package com.cqbbj.controller;

import com.cqbbj.core.base.BaseController;
import com.cqbbj.core.base.PageModel;
import com.cqbbj.core.base.Result;
import com.cqbbj.core.util.ResultUtils;
import com.cqbbj.entity.OrderDivide;
import com.cqbbj.service.IOrderDivideService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;

@RequestMapping("/orderDivide")
@Controller
public class OrderDivideController extends BaseController {

    @Autowired
    private IOrderDivideService orderDivideService;// 订单提成


    /**
     * 订单提成页面跳转
     *
     * @return
     */
    @RequestMapping("/orderDivide")
    public String orderDivide() {
        return "salary/orderDivide";
    }

    /**
     * 订单提成分页查询
     *
     * @param pageNum
     * @param pageSize
     * @return
     */
    @RequestMapping("/queryPageList")
    @ResponseBody
    public Result queryPageList(OrderDivide orderDivide, Integer position_id, String name, Date startTime, Date endTime, int pageNum, int pageSize) {
        PageModel<OrderDivide> pageModel = orderDivideService.queryPageList(orderDivide, position_id, name, startTime, endTime, pageNum, pageSize);
        return ResultUtils.success(pageModel);
    }
}
