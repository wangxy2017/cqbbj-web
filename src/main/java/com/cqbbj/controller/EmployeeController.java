package com.cqbbj.controller;

import com.cqbbj.core.base.PageModel;
import com.cqbbj.core.base.Result;
import com.cqbbj.core.util.CommUtils;
import com.cqbbj.core.util.ResultUtils;
import com.cqbbj.entity.Employee;
import com.cqbbj.service.IEmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author wangxy
 * @version 1.0
 * @ClassName: EmployeeController
 * @Description: 员工控制器(这里用一句话描述这个类的作用)
 * @date 2019/2/19 14:55
 */
@Controller
@RequestMapping("/employee")
public class EmployeeController {

    @Autowired
    private IEmployeeService employeeService;// 员工业务

    /**
     * 新增员工
     *
     * @param employee
     * @return
     */
    @RequestMapping("/save")
    @ResponseBody
    public Result save(Employee employee) {
        employee.setIs_disabled(0);
        employee.setEmp_no(CommUtils.getCode("EP"));
        employee.setMoney(0.00D);
        return ResultUtils.success();
    }

    /**
     * 修改员工
     *
     * @param employee
     * @return
     */
    @RequestMapping("/update")
    @ResponseBody
    public Result update(Employee employee) {
        employeeService.updateEntity(employee);
        return ResultUtils.success();
    }

    /**
     * 逻辑删除员工
     *
     * @param id
     * @return
     */
    @RequestMapping("/deleteActive")
    @ResponseBody
    public Result deleteActive(Integer id) {
        employeeService.deleteEntityActive(id);
        return ResultUtils.success();
    }

    /**
     * 查询员工列表
     *
     * @param Employee
     * @param pageNum
     * @param pageSize
     * @return
     */
    @RequestMapping("/queryPageList")
    @ResponseBody
    public Result queryPageList(Employee Employee, Integer pageNum, Integer pageSize) {
        PageModel<Employee> pageModel = employeeService.queryPageList(Employee, pageNum, pageSize);
        return ResultUtils.success(pageModel);
    }
}
