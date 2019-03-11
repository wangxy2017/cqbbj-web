package com.cqbbj.wx;

import com.cqbbj.core.base.BaseController;
import com.cqbbj.core.base.Result;
import com.cqbbj.core.util.CommUtils;
import com.cqbbj.core.util.DateUtils;
import com.cqbbj.core.util.ResultUtils;
import com.cqbbj.core.util.SmsUtils;
import com.cqbbj.entity.Code;
import com.cqbbj.entity.Customer;
import com.cqbbj.service.ICodeService;
import com.cqbbj.service.ICustomerService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;

@Controller
@RequestMapping("/wx/login")
public class WXLoginController extends BaseController {


    @Autowired
    private ICodeService codeService;// 验证码业务

    @Autowired
    private ICustomerService customerService;// 用户业务层


    /**
     * 手机号注册
     *
     * @param phone
     * @param code
     * @return
     */
    @RequestMapping("/regist")
    @ResponseBody
    public Result regist(String phone, String code,String name ) {
        if (StringUtils.isBlank(phone) || StringUtils.isBlank(code)) {
            return ResultUtils.error(-1, "参数错误");
        }
        // 查询验证码
        Code code1 = codeService.queryCodeByPhone(phone);
        if (code1 == null || !code1.getCode().equals(code)) {
            return ResultUtils.error(-1, "验证码错误");
        }
        if (code1 == null || code1.getEndTime().compareTo(new Date())<0) {
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
        user.setCust_no(CommUtils.getCode("CO"));
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
        System.out.println("验证码是："+newCode);
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
    public Result login(String phone, String code) {
        if (StringUtils.isBlank(phone) || StringUtils.isBlank(code)) {
            return ResultUtils.error(-1, "参数错误");
        }
        Code code1 = codeService.queryCodeByPhone(phone);
        if (code1 == null || !code1.getCode().equals(code)) {
            return ResultUtils.error(-1, "验证码错误");
        }
        // 查询用户信息
        Customer user = customerService.queryByPhone(phone);
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


}
