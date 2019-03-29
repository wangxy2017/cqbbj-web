package com.cqbbj.wx;

import com.cqbbj.core.base.BaseController;
import com.cqbbj.core.base.PageModel;
import com.cqbbj.core.base.Result;
import com.cqbbj.core.util.ResultUtils;
import com.cqbbj.entity.PayRecord;
import com.cqbbj.service.IOperationLogService;
import com.cqbbj.service.IPayRecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;

@Controller
@RequestMapping("/wx/payRecord")
public class WXPayRecordController extends BaseController {

    @Autowired
    private IPayRecordService payRecordService;
    @Autowired
    private IOperationLogService operationLogService;// 操作日志

    @RequestMapping("/payRecord")
    public String payRecord() {
        return "wx/finance/payRecord";
    }

    @RequestMapping("/wallet")
    public String wallet() {

        return "wx/finance/wallet";
    }

    @RequestMapping("/queryPageList")
    @ResponseBody
    public Result queryPageList(PayRecord payRecord, Date startTime, Date endTime, Integer pageNum, Integer pageSize) {
        PageModel<PayRecord> pageModel = payRecordService.queryPageList(payRecord, startTime, endTime, pageNum, pageSize);
        return ResultUtils.success(pageModel);
    }

    @RequestMapping("/queryById")
    @ResponseBody
    public Result queryById(Integer id) {
        PayRecord payRecord = payRecordService.queryById(id);
        return ResultUtils.success(payRecord);
    }
}
