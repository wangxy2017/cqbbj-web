package com.cqbbj.wx;

import com.cqbbj.core.base.BaseController;
import com.cqbbj.core.base.Result;
import com.cqbbj.core.util.ResultUtils;
import com.cqbbj.entity.Order;
import com.cqbbj.service.IOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/wx/order")
public class WXOrderControll extends BaseController {

    @Autowired
    private IOrderService orderService;

    @RequestMapping("/addOrder")
    public Result addOrder(Order order){
        orderService.saveEntity(order);
        return ResultUtils.success();
    }
}
