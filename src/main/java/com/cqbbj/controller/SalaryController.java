package com.cqbbj.controller;

import com.cqbbj.core.base.BaseController;
import com.cqbbj.core.base.PageModel;
import com.cqbbj.core.base.Result;
import com.cqbbj.core.util.ResultUtils;
import com.cqbbj.entity.Salary;
import com.cqbbj.service.ISalaryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/salary")
public class SalaryController extends BaseController {

    @Autowired
    private ISalaryService salaryService;

    /**
     * 进入工资管理页面
     * @return
     */
    @RequestMapping("/salary")
    public String salary(){
        return "/salary/salary";
    }

    /**
     * 进入新增核算页面
     * @return
     */
    @RequestMapping("/addSalary")
    public String salaryAdd(){
        return "/salary/salaryAdd";
    }
    /**
     * 保存salary
     */
    @RequestMapping("/save")
    public Result save(Salary salary){
        salaryService.saveEntity(salary);
        return ResultUtils.success();
    }
    /**
     * 查询工资详细信息
     * @param salary
     * @param pageNum
     * @param pageSize
     * @return
     */
    @RequestMapping("/queryPageList")
    @ResponseBody
    public Result  queryPageList(Salary salary,int pageNum, int pageSize ){
        PageModel<Salary> pagemodel =salaryService.queryPageList(salary,pageNum,pageSize);
        return ResultUtils.success(pagemodel);
    }


}
