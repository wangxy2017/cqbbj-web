package com.cqbbj.controller;

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

/**
 * 支付记录
 */
@Controller
@RequestMapping("/payRecord")
public class PayRecordController extends BaseController {

    @Autowired
    private IPayRecordService payRecordService;
    @Autowired
    private IOperationLogService operationLogService;// 操作日志
    @RequestMapping("/payRecord")
    public String payRecord(){
        return "/salary/payRecord";
    }

    @RequestMapping("/queryPageList")
    @ResponseBody
    public Result queryPageList(PayRecord payRecord, String startTime,String endTime, Integer pageNum, Integer pageSize) {
        PageModel<PayRecord> pageModel = payRecordService.queryPageList(payRecord,startTime,endTime, pageNum, pageSize);
        return ResultUtils.success(pageModel);
    }



}
