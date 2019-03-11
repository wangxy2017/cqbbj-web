package com.cqbbj.controller;

import com.cqbbj.core.base.BaseController;
import com.cqbbj.core.base.PageModel;
import com.cqbbj.core.base.Result;
import com.cqbbj.core.util.ResultUtils;
import com.cqbbj.entity.SignBill;
import com.cqbbj.service.ISignBillService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;

@Controller
@RequestMapping("/signBill")
public class SignBillController extends BaseController {
    @Autowired
    ISignBillService signBillService;

    @RequestMapping("/signBill")
    public String signBill() {
        return "salary/signBill";
    }

    @RequestMapping("/queryPageList")
    @ResponseBody
    public Result queryPageList(SignBill signBill, Date startTime, Date finishTime, int pageNum, int pageSize) {

        PageModel<SignBill> pageModel = signBillService.queryPageList(signBill, startTime, finishTime, pageNum, pageSize);

        return ResultUtils.success(pageModel);
    }
}
