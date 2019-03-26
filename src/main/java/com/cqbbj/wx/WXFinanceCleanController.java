package com.cqbbj.wx;

import com.cqbbj.core.base.BaseController;
import com.cqbbj.core.base.PageModel;
import com.cqbbj.core.base.Result;
import com.cqbbj.core.util.ResultUtils;
import com.cqbbj.entity.Order;
import com.cqbbj.entity.SendOrder;
import com.cqbbj.service.IOperationLogService;
import com.cqbbj.service.IOrderService;
import com.cqbbj.service.ISendOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;
@Controller
@RequestMapping("/wx/financeClean")
public class WXFinanceCleanController extends BaseController {



    @Autowired
    private IOrderService orderService;// 订单业务

    @Autowired
    private IOperationLogService operationLogService;// 操作日志
    @Autowired
    private ISendOrderService sendOrderService;// 派单详情

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
        List<Order> list = pageModel.getList();
        // 查询派单信息
        for (Order o : list) {
            List<SendOrder> list1 = sendOrderService.queryByOrderNo(o.getOrder_no());
            // 分配
            o.setMoneyEmps(new ArrayList<>());
            o.setDriveEmps(new ArrayList<>());
            o.setMoveEmps(new ArrayList<>());
            o.setAirEmps(new ArrayList<>());
            for (SendOrder sendOrder : list1) {
                if (sendOrder.getType() == 0) o.getMoneyEmps().add(sendOrder);
                if (sendOrder.getType() == 1) o.getDriveEmps().add(sendOrder);
                if (sendOrder.getType() == 2) o.getMoveEmps().add(sendOrder);
                if (sendOrder.getType() == 3) o.getAirEmps().add(sendOrder);
            }
        }
        return ResultUtils.success(pageModel);
    }
}
