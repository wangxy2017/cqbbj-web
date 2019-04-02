package com.cqbbj.wx;

import com.cqbbj.core.base.Result;
import com.cqbbj.core.util.ResultUtils;
import com.cqbbj.entity.Employee;
import com.cqbbj.service.IEmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/wx/employee")
public class WXEmployeeController {
    @Autowired
    private IEmployeeService employeeService;// 员工业务


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

        List<Employee> list = employeeService.queryList(Employee);
        return ResultUtils.success(list);
    }


}
