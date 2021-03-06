package com.cqbbj.wx;

import com.cqbbj.core.base.BaseController;
import com.cqbbj.core.base.PageModel;
import com.cqbbj.core.base.Result;
import com.cqbbj.core.util.ResultUtils;
import com.cqbbj.entity.Order;
import com.cqbbj.service.IOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/wx/myTask")
public class WXHomeTaskController extends BaseController {

    @Autowired
    private IOrderService orderService;// 订单

    @RequestMapping("/myTask")
    public String myTask() {
        return "wx/myTask/myTask";
    }

    /**
     * 跳转至我的业绩页面
     * @return
     */
    @RequestMapping("/performance")
    public String  performance() {
        return "wx/finance/performance";
    }

    /**
     * 查询我的任务
     *
     * @param
     * @param order
     * @param pageNum
     * @param pageSize
     * @return
     */
    @RequestMapping("/queryTaskList")
    @ResponseBody
    public Result queryTaskList(HttpServletRequest request, Order order, Integer pageNum, Integer pageSize) throws Exception {
        // 查询我的任务
        order.setEmp_no(getWXEmpUser(request).getEmp_no());
        PageModel<Order> pageModel = orderService.queryMyTasks(order, pageNum, pageSize);
        return ResultUtils.success(pageModel);
    }


}
