package com.cqbbj.controller;

import com.cqbbj.core.base.BaseController;
import com.cqbbj.core.base.PageModel;
import com.cqbbj.core.base.Result;
import com.cqbbj.core.util.ResultUtils;
import com.cqbbj.entity.OperationLog;
import com.cqbbj.entity.Salary;
import com.cqbbj.service.IOperationLogService;
import com.cqbbj.service.ISalaryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/salary")
public class SalaryController extends BaseController {

    @Autowired
    private ISalaryService salaryService;

    @Autowired
    private IOperationLogService operationLogService;

    /**
     * 进入工资管理页面
     *
     * @return
     */
    @RequestMapping("/salary")
    public String salary() {
        return "/salary/salary";
    }

    /**
     * 进入新增核算页面
     *
     * @return
     */
    @RequestMapping("/addSalary")
    public String salaryAdd() {
        return "/salary/salaryAdd";
    }

    /**
     * 跳转修改核算页面
     *
     * @return
     */
    @RequestMapping("/updateSalary")
    public String updateSalary() {
        return "/salary/salaryUpdate";
    }

    /**
     * 保存salary
     */
    @RequestMapping("/save")
    @ResponseBody
    public Result save(HttpServletRequest request, Salary salary) {
        salaryService.saveEntity(salary);
        // 记录日志
        OperationLog log = createPCLog(request, "新增员工工资核算" + salary.getSalary_no());
        operationLogService.saveEntity(log);
        return ResultUtils.success();
    }

    /**
     * 更新工资
     *
     * @param salary
     * @return
     */
    @RequestMapping("/update")
    @ResponseBody
    public Result update(HttpServletRequest request, Salary salary) {
        salaryService.updateEntity(salary);
        // 记录日志
        OperationLog log = createPCLog(request, "修改员工工资核算" + salary.getSalary_no());
        operationLogService.saveEntity(log);
        return ResultUtils.success();
    }

    /**
     * 查询工资详细信息
     *
     * @param salary
     * @param pageNum
     * @param pageSize
     * @return
     */
    @RequestMapping("/queryPageList")
    @ResponseBody
    public Result queryPageList(Salary salary, int pageNum, int pageSize) {
        PageModel<Salary> pagemodel = salaryService.queryPageList(salary, pageNum, pageSize);
        return ResultUtils.success(pagemodel);
    }

    /**
     * 根据ID查询
     *
     * @param id
     * @return
     */
    @RequestMapping("/queryById")
    @ResponseBody
    public Result queryById(Integer id) {
        Salary salary = salaryService.queryById(id);
        return ResultUtils.success(salary);
    }

    /**
     * 删除核算
     *
     * @param id
     * @return
     */
    @RequestMapping("/delete")
    @ResponseBody
    public Result delete(HttpServletRequest request, Integer id) {
        Salary salary = salaryService.queryById(id);
        if (salary != null) {
            salaryService.deleteEntity(id);
            // 记录日志
            OperationLog log = createPCLog(request, "删除员工【" + salary.getEmp_name() + "】工资核算");
            operationLogService.saveEntity(log);
            return ResultUtils.success();
        }
        return ResultUtils.error();
    }
}
