package com.cqbbj.controller;

import com.cqbbj.core.base.BaseController;
import com.cqbbj.core.base.PageModel;
import com.cqbbj.core.base.Result;
import com.cqbbj.core.util.ResultUtils;
import com.cqbbj.entity.Order;
import com.cqbbj.service.IOperationLogService;
import com.cqbbj.service.IOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author wangxy
 * @version 1.0
 * @ClassName: FinanceCleanController
 * @Description: 车辆控制层(这里用一句话描述这个类的作用)
 * @date 2019/2/21 16:24
 */
@Controller
@RequestMapping("/financeClean")
public class FinanceCleanController extends BaseController {

    @Autowired
    private IOrderService orderService;// 订单业务

    @Autowired
    private IOperationLogService operationLogService;// 操作日志

    /**
     * 财务结算
     *
     * @return
     */
    @RequestMapping("/financeClean")
    public String financeClean() {
        return "finance/financeClean";
    }

    /**
     * 财务结算列表查询
     *
     * @param order
     * @param pageNum
     * @param pageSize
     * @return
     */
    @RequestMapping("/queryPageList")
    @ResponseBody
    public Result queryPageList(Order order, Integer pageNum, Integer pageSize) {
        PageModel<Order> pageModel = orderService.queryFinanceOrder(order, pageNum, pageSize);
        return ResultUtils.success(pageModel);
    }
}
