package com.cqbbj.wx;

import com.cqbbj.core.base.BaseController;
import com.cqbbj.core.base.Result;
import com.cqbbj.core.util.ResultUtils;
import com.cqbbj.service.ISignBillService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/wx/signBill")
public class WXSignBillController extends BaseController {

    @Autowired
    ISignBillService signBillService;

    @RequestMapping("/queryPageList")
    @ResponseBody
    public Result  queryPageList(){

        return ResultUtils.success();
    }


}
