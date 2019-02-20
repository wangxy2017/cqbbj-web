/**
 * @Description: 登录拦截器(这里用一句话描述这个类的作用)
 * @author wangxy
 * @date 2019/1/27 20:08
 * @version 1.0
 */
package com.cqbbj.interceptor;

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
    private static final String[] rule = {"/resources/","/upload/","/login","/doLogin","/wx/"};

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        // 判断地址中是否存在不需要拦截的路径
        String uri = request.getRequestURI();
        for (int i = 0; i < rule.length; i++) {
            if (uri.indexOf(rule[i]) != -1) {
                return true;
            }
        }
        // 如果路径都需要拦截，则判断是否登陆
        HttpSession session = request.getSession();
        Employee loginUser = (Employee) session.getAttribute("loginUser");
        if (loginUser != null) {
            return true;
        } else {
            response.sendRedirect("/login");
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
