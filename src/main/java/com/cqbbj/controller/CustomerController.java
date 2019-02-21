package com.cqbbj.controller;

import com.cqbbj.core.base.BaseController;
import com.cqbbj.core.base.PageModel;
import com.cqbbj.core.base.Result;
import com.cqbbj.core.util.ResultUtils;
import com.cqbbj.entity.Customer;
import com.cqbbj.service.ICustomerService;
import com.cqbbj.service.IOperationLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

/**
 * @author wangxy
 * @version 1.0
 * @ClassName: CustomerController
 * @Description: 客户控制层(这里用一句话描述这个类的作用)
 * @date 2019/2/21 15:50
 */
@Controller
@RequestMapping("/customer")
public class CustomerController extends BaseController {

    @Autowired
    private ICustomerService customerService;// 客户业务
    @Autowired
    private IOperationLogService operationLogService;// 操作日志

    /**
     * 修改客户
     *
     * @param customer
     * @return
     */
    @RequestMapping("/update")
    @ResponseBody
    public Result update(HttpServletRequest request, Customer customer) {
        customerService.updateEntity(customer);
        // 记录日志
        operationLogService.saveEntity(
                createLog(request, "修改客户【" + customer.getName() + "】信息"));
        return ResultUtils.success();
    }

    /**
     * 分页查询
     *
     * @param customer
     * @param pageNum
     * @param pageSize
     * @return
     */
    @RequestMapping("/queryPageList")
    @ResponseBody
    public Result queryPageList(Customer customer, Integer pageNum, Integer pageSize) {
        PageModel<Customer> pageModel = customerService.queryPageList(customer, pageNum, pageSize);
        return ResultUtils.success(pageModel);
    }

    /**
     * 逻辑删除客户
     *
     * @param id
     * @return
     */
    @RequestMapping("/deleteActive")
    @ResponseBody
    public Result deleteActive(HttpServletRequest request, Integer id) {
        customerService.deleteEntityActive(id);
        // 记录日志
        operationLogService.saveEntity(
                createLog(request, "删除客户"));
        return ResultUtils.success();
    }
}
