package com.cqbbj.wx;

import com.cqbbj.core.base.BaseController;
import com.cqbbj.core.base.PageModel;
import com.cqbbj.core.base.Result;
import com.cqbbj.core.util.CommUtils;
import com.cqbbj.core.util.ConstantUtils;
import com.cqbbj.core.util.CustomerUtils;
import com.cqbbj.core.util.ResultUtils;
import com.cqbbj.entity.Customer;
import com.cqbbj.entity.Order;
import com.cqbbj.service.IOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

@Controller
@RequestMapping("/wx/order")
public class WXOrderControll extends BaseController {

    @Autowired
    private IOrderService orderService;

    /**
     * 添加订单
     * @param
     * @return
     */
    @RequestMapping("/addOrder")
    @ResponseBody
    public Result addOrder(String name, String phone, String start, String end, Double price, Date beginTime,
                           String content, Integer type){
        Order order=new Order();
        order.setName(name);
        order.setPhone(phone);
        order.setStart(start);
        order.setEnd(end);
        order.setPrice(price);
        order.setBeginTime(beginTime);
        order.setContent(content);
        order.setType(type);


        order.setOrder_no(CommUtils.getCode(ConstantUtils.ORDER));
        order.setCust_no(CustomerUtils.getCust_no());
        order.setStatus(0);
        order.setSource(1);
        orderService.saveEntity(order);
        return ResultUtils.success();
    }


    /**
     * 查询订单
     */
@RequestMapping("/queryPageList")
    @ResponseBody
public Result queryPageList( Order order,int pageNum,int pageSize) {
    order.setCust_no(CustomerUtils.getCust_no());
    PageModel<Order> orderPageModel = orderService.queryPageList(order,pageNum,pageSize);

return ResultUtils.success(orderPageModel);
}
    /**
     * 根据ID查找订单
     * @param id
     * @return
     */
    @RequestMapping("/queryById")
    @ResponseBody
    public Result queryById(Integer id){
        Order order= orderService.queryById(id);
        return ResultUtils.success(order);
    }
}
