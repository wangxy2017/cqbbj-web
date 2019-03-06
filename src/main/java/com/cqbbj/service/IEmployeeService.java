package com.cqbbj.service;

import com.cqbbj.core.base.BaseController;
import com.cqbbj.core.base.BaseService;
import com.cqbbj.core.base.PageModel;
import com.cqbbj.core.base.Result;
import com.cqbbj.core.util.ResultUtils;
import com.cqbbj.entity.Employee;
import com.cqbbj.entity.OrderDivide;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.List;

/**
 * @author wangxy
 * @version 1.0
 * @ClassName: IEmployeeService
 * @Description: 员工业务层接口(这里用一句话描述这个类的作用)
 * @date 2019/2/18 17:13
 */
public interface IEmployeeService extends BaseService<Employee> {
    /**
     * 根据账号查询
     *
     * @param account
     * @return
     */
    List<Employee> queryByAccount(String account);

    @Controller
    @RequestMapping("/orderDivide")
    class OrderDivideController extends BaseController {
        @Autowired
        private IOrderDivideService divideService;

        @RequestMapping("/orderDivide")
        public String divide() {
            return "/salary/orderDivide";
        }

        @RequestMapping("/queryPageList")
        @ResponseBody
        public Result queryPageList(OrderDivide orderDivide, Integer position_id, String name, Date startTime, Date endTime, Integer pageNum, Integer pageSize) {

            PageModel<OrderDivide> pageModel = divideService.queryPageList(orderDivide, position_id, name, startTime, endTime, pageNum, pageSize);
            System.out.println(123);
            return ResultUtils.success(pageModel);
        }
    }
}
