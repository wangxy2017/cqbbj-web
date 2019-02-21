package com.cqbbj.core.base;

import com.cqbbj.entity.Employee;
import com.cqbbj.entity.OperationLog;
import org.apache.log4j.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
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
     * 获取登录信息
     *
     * @param request
     * @return
     */
    protected Employee getLoginUser(HttpServletRequest request) {
        return (Employee) getSession(request).getAttribute("loginUser");
    }

    /**
     * 创建日志
     *
     * @param content
     * @return
     */
    protected OperationLog createLog(HttpServletRequest request, String content) {
        OperationLog log = new OperationLog();
        log.setCreateTime(new Date());
        log.setDeleteStatus(0);
        log.setName(getLoginUser(request).getName());
        log.setContent(content);
        log.setIp(request.getRemoteAddr());
        return log;
    }
}
