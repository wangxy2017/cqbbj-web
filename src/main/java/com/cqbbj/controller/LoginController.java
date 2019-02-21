/**
 * @Description: 登录接口(用一句话描述该文件做什么)
 * @author wangxy
 * @date 2019/1/27 16:44
 * @version V1.0
 */
package com.cqbbj.controller;


import com.cqbbj.core.base.BaseController;
import com.cqbbj.core.base.Result;
import com.cqbbj.core.util.MD5Utils;
import com.cqbbj.core.util.ResultUtils;
import com.cqbbj.entity.Employee;
import com.cqbbj.service.IEmployeeService;
import com.cqbbj.service.IOperationLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class LoginController extends BaseController {

    @Autowired
    private IEmployeeService employeeService;// 员工业务层

    @Autowired
    private IOperationLogService operationLogService;// 操作日志

    /**
     * 跳转登录界面
     *
     * @return
     */
    @RequestMapping("/login")
    public String login() {
        return "login";
    }

    /**
     * 退出系统
     *
     * @param request
     * @return
     */
    @RequestMapping("/doLogout")
    @ResponseBody
    public Result doLogout(HttpServletRequest request) {
        log.debug("退出系统");
        // 从session上移除
        HttpSession session = request.getSession();
        session.removeAttribute("loginUser");
        return ResultUtils.success();
    }

    /**
     * 登录系统
     *
     * @param request
     * @param account
     * @param password
     * @return
     */
    @RequestMapping("/doLogin")
    @ResponseBody
    public Result doLogin(HttpServletRequest request, String account, String password) {
        log.debug("登录系统");
        List<Employee> list = employeeService.queryByAccount(account);
        if (list.size() == 0) {
            return ResultUtils.error(-1, "没有该账号");
        } else if (list.size() > 1) {
            return ResultUtils.error(-1, "数据异常");
        } else if (list.size() == 1 && list.get(0).getIs_disabled() == 1) {
            return ResultUtils.error(-1, "账户已被禁用");
        } else if (list.size() == 1 && !list.get(0).getPassword().equals(MD5Utils.MD5Encode(password))) {
            return ResultUtils.error(-1, "账户名或密码错误");
        } else {
            // 将登录信息存入session
            HttpSession session = getSession(request);
            session.setAttribute("loginUser", list.get(0));
            // 记录操作日志
            operationLogService.saveEntity(createLog(request, "登录系统"));
        }
        return ResultUtils.success();
    }
}
