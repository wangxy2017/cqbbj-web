package com.cqbbj.wx;

import com.cqbbj.core.base.BaseController;
import com.cqbbj.core.base.PageModel;
import com.cqbbj.core.base.Result;
import com.cqbbj.core.util.ResultUtils;
import com.cqbbj.entity.OrderDivide;
import com.cqbbj.service.IOrderDivideService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/wx/orderDivide")
public class WXOrderDivideController extends BaseController {

    @Autowired
    private IOrderDivideService orderDivideService;

    @RequestMapping("/orderDivide")
    public String orderDivide(){
        return "wx/finance/dividends";
    }

    /**
     * 查询提成列表
     * @param orderDivide
     * @param pageNum
     * @param pageSize
     * @return
     */
    @RequestMapping("/queryPageList")
    @ResponseBody
    public Result queryPageList(OrderDivide orderDivide,Integer pageNum,Integer pageSize){
       PageModel<OrderDivide> pageModel= orderDivideService.queryPageList(orderDivide,pageNum,pageNum);
       return ResultUtils.success(pageModel);
    }

    /**
     * 查询提成详情
     * @param id
     * @return
     */
    @RequestMapping("/queryById")
    @ResponseBody
    public Result queryById(Integer id){
        OrderDivide orderDivide=orderDivideService.queryById(id);
        return ResultUtils.success(orderDivide);
    }
}
