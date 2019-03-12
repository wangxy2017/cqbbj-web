package com.cqbbj.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author wangxy
 * @version 1.0
 * @ClassName: AccessInterceptor
 * @Description: 跨域拦截器(这里用一句话描述这个类的作用)
 * @date 2019/3/12 14:29
 */
public class AccessInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        // 设置：Access-Control-Allow-Origin头，处理Session问题
        response.setHeader("Access-Control-Allow-Origin", request.getHeader("Origin"));
        response.setHeader("Access-Control-Allow-Credentials", "true");
        response.setHeader("P3P", "CP=CAO PSA OUR");
        if (request.getHeader("Access-Control-Request-Method") != null && "OPTIONS".equals(request.getMethod())) {
            response.addHeader("Access-Control-Allow-Methods", "POST,GET,TRACE,OPTIONS");
            response.addHeader("Access-Control-Allow-Headers", "Content-Type,Origin,Accept");
            response.addHeader("Access-Control-Max-Age", "120");
        }
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}
