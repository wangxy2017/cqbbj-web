package com.cqbbj.controller;

import com.cqbbj.core.base.BaseController;
import com.cqbbj.core.base.PageModel;
import com.cqbbj.core.base.Result;
import com.cqbbj.core.util.DateUtils;
import com.cqbbj.core.util.ExcelUtils;
import com.cqbbj.core.util.ResultUtils;
import com.cqbbj.entity.*;
import com.cqbbj.service.IOperationLogService;
import com.cqbbj.service.IOrderService;
import com.cqbbj.service.ISendOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

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

    /**
     * 导出excel
     *
     * @param request
     * @param response
     * @param order
     * @throws Exception
     */
    @RequestMapping("/download")
    public void download(HttpServletRequest request, HttpServletResponse response, Order order) throws Exception {
        PageModel<Order> pageModel = orderService.queryFinanceOrder(order, 0, 1000);
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
        String fileName = "财务结算.xls";
        String sheetName = "财务结算";
        String[] title = new String[]{"订单号", "客户名称", "搬出地址", "搬入地址"
                , "完成时间", "订单价格", "实际收款", "支出费用", "收款员", "司机", "搬运工", "空调工"};
        String[][] values = new String[list.size()][12];
        int i = 0;
        for (Order o : list) {
            values[i][0] = o.getOrder_no();
            values[i][1] = o.getName();
            values[i][2] = o.getStart();
            values[i][3] = o.getEnd();
            values[i][4] = DateUtils.formatDateTime(o.getEndTime());
            values[i][5] = String.valueOf(o.getPrice());
            values[i][6] = String.valueOf(o.getIs_clean() == 0 ? "未结算" : o.getReceiveMoney());
            values[i][7] = String.valueOf(o.getCostMoney());
            values[i][8] = o.getMoneyEmpsInfo();
            values[i][9] = o.getDriveEmpsInfo();
            values[i][10] = o.getMoveEmpsInfo();
            values[i][11] = o.getAirEmpsInfo();
            i++;
        }
        // 记录日志
        OperationLog log = createLog(request, "导出财务结算");
        operationLogService.saveEntity(log);
        ExcelUtils.downloadExcel(fileName, sheetName, title, values, response);
    }
}
