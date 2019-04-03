package com.cqbbj.wx;

import com.cqbbj.core.base.BaseController;
import com.cqbbj.core.base.PageModel;
import com.cqbbj.core.base.Result;
import com.cqbbj.core.util.ResultUtils;
import com.cqbbj.entity.Employee;
import com.cqbbj.entity.MoneyDetail;
import com.cqbbj.entity.OrderDivide;
import com.cqbbj.service.IMoneyDetailService;
import com.cqbbj.service.IOrderDivideService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/wx/wallet")
public class WXMoneyDatailController extends BaseController {

    @Autowired
    private IMoneyDetailService moneyDetailService;

    @Autowired
    private IOrderDivideService orderDivideService;

    /**
     * 进入我的钱包
     *
     * @return
     */
    @RequestMapping("/wallet")
    public String myWallet() {
        return "/wx/finance/wallet";
    }


    @RequestMapping("/queryResult")
    @ResponseBody
    public Result queryResult(HttpServletRequest request) throws Exception {
        Employee e = getWXEmpUser(request);
        return ResultUtils.success(e);
    }

    @RequestMapping("/queryPageList")
    @ResponseBody
    public Result queryPageList(HttpServletRequest request, int pageNum, int pageSize) throws Exception {
        MoneyDetail moneyDetail = new MoneyDetail();
        moneyDetail.setEmp_no(getWXEmpUser(request).getEmp_no());
        PageModel<MoneyDetail> pageModel = moneyDetailService.queryPageList(moneyDetail, pageNum, pageSize);
        return ResultUtils.success(pageModel);
    }

    /**
     * 查询我的提成
     *
     * @param orderDivide
     * @param pageNum
     * @param pageSize
     * @return
     */
    @RequestMapping("/queryMyDivide")
    @ResponseBody
    public Result queryMyDivide(HttpServletRequest request, OrderDivide orderDivide, Integer pageNum, Integer pageSize) {
        orderDivide.setEmp_no(getLoginUser(request).getEmp_no());
        PageModel<OrderDivide> pageModel = orderDivideService.queryMyDivide(orderDivide, pageNum, pageSize);
        return ResultUtils.success(pageModel);
    }
}
