package com.cqbbj.controller;

import com.cqbbj.core.base.BaseController;
import com.cqbbj.core.base.PageModel;
import com.cqbbj.core.base.Result;
import com.cqbbj.core.util.ResultUtils;
import com.cqbbj.entity.Employee;
import com.cqbbj.entity.MoneyDetail;
import com.cqbbj.service.IMoneyDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/moneyDetail")
public class MoneyDetailController extends BaseController {

    @Autowired
    private IMoneyDetailService moneyDetailService;

    /**
     * 进入我的钱包
     *
     * @return
     */
    @RequestMapping("/myWallet")
    public String myWallet() {
        return "/moneyDetail/myWallet";
    }

    /**
     * 进入收支明细
     *
     * @return
     */
    @RequestMapping("/moneyDetail")
    public String moneyDetail() {
        return "/moneyDetail/moneyDetail";
    }

    @RequestMapping("/queryResult")
    @ResponseBody
    public Result queryResult(HttpServletRequest request) {
        Employee e = getLoginUser(request);
        return ResultUtils.success(e);
    }

    @RequestMapping("/queryPageList")
    @ResponseBody
    public Result queryPageList(HttpServletRequest request, MoneyDetail moneyDetail, int pageNum, int pageSize) {
        moneyDetail.setEmp_no(getLoginUser(request).getEmp_no());
        PageModel<MoneyDetail> pageModel = moneyDetailService.queryPageList(moneyDetail, pageNum, pageSize);
        return ResultUtils.success(pageModel);
    }

}
