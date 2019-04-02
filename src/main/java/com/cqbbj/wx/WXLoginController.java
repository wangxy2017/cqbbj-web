package com.cqbbj.wx;

import com.cqbbj.core.base.BaseController;
import com.cqbbj.core.base.PageModel;
import com.cqbbj.core.base.Result;
import com.cqbbj.core.base.WXSession;
import com.cqbbj.core.util.*;
import com.cqbbj.entity.Code;
import com.cqbbj.entity.Customer;
import com.cqbbj.entity.Employee;
import com.cqbbj.entity.Order;
import com.cqbbj.service.*;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/wx/login")
public class WXLoginController extends BaseController {


    @Autowired
    private ICodeService codeService;// 验证码业务

    @Autowired
    private ICustomerService customerService;// 用户业务层
    @Autowired
    private IEmployeeService employeeService;// 员工
    @Autowired
    private IOrderService orderService;// 订单

    /**
     * 登录页面跳转
     *
     * @return
     */
    @RequestMapping("/toLogin")
    public String toLogin() {
        return "wx/login";
    }

    /**
     * home页面跳转
     *
     * @return
     */
    @RequestMapping("/toHome")
    public String toHome() {
        return "wx/home";
    }

    /**
     * 手机号注册
     *
     * @param phone
     * @param code
     * @return
     */
    @RequestMapping("/regist")
    @ResponseBody
    public Result regist(String phone, String code, String name) {
        if (StringUtils.isBlank(phone) || StringUtils.isBlank(code)) {
            return ResultUtils.error(-1, "参数错误");
        }
        // 查询验证码
        Code code1 = codeService.queryCodeByPhone(phone);
        if (code1 == null || !code1.getCode().equals(code)) {
            return ResultUtils.error(-1, "验证码错误");
        }
        if (code1 == null || code1.getEndTime().compareTo(new Date()) < 0) {
            return ResultUtils.error(-1, "验证码已过期");
        }
        // 查询用户是否已经注册
        if (customerService.queryByPhone(phone) != null) {
            return ResultUtils.error(-1, "该用户已注册");
        }
        // 验证通过，新增用户
        Customer user = new Customer();
        user.setName(name);
        user.setCreateTime(new Date());
        user.setDeleteStatus(0);
        user.setCust_no(CommUtils.getCode(ConstantUtils.CUSTOMER));
        user.setPhone(phone);
        customerService.saveEntity(user);
        return ResultUtils.success(user.getId());
    }

    /**
     * 获取验证码
     *
     * @param phone
     * @return
     */
    @RequestMapping("/getCode")
    @ResponseBody
    public Result getCode(String phone) {
        if (StringUtils.isBlank(phone)) {
            return ResultUtils.error(-1, "参数异常");
        }
        String newCode = "";
        // 查询有效验证码
        Code code = codeService.queryCodeByPhone(phone);
        if (code == null) {
            newCode = CommUtils.getRandomNumber(6);
            // 存入数据库
            Code code1 = new Code();
            code1.setCreateTime(new Date());
            code1.setDeleteStatus(0);
            code1.setPhone(phone);
            code1.setCode(newCode);
            code1.setEndTime(DateUtils.getAfterDateByMin(30));
            codeService.saveEntity(code1);
        } else {
            newCode = code.getCode();
        }
        // 发送验证码
        log.debug("验证码：" + newCode);
        //System.out.println("验证码是："+newCode);
        //SmsUtils.sendSms(phone,"验证码："+newCode);

        return ResultUtils.success();
    }

    /**
     * 手机号登录
     *
     * @param phone
     * @param code
     * @return
     */
    @RequestMapping("/login")
    @ResponseBody
    public Result login(String phone, String code, HttpServletRequest request) {
        if (StringUtils.isBlank(phone) || StringUtils.isBlank(code)) {
            return ResultUtils.error(-1, "参数错误");
        }
        Code code1 = codeService.queryCodeByPhone(phone);
        if (code1 == null || !code1.getCode().equals(code)) {
            return ResultUtils.error(-1, "验证码错误");
        }
        // 查询用户信息
        Customer user = customerService.queryByPhone(phone);
        request.getSession().setAttribute("customer", user);
        return ResultUtils.success(user);
    }

    /**
     * 查询手机号是否已经注册
     *
     * @param phone
     * @return
     */
    @RequestMapping("/checkPhone")
    @ResponseBody
    public Result checkPhone(String phone) {
        if (customerService.queryByPhone(phone) != null) {
            return ResultUtils.error(-1, "该用户已注册");
        }
        return ResultUtils.success();
    }


    /**
     * 员工登录
     *
     * @param account
     * @param password
     * @return
     */
    @RequestMapping("/empLogin")
    @ResponseBody
    public Result empLogin(String account, String password) {
        // 查询员工
        List<Employee> list = employeeService.queryByAccount(account);
        if (!list.isEmpty() && list.size() == 1) {
            if (list.get(0).getPassword().equals(MD5Utils.MD5Encode(password))) {
                // 做操作
                Employee employee = list.get(0);
                if (employee.getIs_disabled() == 0) {
                    // 存入session
                    WXSession session = WXSessionUtils.getSession(employee.getEmp_no());
                    session.put("wxEmpUser", employee);
                    return ResultUtils.success(employee);
                } else {
                    return ResultUtils.error("账号已被禁用");
                }
            } else {
                return ResultUtils.error(-1, "密码错误");
            }
        } else {
            return ResultUtils.error(-1, "参数错误");
        }

    }

    @RequestMapping("/getEmpName")
    @ResponseBody
    public Result getEmpName(HttpServletRequest request) {
        // 获取当前登录用户
        Employee employee = getWXEmpUser(request);
        if (employee != null) {
            Map<String, Object> data = new HashMap<>();
            // 查询我的任务
            Order order = new Order();
            order.setStatus(1);
            order.setEmp_no(employee.getEmp_no());
            PageModel<Order> pageModel = orderService.queryMyTasks(order, 1, 4);
            data.put("task", pageModel.getTotal());
            // 查询我的金额
            data.put("money", employee.getMoney());
            // 查询我的名称
            data.put("name", employee.getName());
            return ResultUtils.success(data);
        }
        return ResultUtils.error();
    }

}
