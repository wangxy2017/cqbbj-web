package com.cqbbj.core.base;

import com.cqbbj.core.util.WXSessionUtils;
import com.cqbbj.entity.Customer;
import com.cqbbj.entity.Employee;
import com.cqbbj.entity.OperationLog;
import org.apache.log4j.Logger;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author wangxy
 * @version 1.0
 * @ClassName: BaseController
 * @Description: 控制器基类(这里用一句话描述这个类的作用)
 * @date 2019/2/21 14:33
 */
public class BaseController {

    // 日志处理
    protected final Logger log = Logger.getLogger(this.getClass());

    /**
     * 获取session
     *
     * @param request
     * @return
     */
    protected HttpSession getSession(HttpServletRequest request) {
        return request.getSession();
    }

    /**
     * 获取后台员工登录信息
     *
     * @param request
     * @return
     */
    protected Employee getLoginUser(HttpServletRequest request) {
        return (Employee) getSession(request).getAttribute("loginUser");
    }

    /**
     * 获取微信登录员工信息
     *
     * @param request
     * @return
     */
    protected Employee getWXEmpUser(HttpServletRequest request) throws Exception {
        WXSession session = WXSessionUtils.getSession(request.getParameter("userKey"));
        return (Employee) session.get("wxEmpUser");
    }

    /**
     * 获取微信客户登录信息
     *
     * @param request
     * @return
     */
    protected Customer getWXCosUser(HttpServletRequest request) throws Exception {
        WXSession session = WXSessionUtils.getSession(request.getParameter("userKey"));
        return (Customer) session.get("cosEmpUser");
    }

    protected OperationLog createPCLog(HttpServletRequest request, String content) {
        return createLog(getLoginUser(request).getName(), content, request.getRemoteAddr());
    }

    protected OperationLog createWXLog(HttpServletRequest request, String content) throws Exception {
        return createLog(getWXEmpUser(request).getName(), content, request.getRemoteAddr());
    }

    /**
     * 创建日志
     *
     * @param name
     * @param content
     * @param ip
     * @return
     */
    protected OperationLog createLog(String name, String content, String ip) {
        OperationLog log = new OperationLog();
        log.setCreateTime(new Date());
        log.setDeleteStatus(0);
        log.setName(name);
        log.setContent(content);
        log.setIp(ip);
        return log;
    }

    /**
     * 日期类型转换
     *
     * @param binder
     */
    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }
}
