/**
 * @Description: 登录拦截器(这里用一句话描述这个类的作用)
 * @author wangxy
 * @date 2019/1/27 20:08
 * @version 1.0
 */
package com.cqbbj.interceptor;

import com.cqbbj.core.base.WXSession;
import com.cqbbj.core.util.WXSessionUtils;
import com.cqbbj.entity.Employee;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginInterceptor implements HandlerInterceptor {

    /**
     * 配置不需要拦截的路径
     */
    private static final String[] rule = {"/resources/", "/upload/",
            "/login", "/doLogin", "/wx/login/toLogin", "/wx/login/empLogin","/wx/order/onlineOrder"};

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        // 1.判断地址中是否存在不需要拦截的路径,如果存在，则放行
        String uri = request.getRequestURI();
        for (int i = 0; i < rule.length; i++) {
            if (uri.startsWith(rule[i])) {
                return true;
            }
        }
        // 2.判断是否登录
        if (uri.startsWith("/wx/")) {// 判断微信登录
            System.out.println("微信操作：" + uri);
            WXSession session = WXSessionUtils.getSession(request.getParameter("userKey"));
            Employee employee = (Employee) session.get("wxEmpUser");
            if (employee != null) {
                return true;
            } else {
                response.sendRedirect("/wx/login/toLogin");
            }
        } else {// 判断PC登录
            HttpSession session = request.getSession();
            Employee loginUser = (Employee) session.getAttribute("loginUser");
            if (loginUser != null) {
                return true;
            } else {
                response.sendRedirect("/login");
            }
        }
        return false;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
    }
}
