package com.cqbbj.controller;

import com.cqbbj.core.base.BaseController;
import com.cqbbj.core.base.PageModel;
import com.cqbbj.core.base.Result;
import com.cqbbj.core.util.CommUtils;
import com.cqbbj.core.util.MD5Utils;
import com.cqbbj.core.util.ResultUtils;
import com.cqbbj.entity.Dept;
import com.cqbbj.entity.Employee;
import com.cqbbj.entity.Position;
import com.cqbbj.service.IDeptService;
import com.cqbbj.service.IEmployeeService;

import com.cqbbj.service.IPositionService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.HashMap;

/**
 * @author wangxy
 * @version 1.0
 * @ClassName: EmployeeController
 * @Description: 员工控制器(这里用一句话描述这个类的作用)
 * @date 2019/2/19 14:55
 */
@Controller
@RequestMapping("/employee")
public class EmployeeController extends BaseController {

    @Autowired
    private IEmployeeService employeeService;// 员工业务

    @Autowired
    private IDeptService deptService;// 部门业务

    @Autowired
    private IPositionService positionService;// 职位业务

    /**
     * 员工管理页面跳转
     *
     * @return
     */
    @RequestMapping("/employee")
    public String employee() {
        log.debug("跳转employee页面");
        return "employee/employee";
    }

    /**
     * 添加员工页面跳转
     *
     * @return
     */
    @RequestMapping("/employeeAdd")
    public String employeeAdd() {
        log.debug("跳转employeeAdd页面");
        return "employee/employeeAdd";
    }

    /**
     * 修改员工页面跳转
     *
     * @return
     */
    @RequestMapping("/employeeUpdate")
    public String employeeUpdate() {
        log.debug("跳转employeeUpdate页面");
        return "employee/employeeUpdate";
    }

    /**
     * 新增员工
     *
     * @param employee
     * @return
     */
    @RequestMapping("/save")
    @ResponseBody
    public Result save(Employee employee) {
        employee.setPassword(MD5Utils.MD5Encode(employee.getPassword()));
        employee.setIs_disabled(0);
        employee.setEmp_no(CommUtils.getCode("EP"));
        employee.setMoney(0.00D);
        employee.setCreateTime(new Date());
        employee.setDeleteStatus(0);
        employeeService.saveEntity(employee);
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
    public Result update(Employee employee, String new_password) {
        if (StringUtils.isNoneBlank(new_password))
            employee.setPassword(MD5Utils.MD5Encode(new_password));
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

    /**
     * 查询员工信息
     *
     * @param id
     * @return
     */
    @RequestMapping("/queryById")
    @ResponseBody
    public Result queryById(Integer id) {
        Employee employee = employeeService.queryById(id);
        // 查询部门列表
        List<Dept> depts = deptService.queryList(null);
        // 查询职位列表
        List<Position> positions = positionService.queryList(null);
        Map<String, Object> data = new HashMap<>();
        data.put("employee", employee);
        data.put("depts", depts);
        data.put("positions", positions);
        return ResultUtils.success(data);
    }

    /**
     * 查询添加信息
     *
     * @return
     */
    @RequestMapping("/addInfo")
    @ResponseBody
    public Result addInfo() {
        // 查询部门列表
        List<Dept> depts = deptService.queryList(null);
        // 查询职位列表
        List<Position> positions = positionService.queryList(null);
        Map<String, Object> data = new HashMap<>();
        data.put("depts", depts);
        data.put("positions", positions);
        return ResultUtils.success(data);
    }
}
