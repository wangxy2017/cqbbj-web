package com.cqbbj.wx;

import com.cqbbj.core.base.BaseController;
import com.cqbbj.core.base.PageModel;
import com.cqbbj.core.base.Result;
import com.cqbbj.core.util.ResultUtils;
import com.cqbbj.entity.Customer;
import com.cqbbj.entity.Order;
import com.cqbbj.service.ICustomerService;
import com.cqbbj.service.IOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/wx/customer")
public class WXCustomerController extends BaseController {

    @Autowired
    private ICustomerService customerService;
    @Autowired
    private IOrderService orderService;
    /**
     * 会员中心跳转
     *
     * @return
     */
    @RequestMapping("/customer")
    public String customer() {
        return "wx/customer/customer";
    }

    /**
     *跳转至未付款订单页面
     */
    @RequestMapping("/nonPeyMent")
    public String nonPeyMent(){
        return "wx/customer/nonPeyMent";
    }
    /**
     *跳转至已付款订单页面
     */
    @RequestMapping("/hasPayMent")
    public String customerOrder(){
        return "wx/customer/hasPayMent";
    }

    /**
     * 会员信息查询
     * @param customer
     * @return
     */
    @RequestMapping("/queryByProperties")
    @ResponseBody
    public Result  queryByProperties(Customer customer ){
        Customer customer1=customerService.queryByProperties(customer);
        return ResultUtils.success(customer1);
    }

    /**
     * 会员订单信息
     * @param order
     * @param pageNum
     * @param pageSize
     * @return
     */
    @RequestMapping("/queryPageListCustomer")
    @ResponseBody
    public Result queryPageListCustomer(Order order, int pageNum, int pageSize) {
        PageModel<Order> orderPageModel = orderService.queryPageList(order, pageNum, pageSize);
        return ResultUtils.success(orderPageModel);
    }


    /**
     * 退出登录
     */

}
