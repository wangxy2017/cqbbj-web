package com.cqbbj.controller;

import com.cqbbj.core.base.BaseController;
import com.cqbbj.core.base.PageModel;
import com.cqbbj.core.base.Result;
import com.cqbbj.core.util.DateUtils;
import com.cqbbj.core.util.ExcelUtils;
import com.cqbbj.core.util.ResultUtils;
import com.cqbbj.entity.IntentionOrder;
import com.cqbbj.entity.OperationLog;
import com.cqbbj.entity.Order;
import com.cqbbj.entity.SignBill;
import com.cqbbj.service.IOperationLogService;
import com.cqbbj.service.IOrderService;
import com.cqbbj.service.ISignBillService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/signBill")
public class SignBillController extends BaseController {
    @Autowired
    private ISignBillService signBillService;

    @Autowired
    private IOrderService orderService;// 订单

    @Autowired
    private IOperationLogService operationLogService;// 操作日志

    @RequestMapping("/signBill")
    public String signBill() {
        return "salary/signBill";
    }

    /**
     * 查询签单列表
     *
     * @param signBill
     * @param startTime
     * @param finishTime
     * @param pageNum
     * @param pageSize
     * @return
     */
    @RequestMapping("/queryPageList")
    @ResponseBody
    public Result queryPageList(SignBill signBill, Date startTime, Date finishTime, int pageNum, int pageSize) {

        PageModel<SignBill> pageModel = signBillService.queryPageList(signBill, startTime, finishTime, pageNum, pageSize);

        return ResultUtils.success(pageModel);
    }

    /**
     * 收款
     *
     * @param request
     * @param signBill
     * @return
     */
    @RequestMapping("/receive")
    @ResponseBody
    public Result receive(HttpServletRequest request, SignBill signBill) {
        SignBill signBill1 = signBillService.queryById(signBill.getId());
        if (signBill1 != null) {
            // 更新欠条
            signBill1.setReceiveMoney(signBill.getReceiveMoney());
            signBill1.setReceiveText(signBill.getReceiveText());
            signBill1.setEmp_no(getLoginUser(request).getEmp_no());
            signBill1.setStatus(1);
            signBillService.updateEntity(signBill1);
            // 更新订单
            Order order = new Order();
            order.setOrder_no(signBill1.getOrder_no());
            Order order1 = orderService.queryByProperties(order);
            order1.setReceiveMoney(signBill.getReceiveMoney());
            order1.setReceiveText(signBill1.getReceiveText());
            order1.setEmp_no(signBill1.getEmp_no());
            order1.setPayState(1);
            orderService.updateEntity(order1);
            // 记录日志
            OperationLog log = createPCLog(request, "完成未收款订单收款：" + signBill1.getOrder_no());
            operationLogService.saveEntity(log);
            return ResultUtils.success();
        }
        return ResultUtils.error();
    }

    /**
     * 导出excel
     *
     * @param request
     * @param response
     * @param signBill
     * @param startTime
     * @param finishTime
     * @throws Exception
     */
    @RequestMapping("/download")
    public void download(HttpServletRequest request, HttpServletResponse response, SignBill signBill, Date startTime, Date finishTime) throws Exception {
        PageModel<SignBill> pageModel = signBillService.queryPageList(signBill, startTime, finishTime, 0, 1000);
        List<SignBill> list = pageModel.getList();
        String fileName = signBill.getStatus() == 0 ? "未收款订单.xls" : "已收款订单.xls";
        String sheetName = signBill.getStatus() == 0 ? "未收款订单" : "已收款订单";
        String[] title = new String[]{"订单号", "客户名称", "搬出地址", "搬入地址", "完成时间", "订单价格", "收款状态", "收款金额", "收款人"};
        String[][] values = new String[list.size()][9];
        int i = 0;
        for (SignBill s : list) {
            values[i][0] = s.getOrder_no();
            values[i][1] = s.getName();
            values[i][2] = s.getStart();
            values[i][3] = s.getEnd();
            values[i][4] = DateUtils.formatDateTime(s.getEndTime());
            values[i][5] = String.valueOf(s.getPrice());
            values[i][6] = s.getStatus() == 0 ? "未收款" : "已收款";
            values[i][7] = s.getStatus() == 0 ? "未收款" : String.valueOf(s.getReceiveMoney());
            values[i][8] = s.getStatus() == 0 ? "未收款" : s.getEmp_name();
            i++;
        }
        // 记录日志
        OperationLog log = createPCLog(request, signBill.getStatus() == 0 ? "导出未收款订单" : "导出已收款订单");
        operationLogService.saveEntity(log);
        ExcelUtils.downloadExcel(fileName, sheetName, title, values, response);
    }
}
