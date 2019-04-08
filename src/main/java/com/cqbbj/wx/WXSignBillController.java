package com.cqbbj.wx;

import com.cqbbj.core.base.BaseController;
import com.cqbbj.core.base.PageModel;
import com.cqbbj.core.base.Result;
import com.cqbbj.core.util.ResultUtils;
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
import java.util.Date;

@Controller
@RequestMapping("/wx/signBill")
public class WXSignBillController extends BaseController {

    @Autowired
    ISignBillService signBillService;

    @Autowired
    private IOrderService orderService;// 订单

    @Autowired
    private IOperationLogService operationLogService;// 操作日志

    @RequestMapping("/signBill")
    public String signBill() {
        return "wx/finance/signBill";
    }

    @RequestMapping("/payment")
    public String payment() {
        return "wx/finance/payment";
    }


    @RequestMapping("/queryPageList")
    @ResponseBody
    public Result queryPageList(SignBill signBill, Date startTime, Date finishTime, int pageNum, int pageSize) {

        PageModel<SignBill> pageModel = signBillService.queryPageList(signBill, startTime, finishTime, pageNum, pageSize);

        return ResultUtils.success(pageModel);
    }

    @RequestMapping("/queryById")
    @ResponseBody
    public Result queryById(Integer id) {

        SignBill signBill = signBillService.queryById(id);

        return ResultUtils.success(signBill);
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
    public Result receive(HttpServletRequest request, SignBill signBill) throws Exception {
        SignBill signBill1 = signBillService.queryById(signBill.getId());
        if (signBill1 != null) {
            // 更新欠条
            signBill1.setReceiveMoney(signBill.getReceiveMoney());
            signBill1.setReceiveText(signBill.getReceiveText());
            signBill1.setEmp_no(getWXEmpUser(request).getEmp_no());
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
            OperationLog log = createWXLog(request, "完成未收款订单收款：" + signBill1.getOrder_no());
            operationLogService.saveEntity(log);
            return ResultUtils.success();
        }
        return ResultUtils.error();
    }


}
